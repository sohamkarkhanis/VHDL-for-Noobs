----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: AND2 Gate - Dataflow

--    a   |   b   |  y
-- -----------------------
--    0   |   0   |  0
--    0   |   1   |  0
--    1   |   0   |  0
--    1   |   1   |  1
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity and2 is -- '2' denotes an AND gate with 2 inputs
    port (
        a, b : in  std_logic;
        y    : out std_logic);

end and2;

architecture Dataflow of and2 is
begin
    y <= a and b;
end Dataflow;