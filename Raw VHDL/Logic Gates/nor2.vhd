----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: NOR2 Gate - Dataflow

--    a   |   b   |  y
-- ---------------------
--    0   |   0   |  1
--    0   |   1   |  0
--    1   |   0   |  0
--    1   |   1   |  0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor2 is                   
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end nor2;

architecture Dataflow of nor2 is
begin
    y <= a nor b;
end Dataflow;