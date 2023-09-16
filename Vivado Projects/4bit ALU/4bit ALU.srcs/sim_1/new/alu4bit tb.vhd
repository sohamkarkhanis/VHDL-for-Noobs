----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4 bit ALU - Behavioral - testbench
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------------- Testbench for both modelling styles
entity alu4bit_tb is
end alu4bit_tb;
architecture bench of alu4bit_tb is

    component alu4bit
        port (
            a   : in  std_logic_vector(3 downto 0);
            b   : in  std_logic_vector(3 downto 0);
            sel : in  std_logic_vector(2 downto 0);
            y   : out std_logic_vector(3 downto 0)
        );
    end component;
	
    --Inputs
    signal a   : std_logic_vector(3 downto 0) := (others => '0');
    signal b   : std_logic_vector(3 downto 0) := (others => '0');
    signal sel : std_logic_vector(2 downto 0) := (others => '0');
    --Outputs
    signal y   : std_logic_vector(3 downto 0);

begin
    uut : alu4bit port map (
        a   => a,
        b   => b,
        sel => sel,
        y   => y
    );

    process
    begin
        a   <= "1101";
        b   <= "0011";

        sel <= "000"; wait for 100 ns; -- add
        sel <= "001"; wait for 100 ns; -- subtract
        sel <= "010"; wait for 100 ns; -- and
        sel <= "011"; wait for 100 ns; -- nand
        sel <= "100"; wait for 100 ns; -- xor
        sel <= "101"; wait for 100 ns; -- xnor
        sel <= "110"; wait for 100 ns; -- or
        sel <= "111"; wait;            -- output a
    end process;

end bench;