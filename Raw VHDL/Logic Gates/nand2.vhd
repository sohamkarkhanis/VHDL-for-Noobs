----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: NAND2 Gate - Dataflow

--    a   |   b   |  y
-- ----------------------
--    0   |   0   |  1
--    0   |   1   |  1
--    1   |   0   |  1
--    1   |   1   |  0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand2 is                   
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end nand2;

architecture Dataflow of nand2 is
begin
    y <= a nand b;
end Dataflow;