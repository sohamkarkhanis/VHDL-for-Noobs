----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: OR2 Gate - Dataflow

--    a  |  b  |  y
-- -------------------
--    0  |  0  |  0
--    0  |  1  |  1
--    1  |  0  |  1
--    1  |  1  |  1 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or2 is                   
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end or2;

architecture Dataflow of or2 is
begin
    y <= a or b;
end Dataflow;