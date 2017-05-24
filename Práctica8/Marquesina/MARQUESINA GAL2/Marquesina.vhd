library ieee;
use ieee.std_logic_1164.all;

ENTITY Marquesina IS PORT
(
	E : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	CLR, CLK : IN STD_LOGIC;
	DISPLAY : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
);
END Marquesina;

ARCHITECTURE A_Marquesina OF Marquesina IS

CONSTANT LETRA_H : STD_LOGIC_VECTOR (6 DOWNTO 0) := "1001000";		--Letra H
CONSTANT LETRA_O : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000001";		--Letra O
CONSTANT LETRA_L : STD_LOGIC_VECTOR (6 DOWNTO 0) := "1110001";		--Letra L
CONSTANT LETRA_A : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0001000";		--Letra A
CONSTANT NO_LETRA : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000000";		--Ninguna Letra

CONSTANT D0 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "110"; 				--Display Derecho
CONSTANT D1 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "101"; 				--Display Central
CONSTANT D2 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "011"; 				--Display Izquierdo
CONSTANT ND : STD_LOGIC_VECTOR (2 DOWNTO 0) := "111"; 				--Ningún Display

CONSTANT Q0: std_logic_vector(9 downto 0):=ND&NO_LETRA;
CONSTANT Q1: std_logic_vector(9 downto 0):=D0&LETRA_H;
CONSTANT Q2: std_logic_vector(9 downto 0):=D1&LETRA_H;
CONSTANT Q3: std_logic_vector(9 downto 0):=D0&LETRA_O;
CONSTANT Q4: std_logic_vector(9 downto 0):=D2&LETRA_H;
CONSTANT Q5: std_logic_vector(9 downto 0):=D1&LETRA_O;
CONSTANT Q6: std_logic_vector(9 downto 0):=D0&LETRA_L;
CONSTANT Q7: std_logic_vector(9 downto 0):=D2&LETRA_O;
CONSTANT Q8: std_logic_vector(9 downto 0):=D1&LETRA_L;
CONSTANT Q9: std_logic_vector(9 downto 0):=D0&LETRA_A;
CONSTANT Q10: std_logic_vector(9 downto 0):=D2&LETRA_L;
CONSTANT Q11: std_logic_vector(9 downto 0):=D1&LETRA_A;
CONSTANT Q12: std_logic_vector(9 downto 0):=D2&LETRA_A;

BEGIN
	Transicion : PROCESS (CLK, CLR)
	BEGIN
		IF (CLR = '1') THEN
			DISPLAY <= Q0;
		ELSIF (CLK' EVENT AND CLK = '1') THEN 
			CASE DISPLAY IS

				-------------ESTADO 0-------------
				WHEN Q0 =>
					IF (E = "000" OR E = "001") THEN
						DISPLAY <= Q0;
					ELSIF (E = "010") THEN
						DISPLAY <= Q1;
					ELSE 
						DISPLAY <= Q1;
					END IF;

				-------------ESTADO 1-------------
				WHEN Q1 =>
					IF (E = "010") THEN
						DISPLAY <= Q1;
					ELSIF (E = "011") THEN
						DISPLAY <= Q2;
					ELSE 
						DISPLAY <= Q2;
					END IF;

				-------------ESTADO 2-------------
				WHEN Q2 =>
					IF (E = "100") THEN
						DISPLAY <= Q4;
					ELSIF (E = "011") THEN
						DISPLAY <= Q3;
					ELSE 
						DISPLAY <= Q3;
					END IF;

				-------------ESTADO 3-------------
				WHEN Q3 =>
					IF (E = "011") THEN
						DISPLAY <= Q2;
					ELSIF (E = "100") THEN
						DISPLAY <= Q4;
					ELSE 
						DISPLAY <= Q4;
					END IF;

				-------------ESTADO 4-------------
				WHEN Q4 =>
					IF (E = "100") THEN
						DISPLAY <= Q5;
					ELSIF (E = "101") THEN
						DISPLAY <= Q7;
					ELSE 
						DISPLAY <= Q5;
					END IF;

				-------------ESTADO 5-------------
				WHEN Q5 =>
					IF (E = "100") THEN
						DISPLAY <= Q6;
					ELSIF (E = "101") THEN
						DISPLAY <= Q7;
					ELSE 
						DISPLAY <= Q6;
					END IF;

				-------------ESTADO 6-------------
				WHEN Q6 =>
					IF (E = "100") THEN
						DISPLAY <= Q4;
					ELSIF (E = "101") THEN
						DISPLAY <= Q7;
					ELSE 
						DISPLAY <= Q7;
					END IF;

				-------------ESTADO 7-------------
				WHEN Q7 =>
					IF (E = "110") THEN
						DISPLAY <= Q10;
					ELSIF (E = "101") THEN
						DISPLAY <= Q8;
					ELSE 
						DISPLAY <= Q8;
					END IF;	
    
				-------------ESTADO 8-------------
				WHEN Q8 =>
					IF (E = "110") THEN
						DISPLAY <= Q10;
					ELSIF (E = "101") THEN
						DISPLAY <= Q9;
					ELSE 
						DISPLAY <= Q9;
					END IF;	

				-------------ESTADO 9-------------
			    WHEN Q9 =>
					IF (E = "110") THEN
						DISPLAY <= Q10;
					ELSIF (E = "101") THEN
						DISPLAY <= Q7;
					ELSE 
						DISPLAY <= Q10;
					END IF;	

				-------------ESTADO 10-------------
			    WHEN Q10 =>
					IF (E = "110") THEN
						DISPLAY <= Q11;
					ELSIF (E = "111") THEN
						DISPLAY <= Q12;
					ELSE 
						DISPLAY <= Q11;
					END IF;	

				-------------ESTADO 11-------------
				WHEN Q11 =>
					IF (E = "111") THEN
						DISPLAY <= Q12;
					ELSIF (E = "110") THEN
						DISPLAY <= Q10;
					ELSE 
						DISPLAY <= Q12;
					END IF;	

				-------------ESTADO 12-------------
			    WHEN Q12 =>
					IF (E = "111") THEN
						DISPLAY <= Q12;
					ELSIF (E = "000") THEN
						DISPLAY <= Q0;
					ELSE 
						DISPLAY <= Q0;
					END IF;	
				
				-------------OTRO ESTADO-------------
				WHEN OTHERS =>
					DISPLAY <= Q0;
			END CASE;
		END IF;
	END PROCESS Transicion;

END A_Marquesina;
