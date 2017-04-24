library ieee;
USE ieee.std_logic_1164.all;

entity prac51 is port(
	clr,clk,E: in std_logic;
	Q: inout std_logic_vector(6 downto 0)
);
attribute pin_numbers of prac51: entity is
	"clr:2 E:3 Q(6):20 Q(5):19 Q(4):18 Q(3):17 Q(2):16 Q(1):15 Q(0):14 ";
end prac51;

architecture A_prac51 of prac51 is
begin
	process(clk,clr)
		variable aux: std_logic; 
	begin
		if(clr='1') then
			Q<=(others=>'0');
		elsif(clk'event and clk='1') then
			for i in 0 to 6 loop
				aux := '1';
				for j in 0 to i-1 loop
					aux := aux and Q(j);
				end loop;
				Q(i)<= Q(i) xor (E and aux);
			end loop;
		end if;
	end process;
end A_prac51;
