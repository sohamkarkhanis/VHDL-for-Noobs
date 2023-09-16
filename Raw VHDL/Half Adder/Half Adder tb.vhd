----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: Half Adder - Behavioral - testbench
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity HA_tb is
end HA_tb;

architecture bench of HA_tb is

    component HA
        port (
            a, b      : in  std_logic;
            sum, cout : out std_logic
        );
    end component HA;
	
    --Inputs
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    --Outputs
    signal sum  : std_logic;
    signal cout : std_logic;
	
begin

    uut : HA port map(
        a    => a,
        b    => b,
        sum  => sum,
        cout => cout
    );

    process (a, b)
    begin
        a <= not a after 10ns;
        b <= not b after 15ns;
    end process;
	
end bench;