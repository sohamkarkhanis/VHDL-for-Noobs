----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: NOT1 Gate - Dataflow

--  a  |  y
-- ----------
--  0  |  1
--  1  |  0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity not1 is                   
    port (
        a : in  std_logic;
        y : out std_logic
    );
end not1;

architecture Dataflow of not1 is
begin
    y <= not(a);
end Dataflow;