----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: T FlipFlop - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity TFF_tb is
end;

architecture bench of TFF_tb is

    component TFF
        port (
            t, clk  : in  std_logic;
            q, qbar : out std_logic);
    end component;

    signal t, clk  : std_logic;
    signal q, qbar : std_logic;

begin

    uut : TFF port map(
        t    => t,
        clk  => clk,
        q    => q,
        qbar => qbar);

    stim_process : process
    begin

        t <= '1'; wait for 25ns; -- toggle q
        t <= '0'; wait for 20ns; -- hold q
        t <= '1'; wait for 25ns; -- toggle q
        t <= '0'; wait;          -- hold q

    end process stim_process;
    clk_process : process
    begin
        clk <= '1'; wait for 10ns;
        clk <= '0'; wait for 10ns;
    end process clk_process;

end bench;