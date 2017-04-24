library ieee;
use ieee.std_logic_1164.all;

entity MUX is port(
	A,B,ref:in std_logic_vector(2 downto 0);
	sel:in std_logic;
	display:out std_logic_vector(6 downto 0)

);end MUX;

architecture A_MUX of MUX is 
signal sal:std_logic_vector (2 downto 0);
signal c:std_logic_vector (2 downto 0);
begin
	
	--sal <= A when (sel='0') else B;

	--proceso del multiplexor
	process(A,B,sel)
	begin
		if(sel='0') then
			sal <=A;
		else
			sal <= B;
		end if;
	end process;--Proceso multiplexor
	
	c <= "001" when (sal>ref) else
		 "010" when (sal=ref) else
		 "100";

	display <= "0000111" when (c="001") else
			   "0110001" when (c="010") else
			   "0110111";
end A_MUX;
