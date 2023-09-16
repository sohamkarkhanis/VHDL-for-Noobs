----------------------------------------------------------------------------------
-- Engineer: Soham Karkhanis
-- Project Name: 4:1 MUX - Behavioral
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mux41 is
    port (
        a, b, c, d : in  std_logic;
        q          : out std_logic;
        sel        : in  std_logic_vector(1 downto 0)
    );
end mux41;

---------------- USING CASE ---------
architecture behavior1 of mux41 is
begin

    process (sel, a, b, c, d)
    begin

        case sel is
            when "00"   => q   <= a;
            when "01"   => q   <= b;
            when "10"   => q   <= c;
            when "11"   => q   <= d;
            when others => q   <= a;
        end case;

    end process;
end behavior1;

------------------ USING IF --------- generally produces priority-encoded logic, therefore it results in slower circuit overall
--architecture behavior2 of mux41 is
--begin

--    process (sel, a, b, c, d)
--    begin

--        if (sel = "00") then q    <= a;
--        elsif (sel = "01") then q <= b;
--        elsif (sel = "10") then q <= c;
--        else q                    <= d;
--        end if;

--    end process;
--end behavior2;

------------------ USING CONDITIONAL SIG ASSIGNMENT ---------
--architecture behavior3 of mux41 is
--begin

--    q <= a when sel = "00" else
--         b when sel = "01" else
--         c when sel = "10" else
--         d; 

--end behavior3;

------------------ USING SELECTED SIG ASSIGNMENT ---------
--architecture behavior4 of mux41 is
--begin

--    with sel select
--        q <= a when "00",
--			 b when "01",
--			 c when "10",
--			 d when "11",
--			 a when others;

--end behavior4;