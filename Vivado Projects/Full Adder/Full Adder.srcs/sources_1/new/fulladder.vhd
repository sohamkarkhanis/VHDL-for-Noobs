----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: Full Adder - Dataflow
----------------------------------------------------------------------------------
library IEEE;
use IEEE.Std_logic_1164.all;

entity FA is
    port (
        a, b, cin : in  std_logic;
        sum, cout : out std_logic
    );
end FA;

architecture dataflow of FA is
begin
    sum  <= cin xor a xor b;
    cout <= (a and b) or (cin and (a xor b));
end dataflow;