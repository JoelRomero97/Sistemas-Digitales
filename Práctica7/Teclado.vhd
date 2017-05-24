library ieee;
use ieee.std_logic_1164.all;

entity moore is port(
	l,clk,clr : in std_logic;
	display : out std_logic_vector(6 downto 0);
	Columna : inout std_logic_vector(2 downto 0);
	fila: in std_logic_vector(3 downto 0)
);
attribute pin_numbers of moore: entity is
		"Columna(0):21 Columna(1):22 Columna(2):23 fila(3):3 fila(2):4 fila(1):5 fila(0):6 l:7 " &
		"display(6):20 display(5):19 display(4):18 display(3):17 display(2):16 display(1):15 display(0):14 " &
		"clr:2";
end moore;
architecture A_moore of moore is
	signal d: std_logic_vector(6 downto 0);
begin
	--contador de anillo
	process(clk,clr)
	begin
		if(clr='1') then
			Columna<="100";
		elsif(clk'event and clk='1') then
			case Columna is
				when "100"=> Columna <="010";
				when "010"=> Columna <="001";
				when "001"=> Columna <="100";
				when others=> Columna <="---";
			end case;
		end if;
	end process;
	--decodificador
	process(Columna,fila)
	begin
		case Columna&fila is
			when "1001000"=> d <="1001111";
			when "1000100"=> d <="1001100";
			when "1000010"=> d <="0001110";
			when "1000001"=> d <="0110110";
			when "0101000"=> d <="0010010";
			when "0100100"=> d <="0100100";
			when "0100010"=> d <="0000000";
			when "0100001"=> d <="0000001";
			when "0011000"=> d <="0000110";
			when "0010100"=> d <="0100000";
			when "0010010"=> d <="0000100";
			when "0010001"=> d <="1000001";
			when others=> d <="-------";
		end case;
	end process;
	--registro
	process(clk,clr)
	begin
		if(clr='1') then
			display<=(others=>'0');
		elsif(clk'event and clk='1') then
			if(l='1') then
 		   		display<=d;
			else
				display<=display;
		 	end if;
		end if;			
	end process;
end A_moore;
