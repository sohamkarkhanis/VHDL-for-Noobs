----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4x4 Matrix Keypad Interfacing - Behavioral

-- Columns of the matrix keypad are pulled down to GND
-- The LED port is connected to ULN2803, 8 channel darlington array
-- LEDs are connected in CA mode and are controlled by sinking current into GND by ULN2803
----------------------------------------------------------------------------------

library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_ARITH.all;
use ieee.STD_LOGIC_UNSIGNED.all;
entity keypad4x4 is
    port (
        clk, rst : in  std_logic;
        rowPins  : in  std_logic_vector(3 downto 0);
        colPins  : out std_logic_vector(3 downto 0);
        ledPort  : out std_logic_vector(3 downto 0));
end keypad4x4;
architecture behavioral of keypad4x4 is
    signal ledData : std_logic_vector(3 downto 0);
    type KEY_STATE is (scanCol_1, scanCol_2, scanCol_3, scanCol_4);
    signal systemState : KEY_STATE := scanCol_1;    -- default value, start scanning from 1st column
    type keyLookup is array (0 to 15) of std_logic_vector(3 downto 0);
    constant keyLookupData : keyLookup := (X"0", X"1", X"2", X"3", X"4", X"5", X"6", X"7", X"8", X"9", X"A", X"B", X"C", X"D", X"E", X"F");

begin

    process (clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '0') then
                systemState <= scanCol_1;
            else
                case systemState is
                    when scanCol_1 =>
                        colPins <= "0001"; -- make 1st column HIGH. Thus, depending on which button is pressed, the respective "rowPin" will become HIGH. Refer to the schematic.
                        case rowPins is
                            when "0001" => ledData <= keyLookupData(0);
                            when "0010" => ledData <= keyLookupData(1);
                            when "0100" => ledData <= keyLookupData(2);
                            when "1000" => ledData <= keyLookupData(3);
                            when others => ledData <= keyLookupData(0);
                        end case;
                        systemState <= scanCol_2; -- scan next column now

                    when scanCol_2 =>
                        colPins <= "0010";
                        case rowPins is
                            when "0001" => ledData <= keyLookupData(4);
                            when "0010" => ledData <= keyLookupData(5);
                            when "0100" => ledData <= keyLookupData(6);
                            when "1000" => ledData <= keyLookupData(7);
                            when others => ledData <= keyLookupData(0);
                        end case;
                        systemState <= scanCol_3;

                    when scanCol_3 =>
                        colPins <= "0100";
                        case rowPins is
                            when "0001" => ledData <= keyLookupData(8);
                            when "0010" => ledData <= keyLookupData(9);
                            when "0100" => ledData <= keyLookupData(10);
                            when "1000" => ledData <= keyLookupData(11);
                            when others => ledData <= keyLookupData(0);
                        end case;
                        systemState <= scanCol_4;

                    when scanCol_4 =>
                        colPins <= "1000";
                        case rowPins is
                            when "0001" => ledData <= keyLookupData(12);
                            when "0010" => ledData <= keyLookupData(13);
                            when "0100" => ledData <= keyLookupData(14);
                            when "1000" => ledData <= keyLookupData(15);
                            when others => ledData <= keyLookupData(0);
                        end case;
                        systemState <= scanCol_1;
                end case;
            end if;
        end if;
    end process;

    ledPort <= ledData;

end behavioral;