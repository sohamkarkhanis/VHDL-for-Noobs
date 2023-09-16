----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 2:1 MUX - Structural - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux21_tb is
end;

architecture bench of mux21_tb is

    component mux21
        port (
            a, b: in  std_logic;
            q          : out std_logic;
            sel        : in  std_logic
        );
    end component;

    signal a, b : std_logic;
    signal q : std_logic;
    signal sel : std_logic;

begin

    uut : mux21 port map(
        a   => a,
        b   => b,
        q   => q,
        sel => sel);

    stim_process : process
    begin
        a   <= '1';
        b   <= '0';

        sel <= '0'; wait for 20ns;
        sel <= '1'; wait for 20ns;
    end process stim_process;

end bench;