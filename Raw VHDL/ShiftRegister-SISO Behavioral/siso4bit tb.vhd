----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: ShiftRegister SISO - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity siso4bit_tb is
end;

architecture bench of siso4bit_tb is

    component siso4bit
        port (
            clk, rst, datain : in  std_logic;
            q                : out std_logic
        );
    end component;

    signal clk, rst, datain : std_logic;
    signal q                : std_logic;

begin
    uut : siso4bit port map(
        clk    => clk,
        rst    => rst,
        datain => datain,
        q      => q);

    stim_process : process
    begin
        rst <= '1'; wait for 10ns;
        rst <= '0';
                                      --memory[MSB _  _ LSB]  --output
        datain <= '1'; wait for 20ns; --memory[ 1  0  0  0 ]  --0
        datain <= '1'; wait for 20ns; --memory[ 1  1  0  0 ]  --0 
        datain <= '0'; wait for 20ns; --memory[ 0  1  1  0 ]  --0
        datain <= '1'; wait for 20ns; --memory[ 1  0  1  1 ]  --0
        datain <= '0'; wait for 20ns; --memory[ 0  1  0  1 ]  --1
        datain <= '1'; wait;          --memory[ 1  0  1  0 ]  --1
                        --after 20ns; --memory[ 1  1  0  1 ]  --0
                        --after 20ns; --memory[ 1  1  1  0 ]  --1
                        --after 20ns; --memory[ 1  1  1  1 ]  --0
                        --after 20ns; --memory[ 1  1  1  1 ]  --1                                                                        

    end process stim_process;

    -- clock process
    clk_process : process
    begin
        clk <= '0'; wait for 10ns;
        clk <= '1'; wait for 10ns;
    end process clk_process;

end;