----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Universal Shift Register - Behavioral
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

entity uniShiftReg4 is
    port (
        clk, rst, ser_in : in  std_logic;
        parallel_in      : in  std_logic_vector (3 downto 0);
        sel              : in  std_logic_vector (1 downto 0);
        q                : out std_logic_vector (3 downto 0));
end uniShiftReg4;
architecture Behavioral of uniShiftReg4 is
begin

    process (clk, rst)
        variable qtmp : std_logic_vector(3 downto 0);
    begin
        if rst = '1' then qtmp := "0000";
        elsif (rising_edge(clk)) then
            case sel is
                when "00"   => qtmp := qtmp;                        -- no change
                when "01"   => qtmp := parallel_in;                 -- load from parallel_in
                when "10"   => qtmp := (qtmp(2 downto 0) & ser_in); -- left-shift  : makes 3 LSB of qtmp new MSB, and takes 1 bit from ser_in as new LSB; ['&' used to concat]
                when "11"   => qtmp := (ser_in & qtmp(3 downto 1)); -- right-shift : makes 3 MSB of qtmp new LSB, and puts 1 bit from ser_in as new MSB
                when others => null;
            end case;
        end if;

        q <= qtmp;

    end process;
end Behavioral;