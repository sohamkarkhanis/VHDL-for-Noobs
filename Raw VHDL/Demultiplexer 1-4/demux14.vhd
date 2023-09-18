----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 1:4 Demultiplexer - Behavioral
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity demux14 is
    port (
        ser_in : in  std_logic;
        sel    : in  std_logic_vector(1 downto 0);
        q      : out std_logic_vector(3 downto 0)
    );
end demux14;
architecture Behavioral of demux14 is
begin

    process (ser_in, sel) is
    begin
        case sel is
            when "00" => q <= (ser_in  &  "000");
            when "01" => q <= ('0'     &  ser_in  &  "00");
            when "10" => q <= ("00"    &  ser_in  &  '0');
            when "11" => q <= ("000"   &  ser_in);
        end case;
    end process;

end Behavioral;