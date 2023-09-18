----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: Moore FSM Sequence Detector 1001 - Behavioral
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity seqDetector is
    port (
        clk, rst, seq_in : in  std_logic;
        detector_out     : out std_logic
    );
end seqDetector;

architecture Behavioral of seqDetector is
    type FSM_MOORE is (Zero, One, OneZero, OneZeroZero, OneZeroZeroOne); -- like enums in cpp
    signal currentState, nextState : FSM_MOORE;

begin

    -- process triggered by "clk" and "rst" to control "currentState"
    process (clk, rst)
    begin
        if (rst = '1') then
            currentState <= Zero;
        elsif (rising_edge(clk)) then
            currentState <= nextState;
        end if;
    end process;

    -- process to determine "nextState" of FSM depending on "currentState" and "seq_in"
    process (currentState, seq_in)
    begin

        case(currentState) is
            when Zero =>
            if (seq_in = '1') then nextState <= One;             -- got "1"
            else nextState                   <= Zero;            -- got "0"
            end if;

            when One =>
            if (seq_in = '0') then nextState <= OneZero;         -- got "1 0"
            else nextState                   <= One;             -- got "1 1"
            end if;

            when OneZero =>
            if (seq_in = '0') then nextState <= OneZeroZero;     -- got "10 0"
            else nextState                   <= One;             -- got "10 1"
            end if;

            when OneZeroZero =>
            if (seq_in = '1') then nextState <= OneZeroZeroOne;  -- got "100 1"   
            else nextState                   <= Zero;            -- got "100 0"
            end if;

            -- overlapping sequence detection: 
            when OneZeroZeroOne =>
            if (seq_in = '1') then nextState <= One;             -- got "1001 1"
            else nextState                   <= OneZero;         -- got "1001 0"
            end if;
            
            -- non-overlapping sequence detection: 
            --when OneZeroZeroOne =>
            --if (seq_in = '1') then nextState <= One;             -- got "1001 1"
            --else nextState                   <= Zero;            -- got "1001 0"
            --end if;
			
        end case;
    end process;

    -- process triggered by "currentState" to control "detector_out"
    process (currentState)
    begin
        case currentState is
            when Zero           => detector_out <= '0';
            when One            => detector_out <= '0';
            when OneZero        => detector_out <= '0';
            when OneZeroZero    => detector_out <= '0';
            when OneZeroZeroOne => detector_out <= '1';
        end case;

    end process;
end Behavioral;