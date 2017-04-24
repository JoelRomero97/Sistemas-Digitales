library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity prac52 is port(
	clr,clk,E,L,UD: in std_logic;
	D: in std_logic_vector(4 downto 0);
	Q: inout std_logic_vector(4 downto 0)
);
attribute pin_numbers of prac52: entity is
	"clr:2 E:3 L:4 UD:5 D(4):6 D(3):7 D(2):8 D(1):9 D(0):10 Q(4):18 Q(3):17 Q(2):16 Q(1):15 Q(0):14 ";
end prac52;

architecture A_prac52 of prac52 is
begin
	process(clk,clr)
		variable aux: std_ulogic := '1';
	begin
		if(clr='1') then
			Q<=(others=>'0');
		elsif(clk'event and clk='1') then
			if(E='1' and L='1') then					--CARGA
 		    	Q<=D;
			elsif(E='0') then							--RETENCIÒN
				Q<=Q;
			elsif(E='1' and L='0' and UD='1') then		--ASCENDENTE
				Q<=Q+1;
			elsif(E='1' and L='0' and UD='0') then		--DESCENDENTE
				Q<=Q-1;
		   	end if;
		end if;
	end process;
end A_prac52;
