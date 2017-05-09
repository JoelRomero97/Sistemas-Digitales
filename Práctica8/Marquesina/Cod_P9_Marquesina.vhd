library ieee;
use ieee.std_logic_1164.all;

entity Practica8_Marquesina is
port(clock,clear: in std_logic;
     Enable: in std_logic_vector(2 downto 0);
	 Anodo:inout std_logic_vector(2 downto 0);
	 display: out std_logic_vector(6 downto 0)
	 );
	 
attribute pin_numbers of Practica8_Marquesina: entity is
"clock:1 Enable(0):4 Enable(1):3 Enable(2):2 clear:13"
& " display(0):15 display(1):16 display(2):17 display(3):18 display(4):19 display(5):20 display(6):21"
& " Anodo(2):14 Anodo(1):22 Anodo(0):23";

end Practica8_Marquesina;

architecture A_Marquesina of Practica8_Marquesina is

type estados is (Edo0,Edo1,Edo2,Edo3,Edo4,Edo5,Edo6,Edo7,Edo8,Edo9,Edo10,Edo11,Edo12); --Edo = estado
signal estado_Actual, estado_Siguiente: estados; --Creo una señal de tipo de dato estado
--signal dislay: std_logic_vector(6 downto 0);

--Anodos
constant Anodo0: std_logic_vector(2 downto 0) := "110"; --D0
constant Anodo1: std_logic_vector(2 downto 0) := "101"; --D1
constant Anodo2: std_logic_vector(2 downto 0) := "011"; --D2
constant Ningun_Anodo: std_logic_vector(2 downto 0) := "111"; --ND

--Letras
constant Letra_H : std_logic_vector(6 downto 0) := "1001000";
constant Letra_O : std_logic_vector(6 downto 0) := "0000001";
constant Letra_L : std_logic_vector(6 downto 0) := "1110001";
constant Letra_A : std_logic_vector(6 downto 0) := "0001000";
constant Ninguna_Letra: std_logic_vector(6 downto 0) := "0000000";

begin
	process(clear,clock)
	begin	
		if(clear = '1') then
			estado_Actual <= Edo0;
			
		elsif(clock'event and clock = '1') then
			estado_Actual <= estado_Siguiente;
		end if;
	end process;
	
	process(estado_Actual,Enable)
	begin
		case (estado_Actual) is
			when Edo0 =>
						display <= Ninguna_Letra;
						Anodo <= Ningun_Anodo;
						
						if(Enable = "000" or Enable = "001") then
							estado_Siguiente <= Edo0;
						elsif(Enable = "010") then
						--else
							estado_Siguiente <= Edo1;
						end if;
			when Edo1 =>
						display <= Letra_H;
						Anodo <= Anodo0;
						
						if(Enable = "010") then
							estado_Siguiente <= Edo1;
						elsif(Enable = "011") then
						--else
							estado_Siguiente <= Edo2;
						end if;
			when Edo2 =>
						display <= Letra_H;
						Anodo <= Anodo1;
						
						if(Enable = "011") then
							estado_Siguiente <= Edo3;
						elsif(Enable = "100") then
						--else
							estado_Siguiente <= Edo4;
						end if;
			when Edo3 =>
						display <= Letra_O;
						Anodo <= Anodo0;
						
						if(Enable = "011") then
							estado_Siguiente <= Edo2;
						elsif(Enable = "100") then
						--else
							estado_Siguiente <= Edo4;
						end if;
			when Edo4 => 
						display <= Letra_H;
						Anodo <= Anodo2;
						
						if(Enable = "100") then
							estado_Siguiente <= Edo5;
						elsif(Enable = "101") then
						--else
							estado_Siguiente <= Edo7;
						end if;
			when Edo5 =>
						display <= Letra_O;
						Anodo <= Anodo1;
						
						if(Enable = "100") then
							estado_Siguiente <= Edo6;
						elsif(Enable = "101") then
						--else
							estado_Siguiente <= Edo7;
						end if;
			when Edo6 =>
						display <= Letra_L;
						Anodo <= Anodo0;
						
						if(Enable = "100") then
							estado_Siguiente <= Edo2;
						elsif(Enable = "101") then
						--else
							estado_Siguiente <= Edo7;
						end if;
			when Edo7 =>
						display <= Letra_O;
						Anodo <= Anodo2;
						
						if(Enable = "101") then
							estado_Siguiente <= Edo8;
						elsif(Enable = "110") then
						--else
							estado_Siguiente <= Edo10;
						end if;
			when Edo8 => 
						display <= Letra_L;
						Anodo <= Anodo1;
						
						if(Enable = "101") then
							estado_Siguiente <= Edo9;
						elsif(Enable = "110") then
						--else
							estado_Siguiente <= Edo10;
						end if;
			when Edo9 =>
						display <= Letra_A;
						Anodo <= Anodo0;
						
						if(Enable = "101") then
							estado_Siguiente <= Edo7;
						elsif(Enable = "110") then
						--else
							estado_Siguiente <= Edo10;
						end if;
			when Edo10 =>
						display <= Letra_L;
						Anodo <= Anodo2;
						
						if(Enable <= "110") then
							estado_Siguiente <= Edo11;
						elsif(Enable = "111") then
						--else
							estado_Siguiente <= Edo12;
						end if;
			when Edo11 =>
						display <= Letra_A;
						Anodo <= Anodo1;
						
						if(Enable = "110") then
							estado_Siguiente <= Edo10;
						elsif(Enable = "111") then
						--else
							estado_Siguiente <= Edo12;
						end if;
			when Edo12 =>
						display <= Letra_A;
						Anodo <= Anodo2;
						
						if(Enable = "111") then
							estado_Siguiente <= Edo12;
						elsif(Enable = "000") then
						--else
							estado_Siguiente <= Edo0;
						end if;
			when others =>
						display <= Ninguna_Letra;
						Anodo <= Ningun_Anodo;
						estado_Siguiente <= Edo0;
		end case;
	end process;

	--d <= display;

end A_Marquesina;