----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: ShiftRegister SIPO - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sipo4bit_tb is
end;

architecture bench of sipo4bit_tb is

    component sipo4bit
        port (
            clk, rst, datain : in  std_logic;
            q                : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk, rst, datain : std_logic;
    signal q                : std_logic_vector(3 downto 0);

begin

    uut : sipo4bit port map(
        clk    => clk,
        rst    => rst,
        datain => datain,
        q      => q);

    stim_process : process
    begin
        rst <= '1'; wait for 10ns;
        rst <= '0';
                                      --memory[MSB _  _ LSB]  --q
        datain <= '1'; wait for 20ns; --memory[ 1  0  0  0 ]  --1000
        datain <= '1'; wait for 20ns; --memory[ 1  1  0  0 ]  --1100 
        datain <= '0'; wait for 20ns; --memory[ 0  1  1  0 ]  --0110
        datain <= '1'; wait for 20ns; --memory[ 1  0  1  1 ]  --1011
        datain <= '0'; wait for 20ns; --memory[ 0  1  0  1 ]  --0101
        datain <= '1'; wait;          --memory[ 1  0  1  0 ]  --1010
                        --after 20ns; --memory[ 1  1  0  1 ]  --1101
                        --after 20ns; --memory[ 1  1  1  0 ]  --1110
                        --after 20ns; --memory[ 1  1  1  1 ]  --1111
                        --after 20ns; --memory[ 1  1  1  1 ]  --1111

    end process stim_process;
    clk_process : process
    begin
        clk <= '0'; wait for 10ns;
        clk <= '1'; wait for 10ns;
    end process clk_process;

end;