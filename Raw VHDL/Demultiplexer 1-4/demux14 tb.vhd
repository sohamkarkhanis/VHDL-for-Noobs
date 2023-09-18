----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 1:4 Demultiplexer - Behavioral - testbench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity demux14_tb is
end;

architecture bench of demux14_tb is

    component demux14
        port (
            ser_in : in  std_logic;
            sel    : in  std_logic_vector(1 downto 0);
            q      : out std_logic_vector(3 downto 0)
        );
    end component;

    signal ser_in : std_logic;
    signal sel    : std_logic_vector(1 downto 0);
    signal q      : std_logic_vector(3 downto 0);

begin

    uut : demux14 port map(
        ser_in => ser_in,
        sel    => sel,
        q      => q);

    stim_process : process
    begin
        ser_in <= '1';
        sel    <= "00"; wait for 20ns;
        sel    <= "01"; wait for 20ns;
        sel    <= "10"; wait for 20ns;
        sel    <= "11"; wait;
    end process stim_process;

end;