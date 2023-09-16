----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: JK FlipFlop - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity JKFF_tb is
end;

architecture bench of JKFF_tb is

    component JKFF
        port (
            j, k, clk : in  std_logic;
            q, qbar   : out std_logic);
    end component;

    signal j, k, clk : std_logic;
    signal q, qbar   : std_logic;

begin

    uut : JKFF port map(
        j    => j,
        k    => k,
        clk  => clk,
        q    => q,
        qbar => qbar);

    stim_process: process
    begin
        j <= '1'; k <= '1'; wait for 25ns;
        j <= '0'; k <= '0'; wait for 20ns;
        j <= '0'; k <= '1'; wait for 25ns;
        j <= '1'; k <= '0'; wait for 20ns;
        j <= '1'; k <= '1'; wait;
    end process stim_process;
    
    
    clk_process: process
    begin
        clk <= '1'; wait for 10ns;
        clk <= '0'; wait for 10ns;
    end process clk_process;

end bench;