library ieee;
USE ieee.std_logic_1164.all;

entity moore is port(
	l,clk,clr : in std_logic;
	display : out std_logic_vector(6 downto 0);
	Q : inout std_logic_vector(2 downto 0);
	teclado: in std_logic_vector(3 downto 0)
);
attribute pin_numbers of moore: entity is
		"Q(0):21 Q(1):22 Q(2):23 teclado(3):3 teclado(2):4 teclado(1):5 teclado(0):6 l:7 " &
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
			Q<="100";
		elsif(clk'event and clk='1') then
			case Q is
				when "100"=> Q <="010";
				when "010"=> Q <="001";
				when "001"=> Q <="100";
				when others=> Q <="---";
			end case;
		end if;
	end process;
	--decodificador
	process(Q,teclado)
	begin
		case Q&teclado is
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
