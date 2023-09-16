----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 2:1 MUX - Structural
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux21 is
     port(
         a,b : in STD_LOGIC;
         sel : in STD_LOGIC;
         q : out STD_LOGIC
         );
end mux21;

architecture structural of mux21 is   
component and2 is
    port (a : in STD_LOGIC;
          b : in  std_logic;
          y : out STD_LOGIC
          );
end component and2;   

component or2 is
    port (a : in STD_LOGIC;
    b : in  std_logic;
          y : out STD_LOGIC
          );
end component or2;   

component not1 is
    port (a : in STD_LOGIC;   
          y : out STD_LOGIC
          );
end component not1;   

signal m : std_logic;
signal n : std_logic;
signal o : std_logic;

begin   
   
    notgate1 : not1 port map (a => sel, y => m);
    andgate1 : and2 port map (a => a, b => m, y => n);
    andgate2 : and2 port map (a => sel, b => b, y => o);
    orgate1 : or2 port map (a => n, b => o, y => q);
 
end structural;      