----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: Moore FSM Sequence Detector 1001 - Behavioral - testbench
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity seqDetector_tb is
end seqDetector_tb;

architecture behavior of seqDetector_tb is

    component seqDetector
        port (
            clk          : in  std_logic;
            rst          : in  std_logic;
            seq_in       : in  std_logic;
            detector_out : out std_logic
        );
    end component;
	
    --Inputs
    signal clk            : std_logic := '0';
    signal rst            : std_logic := '0';
    signal seq_in         : std_logic := '0';
    --Outputs
    signal detector_out   : std_logic;

begin

    uut : seqDetector port map(
        clk          => clk,
        rst          => rst,
        seq_in       => seq_in,
        detector_out => detector_out
    );

    -- clock process 
    clk_process : process
    begin
        clk <= '0'; wait for 5ns;
        clk <= '1'; wait for 5ns;
    end process clk_process;
	
	
    -- stimulus process
    stim_process : process
    begin

        seq_in <= '0';
        rst    <= '1'; wait for 30 ns;
        rst    <= '0';

        seq_in <= '1'; wait for 10 ns;
        seq_in <= '0'; wait for 10 ns;
        seq_in <= '1'; wait for 10 ns;
        seq_in <= '0'; wait for 10 ns;
        seq_in <= '0'; wait for 10 ns;
		seq_in <= '1'; wait for 10 ns; -- detector_out HIGH
		seq_in <= '0'; wait for 10 ns;
		seq_in <= '0'; wait for 10 ns;
        seq_in <= '1'; wait;           -- detector_out HIGH
    end process stim_process;

end;