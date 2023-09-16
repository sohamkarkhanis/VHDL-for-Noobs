----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: XOR2 Gate - Dataflow

--    a   |   b   |  y
-- ----------------------
--    0   |   0   |  0
--    0   |   1   |  1
--    1   |   0   |  1
--    1   |   1   |  0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xor2 is                   
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end xor2;

architecture Dataflow of xor2 is
begin
    y <= a xor b;
end Dataflow;