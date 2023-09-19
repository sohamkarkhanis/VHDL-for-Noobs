----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: ShiftRegister SISO - Behavioral 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity siso4bit is
    port (
        clk, rst, datain : in  std_logic;
        q                : out std_logic
    );
end siso4bit;
architecture Behavioral of siso4bit is
    signal memory : std_logic_vector(3 downto 0) := "0000"; --init all bits to '0'
begin

    process (clk, datain, rst) is
    begin
        if (rst = '1') then --since rst condition is outside the rising_edge(clk) condition, it is an asynchronous reset
            memory <= "0000";
        elsif (rising_edge (clk)) then
            q      <= memory(0);                     --shift out LSB
            memory <= (datain & memory(3 downto 1)); --concat new data bit to MSB 
        end if;
    end process;

end Behavioral;