library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY MarquesinaROM1 IS PORT
(
	CLR, CLK: IN STD_LOGIC;
	DIR: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	DISPLAY: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
	AN: INOUT STD_LOGIC_VECTOR (2 DOWNTO 0)
);
ATTRIBUTE PIN_NUMBERS OF MarquesinaROM1: ENTITY IS
	"CLR:2 DIR(2):3 DIR(1):4 DIR(0):5 AN(2):23 AN(1):22 AN(0):21 " &
	"DISPLAY(6):20 DISPLAY(5):19 DISPLAY(4):18 DISPLAY(3):17 DISPLAY(2):16 DISPLAY(1):15 DISPLAY(0):14 ";
END MarquesinaROM1;

ARCHITECTURE A_MarquesinaROM1 OF MarquesinaROM1 IS
	CONSTANT d: STD_LOGIC_VECTOR(6 DOWNTO 0):="1000010";
	CONSTANT i: STD_LOGIC_VECTOR(6 DOWNTO 0):="1001111";
	CONSTANT s: STD_LOGIC_VECTOR(6 DOWNTO 0):="0100100";
	CONSTANT e: STD_LOGIC_VECTOR(6 DOWNTO 0):="0110000";
	CONSTANT n: STD_LOGIC_VECTOR(6 DOWNTO 0):="1101010";
	CONSTANT o: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000001";
	CONSTANT g: STD_LOGIC_VECTOR(6 DOWNTO 0):="1111110";

	TYPE Memoria IS ARRAY(0 TO 7) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
	CONSTANT ROM0: Memoria:=(d,i,s,e,n,o,g,g);
	CONSTANT ROM1: Memoria:=(g,d,i,s,e,n,o,g);
	CONSTANT ROM2: Memoria:=(g,g,d,i,s,e,n,o);

	SIGNAL D0: STD_LOGIC_VECTOR(6 DOWNTO 0);		--Display derecho
	SIGNAL D1: STD_LOGIC_VECTOR(6 DOWNTO 0);		--Display central
	SIGNAL D2: STD_LOGIC_VECTOR(6 DOWNTO 0);		--Display izquierdo
BEGIN
		--CONTADOR DE ANILLO
		ContadorAnillo : PROCESS (CLK, CLR)
		BEGIN 
				IF (CLR = '1') THEN
					AN <= "110";
				ELSIF (CLK'EVENT AND CLK = '1') THEN
					CASE AN IS
						WHEN "110" => AN <= "101";
						WHEN "101" => AN <= "011";
						WHEN "011" => AN <= "110";
						WHEN OTHERS => AN <= "---";
					END CASE;
				END IF;
		END PROCESS ContadorAnillo;

		--MULTIPLEXOR DE MEMORIA
		MuxMemoria : PROCESS (DIR)
		BEGIN
				D0 <= ROM0 (conv_integer (DIR));
				D1 <= ROM1 (conv_integer (DIR));
				D2 <= ROM2 (conv_integer (DIR));
		END PROCESS MuxMemoria;

		--MULTIPLEXOR DE SALIDA
		MuxDisplay : PROCESS (AN, D0, D1, D2)
		BEGIN
				IF (AN = "110") THEN
					DISPLAY <= D0;
				ELSIF (AN = "101") THEN
					DISPLAY <= D1;
				ELSIF (AN = "011") THEN
					DISPLAY <= D2;
				END IF;
		END PROCESS MuxDisplay;
END A_MarquesinaROM1;