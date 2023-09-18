----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Binary Up-Counter - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity bin4counter_tb is
end;

architecture bench of bin4counter_tb is
    component bin4counter
        port (
            rst, clk : in  std_logic;
            q        : out std_logic_vector(3 downto 0));
    end component;

    signal rst, clk : std_logic := '0';
    signal q        : std_logic_vector(3 downto 0);

begin

    uut : bin4counter port map(
        rst => rst,
        clk => clk,
        q   => q);

    ----------------------------------------------------- 2 separate processes
    -- clock process
    clk_process : process
    begin
        clk <= '0'; wait for 10ns;
        clk <= '1'; wait for 10ns;
    end process;

    -- stimulus process
    stim_process : process
    begin
        rst <= '1'; wait for 20ns;
        rst <= '0'; wait;
    end process;
    
end;
