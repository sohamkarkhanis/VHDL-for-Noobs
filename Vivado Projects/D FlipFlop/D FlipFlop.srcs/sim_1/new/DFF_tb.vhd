----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: D FlipFlop - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

-- Uncomment the testbench which you wish to simulate!

------------------------------------------------ testbench of DFF without reset
--entity DFF_tb is
--end;

--architecture bench of DFF_tb is

--    component DFF
--        port (
--            q, qbar : out std_logic;
--            clk, d  : in  std_logic
--        );
--    end component;

--    signal q, qbar : std_logic;
--    signal clk, d  : std_logic;
--begin

--    uut : DFF port map(
--        q    => q,
--        qbar => qbar,
--        clk  => clk,
--        d    => d);

--    stim_process : process
--    begin

--        d <= '1';
--        wait for 50ns;
--        d <= '0';
--        wait;

--    end process;

--    clk_process : process
--    begin

--        clk <= '1';
--        wait for 10ns;
--        clk <= '0';
--        wait for 10ns;

--    end process;

--end;

------------------------------------------------ testbench of DFF with Synchronous Reset
entity DFF_SyncReset_tb is
end;

architecture bench of DFF_SyncReset_tb is

    component DFF_SyncReset
        port (
            q, qbar     : out std_logic;
            clk, rst, d : in  std_logic
        );
    end component;

    signal q, qbar     : std_logic;
    signal clk, d, rst : std_logic;
begin

    uut : DFF_SyncReset port map(
        q    => q,
        qbar => qbar,
        clk  => clk,
        rst  => rst,
        d    => d);

    stim_process : process
    begin

        rst <= '1';
        wait for 30ns;
        rst <= '0';
        d   <= '1';
        wait for 45ns;
        d <= '0';
        wait;

    end process;

    clk_process : process
    begin

        clk <= '1';
        wait for 10ns;
        clk <= '0';
        wait for 10ns;

    end process;

end;