library ieee;
use ieee.std_logic_1164.all;

entity Practica6_C_2_Mi_Nombre_Usando_Contador is
port( clock, clear, enable: in std_logic;
	  display: out std_logic_vector(6 downto 0) );

attribute pin_numbers of Practica6_C_2_Mi_Nombre_Usando_Contador: entity is
"clock:1 clear:13 enable:2"
& " display(0):15 display(1):16 display(2):17 display(3):18 display(4):19 display(5):20 display(6):21";
--& " display(0):21 display(1):20 display(2):19 display(3):18 display(4):17 display(5):16 display(6):15";
--display(0):g display(1):f display(2):e display(3):d display(4):c display(5):b display(6):a

end Practica6_C_2_Mi_Nombre_Usando_Contador;

architecture A_Practica6_C_Mensaje of Practica6_C_2_Mi_Nombre_Usando_Contador is

--Etiquetas
constant Etiqueta0 : std_logic_vector(1 downto 0) := "00";
constant Etiqueta1 : std_logic_vector(1 downto 0) := "01";
constant Etiqueta2 : std_logic_vector(1 downto 0) := "10";

--Simbolos (letras)
constant Letra_O : std_logic_vector(6 downto 0) := "0000001"; 
constant Letra_M : std_logic_vector(6 downto 0) := "1001000";
constant Letra_A : std_logic_vector(6 downto 0) := "0001000";
constant Letra_R : std_logic_vector(6 downto 0) := "1111010";
constant Letra_F : std_logic_vector(6 downto 0) := "0111000";
constant Letra_E : std_logic_vector(6 downto 0) := "0110000";
constant Letra_J : std_logic_vector(6 downto 0) := "1000111";
constant Letra_I : std_logic_vector(6 downto 0) := "1001111";
constant Letra_L : std_logic_vector(6 downto 0) := "1110001";
constant Letra_S : std_logic_vector(6 downto 0) := "0100100";


--Estados
--Usando un código definido por el usuario el cual es el numero en cod de display 7 seg y es diferente para cada uno por lo que lo puedo usar asi.

constant Estado0 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_O; --"000000001"; 
constant Estado1 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_M; --"001001000"; 
constant Estado2 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_A; --"000001000"; 
constant Estado3 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_R; --"001111010"; 
constant Estado4 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_F; --"000111000"; 
constant Estado5 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_L; --"001110001"; 
constant Estado6 : std_logic_vector(8 downto 0) := Etiqueta1 & Letra_O; --"010000001"; 
constant Estado7 : std_logic_vector(8 downto 0) := Etiqueta1 & Letra_R; --"011111000"; 
constant Estado8 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_E; --"000110000";
constant Estado9 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_S; --"000100100"; 
constant Estado10 : std_logic_vector(8 downto 0) := Etiqueta1 & Letra_M; --"011001000"; 
constant Estado11 : std_logic_vector(8 downto 0) := Etiqueta1 & Letra_E; --"010110000"; 
constant Estado12 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_J; --"001000111";
constant Estado13 : std_logic_vector(8 downto 0) := Etiqueta0 & Letra_I; --"001001111";
constant Estado14 : std_logic_vector(8 downto 0) := Etiqueta1 & Letra_A; --"010001000";

--señal

--"salida" hace referencia al cambio de estado y la salida que tiene el estado

signal salida: std_logic_vector(8 downto 0);

begin
	process(clock,clear)
	begin
		if(clear = '1') then
			salida <= Estado0;
			
		elsif(clock'event and clock = '1') then
			if(enable = '1') then
				case (salida) is
					when Estado0 => salida <= Estado1;
					when Estado1 => salida <= Estado2;
					when Estado2 => salida <= Estado3;
					when Estado3 => salida <= Estado4;
					when Estado4 => salida <= Estado5;
					when Estado5 => salida <= Estado6;
					when Estado6 => salida <= Estado7;
					when Estado7 => salida <= Estado8;
					when Estado8 => salida <= Estado9;
					when Estado9 => salida <= Estado10;
					when Estado10 => salida <= Estado11;
					when Estado11 => salida <= Estado12;
					when Estado12 => salida <= Estado13;
					when Estado13 => salida <= Estado14;
					when Estado14 => salida <= Estado0;
					when others => salida <= Estado0;
				end case;
			end if;
		end if;
	end process;
	
	display <= salida(6 downto 0);

end A_Practica6_C_Mensaje;