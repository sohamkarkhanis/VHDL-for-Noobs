----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: ShiftRegister SIPO - Behavioral 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sipo4bit is
    port (
        clk, rst, datain : in  std_logic;
        q                : out std_logic_vector(3 downto 0)
    );
end sipo4bit;

architecture Behavioral of sipo4bit is
begin

    sipo : process (clk, datain, rst) is
        variable memory : std_logic_vector(3 downto 0) := "0000";
    begin

        if (rst = '1') then memory            := "0000"; --async reset
        elsif (rising_edge (clk)) then memory := (datain & memory(3 downto 1));
        end if;

        q <= memory;

    end process sipo;

end Behavioral;