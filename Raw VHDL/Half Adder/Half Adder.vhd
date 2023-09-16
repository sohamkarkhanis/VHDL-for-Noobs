----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: Half Adder - Dataflow
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity HA is
    port (
        a, b      : in  std_logic;
        sum, cout : out std_logic;
    );
end HA;

architecture Dataflow of HA is
begin
    sum  <= a xor b;
    cout <= a and b;
end Dataflow;