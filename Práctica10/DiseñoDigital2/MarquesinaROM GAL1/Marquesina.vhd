library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY Contador IS PORT
(
	CLR,CLK,E: IN STD_LOGIC;
	Q: OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
);
ATTRIBUTE PIN_NUMBERS OF Contador: ENTITY IS
	"CLR:2 E:3 Q(4):18 Q(3):17 Q(2):16 Q(1):15 Q(0):14 ";

END Contador;

ARCHITECTURE A_Contador OF Contador IS
BEGIN
	PROCESS (CLK, CLR)
	BEGIN
		IF(CLR = '1') THEN
			Q <= (OTHERS => '0');
		ELSIF (CLK'EVENT AND CLK = '1') THEN
			IF (E = '1') THEN
 		    	Q <= Q+1;
		   	END IF;
		END IF;
	END PROCESS;
END A_Contador;