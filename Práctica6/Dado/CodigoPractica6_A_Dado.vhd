library ieee;
use ieee.std_logic_1164.all;

entity Practica6Dado is 
port(clear, clock, enable: in std_logic;
     display: out std_logic_vector(6 downto 0) );
	 
attribute pin_numbers of Practica6Dado: entity is
"clock:1 enable:2 clear:13"
& " display(0):15 display(1):16 display(2):17 display(3):18 display(4):19 display(5):20 display(6):21";
--& " display(0):21 display(1):20 display(2):19 display(3):18 display(4):17 display(5):16 display(6):15 ";
--& " display(0):g display(1):f display(2):e display(3):d display(4):c display(5):b display(6):a ";
end Practica6Dado;

architecture A_Practica6Dado of Practica6Dado is 

--Usando un código definido por el usuario el cual es el numero en cod de display 7 seg y es diferente para cada uno por lo que lo puedo usar asi.

constant Estado0: std_logic_vector(6 downto 0) := "1001111";  --1
constant Estado1: std_logic_vector(6 downto 0) := "0010010";  --2
constant Estado2: std_logic_vector(6 downto 0) := "0000110";  --3
constant Estado3: std_logic_vector(6 downto 0) := "1001100";  --4
constant Estado4: std_logic_vector(6 downto 0) := "0100100";  --5
constant Estado5: std_logic_vector(6 downto 0) := "0100000";  --6

--"salida" hace referencia al cambio de estado y la salida que tiene el estado
signal salida: std_logic_vector(6 downto 0);  

	begin
	process(clock,clear)
	begin
		if(clear = '1') then
			salida <= Estado0;
		
		elsif(clock'event and clock = '1') then
			if(enable = '1') then
				case salida is
					when Estado0 => salida <= Estado1;
					when Estado1 => salida <= Estado2;
					when Estado2 => salida <= Estado3;
					when Estado3 => salida <= Estado4;
					when Estado4 => salida <= Estado5;
					when Estado5 => salida <= Estado0;
					when others => salida <= Estado0;
				end case;
			end if;
		end if;
	end process;
	
	display <= salida;
	
end A_Practica6Dado;