----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: JK FlipFlop - Behavioral

-- 		J K | Action at Q
-- 		---------------
-- 		0 0 | hold previous
-- 		0 1 | clear
-- 		1 0 | set
-- 		1 1 | toggle
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity JKFF is
    port (
        j, k, clk : in  std_logic;
        q, qbar   : out std_logic);
end JKFF;

architecture behavioral of JKFF is
begin

    process (clk)
        variable tmp : std_logic;
    begin
        if (rising_edge(clk)) then
            if (j = '0' and k = '0') then tmp    := tmp;
            elsif (j = '1' and k = '1') then tmp := not tmp;
            elsif (j = '0' and k = '1') then tmp := '0';
            else tmp                             := '1';
            end if;
        end if;

        q    <= tmp;
        qbar <= not tmp;

    end process;
end behavioral;