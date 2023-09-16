----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: SR FlipFlop - Behavioral

--[NOR Gate Logic]
-- 		S R | Action at Q
-- 		---------------
-- 		0 0 | hold previous
-- 		0 1 | reset				(R to reset)
-- 		1 0 | set				(S to set)
-- 		1 1 | race              (forbidden)

-- for SR FF using NAND gates, race condition occurs at S=0, R=0 and
-- no-change condition occurs at S=1, R=1
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SRFF is
    port (
        s, r, clk : in  std_logic;
        q, qbar   : out std_logic);
end SRFF;

architecture behavioral of SRFF is
begin

    process (clk)
        variable tmp : std_logic;
    begin
        if (rising_edge(clk)) then
            if (s = '0' and r = '0') then
                tmp := tmp;
            elsif (s = '1' and r = '1') then
                tmp := 'Z';
            elsif (s = '0' and r = '1') then
                tmp := '0';
            else
                tmp := '1';
            end if;
        end if;

        q    <= tmp;
        qbar <= not tmp;

    end process;
end behavioral;