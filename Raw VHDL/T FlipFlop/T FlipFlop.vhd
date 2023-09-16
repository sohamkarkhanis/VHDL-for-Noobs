----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: T FlipFlop - Behavioral

-- 	     T | Action at Q
-- 		---------------
-- 		 0 | hold previous
-- 		 1 | toggle q

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