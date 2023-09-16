----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: D FlipFlop - Behavioral

-- T FF = J&K shorted of JK FF
-- if (rising_edge(clk) && t == 1) {toggle q}

-- 	   	D | Q  QBAR
-- 		-------------
-- 		1 | 1   0
-- 		0 | 0   1

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TFF is
    port (
        t, clk  : in  std_logic;
        q, qbar : out std_logic);
end TFF;

architecture Behavioral of TFF is
begin
    process (clk)
        variable tmp : std_logic := '0'; -- must initialize the variable
    begin
        if (rising_edge(clk)) then
            if t = '0' then
                tmp := tmp;
            elsif t = '1' then
                tmp := not(tmp);
            end if;
        end if;

        q    <= tmp;
        qbar <= not(tmp);
    end process;

end Behavioral;