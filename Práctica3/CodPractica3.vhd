library ieee;

use ieee.std_logic_1164.all;

entity Practica3 is
port(x: in std_logic;
     clk, clr: in std_logic;
	 an0: out std_logic;
	 dis: out std_logic_vector (6 downto 0));  --lo del display es de entrada y salida

attribute pin_numbers of Practica3: entity is
"clk:1 x:11 "  --pines de entrada
& " clr:13 dis(0):15 dis(1):16 dis(2):17 dis(3):18 dis(4):19 dis(5):20 dis(6):21 an0:14";  --pines de salida 

end Practica3;

architecture a_Practica3 of Practica3 is

--signal s: std_logic_vector(6 downto 0);
signal QA,QB, y: std_logic;
signal DA,DB: std_logic;
signal an1, an2: std_logic;

begin

an0 <= '0';
an1 <= 'Z';
an2 <= 'Z';

    process(clk,clr) --como es un circuito secuencial solo declaro las señales de clk y clr asincronas en la lista sencible
    begin
	     if(clr = '1') then
		    --dis <= "0000000";
			QA <= '0';
			QB <= '0';
		 elsif(clk'event and clk='1') then  --tambien puedo usar : rising_edge(clk)
		 	QA <= (QB and x)or(QA and QB);
			QB <= ((not QA)and x)or (QB and x);
		    --dis <= s; --es la variable que esta en entre el DFA y el display la cual le dara un valor al display
		 end if;
	 end process;

	 y <= QA and  (not QB) and x;
 
	 Deco: process(y)
	begin
		case(y) is
			when '0' => dis <= "0001000";
			when others => dis <= "0110000";
		 end case;
	end process Deco;
	
end a_Practica3;



	--FFDA: process(x,QA,QB)
	--begin
	--	DA <= (QB and x) or (QA and x);
	--end process FFDA;

	--FFDB: process(x,QA,QB)
	--begin
	--	DB <= (not QA) and x;
	--end process FFDB;


