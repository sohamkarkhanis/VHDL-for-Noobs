----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: XNOR2 Gate - Dataflow

--    a   |   b   |  y
-- ----------------------
--    0   |   0   |  1
--    0   |   1   |  0
--    1   |   0   |  0
--    1   |   1   |  1
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xnor2 is                   
    port (
        a, b: in  std_logic;
        y   : out std_logic
    );
end xnor2;

architecture Dataflow of xnor2 is
begin
    y <= a xnor b;
end Dataflow;