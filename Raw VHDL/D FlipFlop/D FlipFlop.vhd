----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: D FlipFlop - Behavioral

-- T FF = J&K shorted of JK FF
-- if (rising_edge(clk) && t == 1) {toggle q}

-- 	   	D | Q  QBAR
-- 		-------------
-- 		1 | 1   0
-- 		0 | 0   1

----------------------------------------------------------------------------------
library IEEE;
use IEEE.Std_logic_1164.all;

-- Uncomment each entity and architecture according to which one you wish to simulate!

------------------------------------------------ DFF without reset 
--entity DFF is
--    port (
--        q, qbar : out std_logic;
--        clk, d  : in  std_logic
--    );
--end DFF;

--architecture Behavioral of DFF is
--begin

--    process (clk)
--        variable tmp : std_logic;
--    begin
--        if (rising_edge(clk)) then tmp := d; -- or say falling_edge(clk) to make it a falling_edge triggered DFF
--        end if;
--        q    <= tmp;
--        qbar <= not tmp;
--    end process;

--end Behavioral;

------------------------------------------------ DFF with Synchronous Reset
------------------ (add the reset condition inside of the rising_edge(clk))
entity DFF_SyncReset is
    port (
        q, qbar     : out std_logic;
        clk, rst, d : in  std_logic
    );
end DFF_SyncReset;

architecture Behavioral of DFF_SyncReset is
begin

    process (clk)
        variable tmp : std_logic;
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then tmp := '0';
                else tmp                := d;
            end if;
        end if;
        q    <= tmp;
        qbar <= not tmp;
    end process;
end Behavioral;

------------------------------------------------ DFF with Asynchronous Reset
------------------ (just add the reset condition outside of the rising_edge(clk))
--entity DFF_AsyncReset is
--    port (
--        q, qbar     : out std_logic;
--        clk, rst, d : in  std_logic
--    );
--end DFF_AsyncReset;

--architecture Behavioral of DFF_AsyncReset is
--begin
--    process (clk, rst)
--        variable tmp : std_logic;
--    begin
--        if (rst = '1') then
--            tmp := '0';
--        elsif (rising_edge(clk)) then
--            tmp := d;
--        end if;
--        q    <= tmp;
--        qbar <= not tmp;
--    end process;
--end Behavioral;