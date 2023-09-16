----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Binary UpDown Counter - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_counters is
end tb_counters;

architecture Behavioral of tb_counters is

    component bin4updowncounter
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            up_down : in  std_logic;
            q       : out std_logic_vector(3 downto 0)
        );
    end component;

    signal rst, clk, up_down : std_logic;
    signal q                 : std_logic_vector(3 downto 0);

begin
    uut : bin4updowncounter port map(
        clk     => clk,
        rst     => rst,
        up_down => up_down,
        q       => q);

    -- clk process
    clk_process : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- stimulus process
    stim_process : process
    begin
        rst     <= '1';
        up_down <= '0';
        wait for 20 ns;
        rst <= '0';
        wait for 300 ns;
        up_down <= '1';
        wait;
    end process;
end Behavioral;