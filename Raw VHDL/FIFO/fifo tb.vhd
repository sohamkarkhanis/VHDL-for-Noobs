----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: FIFO - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity fifo_tb is
end;

architecture bench of fifo_tb is

    component fifo
        port (
            clk, rst                  : in  std_logic;
            data_in                   : in  std_logic_vector (3 downto 0);
            data_out                  : out std_logic_vector (3 downto 0);
            enable_read, enable_write : in  std_logic; -- determine whether to read or write from fifo
            empty, full               : out std_logic  -- flags
        );
    end component;

    signal clk                       : std_logic;
    signal rst                       : std_logic;
    signal data_in, data_out         : std_logic_vector (3 downto 0);
    signal enable_read, enable_write : std_logic;
    signal empty, full               : std_logic;

begin
    uut : fifo port map(
        clk          => clk,
        rst          => rst,
        data_in      => data_in,
        data_out     => data_out,
        enable_read  => enable_read,
        enable_write => enable_write,
        empty        => empty,
        full         => full);
        
        
    -- clock process
    clk_process : process
    begin
        clk <= '0'; wait for 10ns;
        clk <= '1'; wait for 10ns;
    end process;

    -- stimulus process
    stim_process : process
    begin
        enable_read  <= '0';
        enable_write <= '0';

        rst <= '1'; wait for 20ns;
        rst <= '0';

        enable_write <= '1';
        enable_read  <= '0';

        data_in      <= "1011"; wait for 25ns;
        data_in      <= "1101"; wait for 20ns;
        data_in      <= "1110"; wait for 20ns;
        data_in      <= "0011"; wait for 20ns; -- write 4 times, thus making fifo full
        data_in      <= "1111"; wait for 25ns; -- full flag will become high              
        enable_write <= '0';

        enable_read  <= '1'; wait for 50ns; -- now read 3 of them, i.e. make fifo empty
        enable_read  <= '0';                -- disable reading
        enable_write <= '1';                -- since we read some data(3), full flag went low, thus data can be written into memory
        
        -- fifo will be full again after 3 risings of clk since we have disabled enable_read
        wait;

    end process;

end;