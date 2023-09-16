----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Universal Shift Register - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity uniShiftReg4_tb is
end;

architecture bench of uniShiftReg4_tb is

    component uniShiftReg4
        port (
            clk, rst, ser_in : in  std_logic;
            parallel_in      : in  std_logic_vector (3 downto 0);
            sel              : in  std_logic_vector (1 downto 0);
            q                : out std_logic_vector (3 downto 0));
    end component;

    --Input
    signal clk, rst, ser_in : std_logic;
    signal parallel_in      : std_logic_vector (3 downto 0);
    signal sel              : std_logic_vector (1 downto 0);
    --Output
    signal q : std_logic_vector (3 downto 0);

    -- clock stuff
    constant clock_period : time := 10 ns;
    signal stop_the_clock : boolean;

begin

    uut : uniShiftReg4
    port map(
        clk         => clk,
        rst         => rst,
        ser_in      => ser_in,
        parallel_in => parallel_in,
        sel         => sel,
        q           => q);
		
    -- stimulus process
    stim_process : process
    begin

        rst <= '1';
        wait for 5 ns;
        rst <= '0';
        wait for 5 ns;

        parallel_in    <= "1010";
        sel            <= "00"; wait for 20ns;  -- 'q' will have no change
        sel            <= "01"; wait for 20ns;  -- 'q' will be same as "parallel_in"

        ser_in         <= '1';
        sel            <= "10"; wait for 20ns;  -- left-shift, append ser_in to LSB position
        sel            <= "11"; wait for 20ns;  -- right-shift, append ser_in to MSB position
        stop_the_clock <= true;
        wait;
    end process stim_process;

    -- clock process
    clk_process : process
    begin
        while not stop_the_clock loop
            clk <= '0', '1' after clock_period / 2;
            wait for clock_period;
        end loop;
        wait;
    end process clk_process;

end;