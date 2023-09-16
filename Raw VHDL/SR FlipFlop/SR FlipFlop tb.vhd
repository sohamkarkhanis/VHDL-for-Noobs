----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: SR FlipFlop - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SRFF_tb is
end;

architecture bench of SRFF_tb is

    component SRFF
        port (
            s, r, clk : in  std_logic;
            q, qbar   : out std_logic);
    end component;

    signal s, r, clk : std_logic;
    signal q, qbar   : std_logic;

begin

    uut : SRFF port map(
        s    => s,
        r    => r,
        clk  => clk,
        q    => q,
        qbar => qbar);

    stim_process : process
    begin
        s <= '0'; r <= '0'; wait for 20ns; -- initialize
        s <= '0'; r <= '1'; wait for 25ns; -- reset
        s <= '1'; r <= '0'; wait for 20ns; -- set
        s <= '0'; r <= '0'; wait for 20ns; -- hold q at 1
        s <= '0'; r <= '1'; wait for 25ns; -- reset
        s <= '0'; r <= '0'; wait;          -- hold q at 0 then wait infinitiely (kill process)
    end process stim_process;
    clk_process : process
    begin
        clk <= '1'; wait for 10ns;
        clk <= '0'; wait for 10ns;
    end process clk_process;
end;