----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Binary UpDown Counter - Behavioral
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity bin4updowncounter is
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        up_down : in  std_logic; -- count up if 0
        q       : out std_logic_vector(3 downto 0)
    );
end bin4updowncounter;

architecture Behavioral of bin4updowncounter is
    signal count : std_logic_vector(3 downto 0);
begin

    process (clk)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                count <= "0000";
            elsif (up_down = '1') then
                count <= count - '1'; -- count down
            else
                count <= count + '1'; -- count up
            end if;
        end if;
    end process;
    q <= count;

end Behavioral;