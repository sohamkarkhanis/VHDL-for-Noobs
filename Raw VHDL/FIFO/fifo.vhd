----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: FIFO - Behavioral
-- think of the fifo as a *circular queue* and NOT as a linear queue
-- can make a bigger fifo simply by using the 'generic' statement and modifying a few lines


-------- Fundamental FIFO logic --------

-- a fifo is full when:  
-- looped = true  *AND*  writeptr = readptr
-- i.e. writeptr=readptr AT the initial position

-- a fifo is not(full) when:                                            -- we want to be able to write in a fifo only when it is not(full)
-- writeptr != readptr  *OR*  looped = false
-- Demorgan's on full condition: not(a and b) = not(a) or not(b)



-- a fifo is empty when:
-- looped = false  *AND*  writeptr = readptr
-- i.e. writeptr=readptr UNLESS at the initial position

-- a fifo is not(empty) when:                                           -- we want to be able to read from a fifo only when it is not(empty)
-- writeptr != readptr  *OR*  looped = true
-- Demorgan's: not(a and b) = not(a) or not(b)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
entity fifo is
    port (
        clk, rst                  : in  std_logic;
        data_in                   : in  std_logic_vector (3 downto 0);
        data_out                  : out std_logic_vector (3 downto 0);
        enable_read, enable_write : in  std_logic; -- determine whether to read or write from fifo
        empty, full               : out std_logic  -- flags
    );
end fifo;


architecture Behavioral of fifo is
begin

    process (clk)
        type FIFO_Memory is array (0 to 3) of std_logic_vector (3 downto 0); -- basically an array of 4 elements, where each element stores a 4bit value
        variable memory : FIFO_Memory;

        variable writeptr : natural range 0 to 3; -- insert (updates location of queue tail)
        variable readptr  : natural range 0 to 3; -- remove (updates location of queue head)
        variable looped   : boolean;              -- 'True' if writeptr loops around and comes back to the initial position    
        -- instead of a looped variable, we can make writeptr and readptr a 5bit value and compare their MSBs (if MSB(writeptr) /= MSB(readptr) => looped is true)
    begin
        if rising_edge(clk) then
            if rst = '1' then -- sync reset
                writeptr := 0;
                readptr  := 0;
                looped   := false;

                full  <= '0';
                empty <= '1';
            else
                if (enable_read = '1') then
                    if ((looped = true) or (writeptr /= readptr)) then                          -- if fifo not(empty)
                        -- update data_out = data present @(readptr's location)
                        data_out <= memory(readptr);

                        -- then update readptr 
                        if (readptr = 3) then
                            readptr := 0;
                            looped  := false; -- if fifo was full, now it's no longer full

                        else
                            readptr := readptr + 1;
                        end if;
                    end if;
                end if;

                if (enable_write = '1') then
                    if ((looped = false) or (writeptr /= readptr)) then                         -- if fifo not(full)
                        -- write data_in into memory @(writeptr's location)
                        memory(writeptr) := data_in;

                        -- then update writeptr 
                        if (writeptr = 3) then
                            writeptr := 0;
                            looped   := true; -- writeptr has gone around all the way, now back at initial position
                        else
                            writeptr := writeptr + 1;
                        end if;
                    end if;
                end if;

                -- update empty and full flags
                if (writeptr = readptr) then
                    if looped then -- or if ptrs are made bigger, compare MSBs here to check if looped or not
                        full <= '1';
                    else
                        empty <= '1';
                    end if;
                else
                    empty <= '0';
                    full  <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;