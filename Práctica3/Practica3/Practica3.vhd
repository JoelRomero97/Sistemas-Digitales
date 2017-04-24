library ieee;
use ieee.std_logic_1164.all;

entity practica3 is port(
clear, clk: in std_logic;
X: in std_logic;
an: out std_logic;
display: out std_logic_vector(6 downto 0)
);

--attribute pin_numbers of practica3: entity is
--"clk:1 X:5 display(0):21 display(1):20 display(2):19 display(3):18 display(4):17 display(5):16 display(6):15 clear:13 an:14";
end practica3;

architecture Ap3 of practica3 is
signal qa,qb,Sa,Sb,Ra,Rb,Y: std_logic;
begin

process(X,qa,qb)
	begin
	Sa <= (X AND qb)AND (NOT qa);
	Ra <= qa AND qb;
	Sb <= ((qa AND (NOT X)) AND (NOT qb)) OR ((X AND (NOT qa)) AND (NOT qb));
	Rb <= qb;
	 Y <= (((qa) AND (qb)) AND (X)); 
	end process;

	process(clk,clear)
	begin
		if(clear='1')then
			qa<='0';
			qb<='0';
		elsif(clk'event and clk='1') then
			qa<=(not Ra) and (Sa or qa);
			qb<=(not Rb) and (Sb or qb);
		end if;
	end process;

	process(Y)
	begin
		an<='0';
		case Y is
		when '0' => display <="0110000";
		when others => display <="0001000";
    	end case;
	end process;
end architecture;