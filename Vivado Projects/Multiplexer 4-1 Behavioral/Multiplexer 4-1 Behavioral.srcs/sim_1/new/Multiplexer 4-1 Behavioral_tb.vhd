----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4:1 MUX - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux41_tb is
end;

architecture Behavioral of mux41_tb is

    component mux41
        port (
            a, b, c, d : in  std_logic;
            q          : out std_logic;
            sel        : in  std_logic_vector(1 downto 0)
        );
    end component;

    signal a, b, c, d : std_logic;
    signal q          : std_logic;
    signal sel        : std_logic_vector(1 downto 0);

begin

    uut : mux41 port map(
        a   => a,
        b   => b,
        c   => c,
        d   => d,
        q   => q,
        sel => sel);

    stimulus : process
    begin
        a   <= '1';
        b   <= '0';
        c   <= '1';
        d   <= '0';

        sel <= "00"; wait for 20ns;
        sel <= "01"; wait for 20ns;
        sel <= "10"; wait for 20ns;
        sel <= "11"; wait for 20ns;

    end process;

end Behavioral;