----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Ripple Adder - Structural
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RippleAdder4bit is
    port (
        a    : in  std_logic_vector (3 downto 0);
        b    : in  std_logic_vector (3 downto 0);
        cin  : in  std_logic;
        sum  : out std_logic_vector (3 downto 0);
        cout : out std_logic);
end RippleAdder4bit;

architecture Structural of RippleAdder4bit is

    -- define FA as a component here, add "fulladder.vhd" file to design sources and simply port map FA 4 times
    -- Vivado will auto add 4 "fulladder.vhd" files named FA0 to FA3 
    component FA
        port (
            a, b, cin : in  std_logic;
            sum, cout : out std_logic
        );
    end component FA;

    -- carry signals between the full adders
    signal c1, c2, c3 : std_logic;

begin

    -- Port Mapping Full Adder(FA Entity from fulladder.vhd) 4 times
    -- nominal port mapping   
    FA0 : FA port map(a => a(0), b => b(0), cin => cin, sum => sum(0), cout => c1);
    FA1 : FA port map(a => a(1), b => b(1), cin => c1, sum => sum(1), cout => c2);
    FA2 : FA port map(a => a(2), b => b(2), cin => c2, sum => sum(2), cout => c3);
    FA3 : FA port map(a => a(3), b => b(3), cin => c3, sum => sum(3), cout => cout);

    -- or use positional port mapping   
    --    FA1 : FA port map(a(1), b(1), c1, sum(1), c2);
    --    FA2 : FA port map(a(2), b(2), c2, sum(2), c3);
    --    FA3 : FA port map(a(3), b(3), c3, sum(3), cout);

end Structural;