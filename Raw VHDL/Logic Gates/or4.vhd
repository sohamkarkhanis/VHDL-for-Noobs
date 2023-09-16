----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: OR4 Gate - Dataflow
-- HIGH: if atleast 1 input is high   LOW: no input is high
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or4 is                   -- '4' denotes an OR gate with 4 inputs
    port (
        a, b, c, d : in  std_logic;
        y          : out std_logic
    );
end or4;

architecture Dataflow of or4 is
begin
    y <= (a or b or c or d);
end Dataflow;