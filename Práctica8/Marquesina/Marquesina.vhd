library ieee;
use ieee.std_logic_1164.all;

ENTITY Marquesina IS PORT
(
	E : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	CLR, CLK : IN STD_LOGIC;
	DISPLAY : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
	SEL : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
);
END Marquesina;

ARCHITECTURE A_Marquesina OF Marquesina IS

CONSTANT LETRA_H : STD_LOGIC_VECTOR (6 DOWNTO 0) := "1001000";		--Letra H
CONSTANT LETRA_O : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000001";		--Letra O
CONSTANT LETRA_L : STD_LOGIC_VECTOR (6 DOWNTO 0) := "1110001";		--Letra L
CONSTANT LETRA_A : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0001000";		--Letra A
CONSTANT NO_LETRA : STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";		--Ninguna Letra

CONSTANT D0 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "110"; 				--Display Derecho
CONSTANT D1 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "101"; 				--Display Central
CONSTANT D2 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "011"; 				--Display Izquierdo
CONSTANT ND : STD_LOGIC_VECTOR (2 DOWNTO 0) := "111"; 				--Ningún Display

TYPE Estados IS (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12);
SIGNAL Edo_Siguiente, Edo_Presente: Estados;

BEGIN

	Transiciones : PROCESS (Edo_Presente, E)
	BEGIN
			CASE Edo_Presente IS

					-------------ESTADO 0-------------
					WHEN Q0 =>
								DISPLAY <= NO_LETRA;
								SEL <= ND;
								IF (E = "000" OR E = "001") THEN
									Edo_Siguiente <= Q0;
								ELSIF (E = "010") THEN
									Edo_Siguiente <= Q1;
								END IF;

					-------------ESTADO 1-------------
					WHEN Q1 =>
								DISPLAY <= LETRA_H;
								SEL <= D0;
								IF (E = "010") THEN
									Edo_Siguiente <= Q1;
								ELSIF (E = "011") THEN
									Edo_Siguiente <= Q2;
								END IF;

					-------------ESTADO 2-------------
					WHEN Q2 =>
								DISPLAY <= LETRA_H;
								SEL <= D1;
								IF (E = "100") THEN
									Edo_Siguiente <= Q4;
								ELSIF (E = "011") THEN
									Edo_Siguiente <= Q3;
								END IF;

					-------------ESTADO 3-------------
					WHEN Q3 =>
								DISPLAY <= LETRA_O;
								SEL <= D0;
								IF (E = "011") THEN
									Edo_Siguiente <= Q2;
								ELSIF (E = "100") THEN
									Edo_Siguiente <= Q4;
								END IF;

					-------------ESTADO 4-------------
					WHEN Q4 =>
								DISPLAY <= LETRA_H;
								SEL <= D2;
								IF (E = "100") THEN
									Edo_Siguiente <= Q5;
								ELSIF (E = "101") THEN
									Edo_Siguiente <= Q7;
								END IF;

					-------------ESTADO 5-------------
					WHEN Q5 =>
								DISPLAY <= LETRA_O;
								SEL <= D1;
								IF (E = "100") THEN
									Edo_Siguiente <= Q6;
								ELSIF (E = "101") THEN
									Edo_Siguiente <= Q7;
								END IF;

					-------------ESTADO 6-------------
					WHEN Q6 =>
								DISPLAY <= LETRA_L;
								SEL <= D0;
								IF (E = "100") THEN
									Edo_Siguiente <= Q4;
								ELSIF (E = "101") THEN
									Edo_Siguiente <= Q7;
								END IF;

					-------------ESTADO 7-------------
					WHEN Q7 =>
								DISPLAY <= LETRA_O;
								SEL <= D2;
								IF (E = "110") THEN
									Edo_Siguiente <= Q10;
								ELSIF (E = "101") THEN
									Edo_Siguiente <= Q8;
								END IF;	
	    
					-------------ESTADO 8-------------
					WHEN Q8 =>
								DISPLAY <= LETRA_L;
								SEL <= D1;
								IF (E = "110") THEN
									Edo_Siguiente <= Q10;
								ELSIF (E = "101") THEN
									Edo_Siguiente <= Q9;
								END IF;	

					-------------ESTADO 9-------------
				    WHEN Q9 =>
								DISPLAY <= LETRA_A;
								SEL <= D0;
								IF (E = "110") THEN
									Edo_Siguiente <= Q10;
								ELSIF (E = "101") THEN
									Edo_Siguiente <= Q7;
								END IF;	

					-------------ESTADO 10-------------
				    WHEN Q10 =>
								DISPLAY <= LETRA_L;
								SEL <= D2;
								IF (E = "110") THEN
									Edo_Siguiente <= Q11;
								ELSIF (E = "111") THEN
									Edo_Siguiente <= Q12;
								END IF;	

					-------------ESTADO 11-------------
					WHEN Q11 =>
								DISPLAY <= LETRA_A;
								SEL <= D1;
								IF (E = "111") THEN
									Edo_Siguiente <= Q12;
								ELSIF (E = "110") THEN
									Edo_Siguiente <= Q10;
								END IF;	

					-------------ESTADO 12-------------
				    WHEN Q12 =>
								DISPLAY <= LETRA_A;
								SEL <= D2;
								IF (E = "111") THEN
									Edo_Siguiente <= Q12;
								ELSIF (E = "000") THEN
									Edo_Siguiente <= Q0;
								END IF;	
			END CASE;
	END PROCESS Transiciones;

	Transicion : PROCESS (CLK, CLR)
	BEGIN
			IF (CLR = '1') THEN
				Edo_Presente <= Q0;
			ELSIF (CLK' EVENT AND CLK = '1') THEN 
				Edo_Presente <= Edo_Siguiente;
			END IF;
	END PROCESS Transicion;
END A_Marquesina;
