----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4 bit ALU - Behavioral
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

---------------------------------------------------------- Using Case
entity alu4bit is
    port (
        a   : in  std_logic_vector (3 downto 0);
        b   : in  std_logic_vector (3 downto 0);
        sel : in  std_logic_vector (2 downto 0);
        y   : out std_logic_vector (3 downto 0));
end alu4bit;

architecture Behavioral of alu4bit is
begin

    process (a, b, sel)
    begin
        case sel is
            when "000"  => y  <= a + b;
            when "001"  => y  <= a - b;
            when "010"  => y  <= a and b;
            when "011"  => y  <= a nand b;
            when "100"  => y  <= a xor b;
            when "101"  => y  <= a xnor b;
            when "110"  => y  <= a or b;
            when others => y <= a;
        end case;
    end process;

end Behavioral;

---------------------------------------------------------- Using if-then-else
--entity alu4bit is
--    port (
--        a   : in  std_logic_vector (3 downto 0);
--        b   : in  std_logic_vector (3 downto 0);
--        sel : in  std_logic_vector (2 downto 0);
--        y   : out std_logic_vector (3 downto 0));
--end alu4bit;

--architecture Behavioral of alu4bit is
--begin

--    process (a, b, sel)
--    begin

--        if (sel = 000) then y    <= a + b;
--        elsif (sel = 001) then y <= a - b;
--        elsif (sel = 010) then y <= a and b;
--        elsif (sel = 011) then y <= a nand b;
--        elsif (sel = 100) then y <= a xor b;
--        elsif (sel = 101) then y <= a xnor b;
--        elsif (sel = 110) then y <= a or b;
--        else y                   <= a;
--        end if;
--    end process;
--end Behavioral;