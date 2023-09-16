----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: AND3 Gate - Dataflow
-- HIGH: when all inputs high   LOW: otherwise
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity and3 is                   -- '3' denotes an AND gate with 3 inputs
    port (
        a, b, c : in  std_logic;
        y       : out std_logic
    );
end and3;

architecture Dataflow of and3 is
begin
    y <= (a and b and c);
end Dataflow;