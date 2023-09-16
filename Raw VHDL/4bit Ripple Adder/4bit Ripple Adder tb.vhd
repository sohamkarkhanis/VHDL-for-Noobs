----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Ripple Adder - Structural - testbench
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity RippleAdder4bit_tb is
end RippleAdder4bit_tb;

architecture behavior of RippleAdder4bit_tb is

    component RippleAdder4bit
        port (
            a    : in  std_logic_vector(3 downto 0);
            b    : in  std_logic_vector(3 downto 0);
            cin  : in  std_logic;
            sum  : out std_logic_vector(3 downto 0);
            cout : out std_logic
        );
    end component;

    --Inputs
    signal a   : std_logic_vector(3 downto 0) := (others => '0');
    signal b   : std_logic_vector(3 downto 0) := (others => '0');
    signal cin : std_logic                    := '0';
    --Outputs
    signal sum  : std_logic_vector(3 downto 0);
    signal cout : std_logic;

begin

    uut : RippleAdder4bit port map(
        a    => a,
        b    => b,
        cin  => cin,
        sum  => sum,
        cout => cout
    );

    -- stimulus process
    stim_proc : process
    begin

        a <= "0110";
        b <= "1110"; wait for 100 ns;

        a <= "1001";
        b <= "0101"; wait;

    end process;

end;