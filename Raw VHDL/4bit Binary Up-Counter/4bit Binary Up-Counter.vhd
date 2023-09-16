----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4bit Binary Up-Counter - Behavioral
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity bin4counter is
	port (
		rst, clk : in  std_logic;
		q        : out std_logic_vector(3 downto 0));
end bin4counter;

architecture behavioral of bin4counter is
	signal count : std_logic_vector(3 downto 0);
begin
	process (rst, clk)
	begin
		if (rst = '1') then count <= "0000";
		elsif (clk'event and clk = '1') then count <= count + 1;
		end if;
	end process;
	q <= count;
end behavioral;