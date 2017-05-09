library ieee;
use ieee.std_logic_1164.all;

entity Practica8_Marquesina is
port(clock,clear: in std_logic;
     Enable: in std_logic_vector(2 downto 0);
	 Anodo: out std_logic_vector(2 downto 0);
	 display: out std_logic_vector(6 downto 0));
	 
--attribute pin_numbers of Practica8_Marquesina: entity is
--"clock:1 Enable(0):4 Enable(1):3 Enable(2):2 clear:13"
--& " display(0):14 display(1):15 display(2):16 display(3):17 display(4):18 display(5):19 display(6):20"
--& " Anodo(2):21 Anodo(1):22 Anodo(2):23";

end Practica8_Marquesina;

architecture A_Marquesina of Practica8_Marquesina is

--type estados is (Edo0,Edo1,Edo2,Edo3,Edo4,Edo5,Edo6,Edo7,Edo8,Edo9,Edo10,Edo11,Edo12); --Edo = estado
--signal estado_Actual, estado_Siguiente: estados; --Creo una señal de tipo de dato estados

signal estado_Actual: std_logic_vector(9 downto 0);
signal estado_Siguiente: std_logic_vector(9 downto 0);

--Anodos
constant Anodo0: std_logic_vector(2 downto 0) := "110"; --D0
constant Anodo1: std_logic_vector(2 downto 0) := "101"; --D1
constant Anodo2: std_logic_vector(2 downto 0) := "011"; --D2
constant Ningun_Anodo: std_logic_vector(2 downto 0) := "111"; --ND

--Letras
constant Letra_H: std_logic_vector(6 downto 0) := "1001000";
constant Letra_O: std_logic_vector(6 downto 0) := "0000001";
constant Letra_L: std_logic_vector(6 downto 0) := "1110001";
constant Letra_A: std_logic_vector(6 downto 0) := "0001000";
constant Ninguna_Letra: std_logic_vector(6 downto 0) := "0000000";

--___
constant Q0 :std_logic_vector(9 downto 0):=Ningun_Anodo&Ninguna_Letra;
--__H
constant Q1 :std_logic_vector(9 downto 0):=Anodo0&Letra_H;
--_HO
constant Q2 :std_logic_vector(9 downto 0):=Anodo1&Letra_H;
constant Q3 :std_logic_vector(9 downto 0):=Anodo0&Letra_O;
--HOL
constant Q4 :std_logic_vector(9 downto 0):=Anodo2&Letra_H;
constant Q5 :std_logic_vector(9 downto 0):=Anodo1&Letra_O;
constant Q6 :std_logic_vector(9 downto 0):=Anodo0&Letra_L;
--OLA
constant Q7 :std_logic_vector(9 downto 0):=Anodo2&Letra_O;
constant Q8 :std_logic_vector(9 downto 0):=Anodo1&Letra_L;
constant Q9 :std_logic_vector(9 downto 0):=Anodo0&Letra_A;
--LA_
constant Q10 :std_logic_vector(9 downto 0):=Anodo2&Letra_L;
constant Q11 :std_logic_vector(9 downto 0):=Anodo1&Letra_A;
--A__
constant Q12 :std_logic_vector(9 downto 0):=Anodo2&Letra_A;

begin
	process(clear,clock)
	begin	
		if(clear = '1') then
			estado_Actual <= Q0;
			
		elsif(clock'event and clock = '1') then
			estado_Actual <= estado_Siguiente;
		end if;
	end process;

	Anodo <= estado_Actual(9 downto 7);
	display <= estado_Actual(6 downto 0);


	 estado_Siguiente <= Q0 when (Enable = "000") else
						 Q0 when (Enable = "001") else
						 Q1 when (Enable = "010") else
						 Q2 when (Enable = "011") else
						 Q3 when (Enable = "011") else
						 Q4 when (Enable = "100") else
						 Q5 when (Enable = "100") else
						 Q6 when (Enable = "100") else
						 Q7 when (Enable = "101") else
						 Q8 when (Enable = "101") else
						 Q9 when (Enable = "101") else
						 Q10 when (Enable = "110") else
						 Q11 when (Enable = "110") else
					 	 Q12 when (Enable = "111") else
						 Q0;

end A_Marquesina;

--La construcción when-else permite definir paso a paso el comportamiento de un sistema. Para esto, es necesario
--declarar los valores que se le deben asignar a una determinada señal (o grupo) en función de las diferentes
--condiciones de entrada posibles. El orden en el que se declaren las condiciones de entrada, no es importante
--estado_Siguiente <= Q0 when (Enable = "000") else
--						 Q0 when (Enable = "001") else
--						 Q1 when (Enable = "010") else
--						 Q2 when (Enable = "011") else
--						 Q3 when (Enable = "011") else
--						 Q4 when (Enable = "100") else
--						 Q5 when (Enable = "100") else
--						 Q6 when (Enable = "100") else
--						 Q7 when (Enable = "101") else
--						 Q8 when (Enable = "101") else
--						 Q9 when (Enable = "101") else
--						 Q10 when (Enable = "110") else
--						 Q11 when (Enable = "110") else
--					 	 Q12 when (Enable = "111") else
--						 Q0;
