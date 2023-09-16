----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: Full Adder - Behavioral - testbench
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity FA_tb is
end FA_tb;

architecture bench of FA_tb is

    component FA
        port (
            a, b, cin : in  std_logic;
            sum, cout : out std_logic
        );
    end component FA;

    --Inputs
    signal a   : std_logic := '0';
    signal b   : std_logic := '0';
    signal cin : std_logic := '0';
    --Outputs
    signal sum  : std_logic;
    signal cout : std_logic;

begin

    uut : FA port map(
        a    => a,
        b    => b,
        cin  => cin,
        sum  => sum,
        cout => cout
    );

    process (a, b, cin)
    begin
        a   <= not a after 5ns;
        b   <= not b after 10ns;
        cin <= not cin after 15ns;
    end process;

end bench;