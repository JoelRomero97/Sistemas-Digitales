library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY MarquesinaROM2 IS PORT
(
	CLR, CLK : IN STD_LOGIC;
	DIR : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	DISPLAY : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
	AN : INOUT STD_LOGIC_VECTOR (2 DOWNTO 0)
);

ATTRIBUTE PIN_NUMBERS OF MarquesinaROM2: ENTITY IS
	"CLR:2 DIR(3):3 DIR(2):4 DIR(1):5 DIR(0):6 " &
	"AN(2):23 AN(1):22 AN(0):21 ";
END MarquesinaROM2;

ARCHITECTURE A_MarquesinaROM2 OF MarquesinaROM2 IS

	CONSTANT cod_w: STD_LOGIC_VECTOR (3 DOWNTO 0):="0000";
	CONSTANT cod_d: STD_LOGIC_VECTOR (3 DOWNTO 0):="0001";
	CONSTANT cod_i: STD_LOGIC_VECTOR (3 DOWNTO 0):="0011";
	CONSTANT cod_s: STD_LOGIC_VECTOR (3 DOWNTO 0):="0010";
	CONSTANT cod_e: STD_LOGIC_VECTOR (3 DOWNTO 0):="0110";
	CONSTANT cod_n: STD_LOGIC_VECTOR (3 DOWNTO 0):="0111";
	CONSTANT cod_o: STD_LOGIC_VECTOR (3 DOWNTO 0):="0101";
	CONSTANT cod_g: STD_LOGIC_VECTOR (3 DOWNTO 0):="0100";
	CONSTANT cod_t: STD_LOGIC_VECTOR (3 DOWNTO 0):="1100";
	CONSTANT cod_a: STD_LOGIC_VECTOR (3 DOWNTO 0):="1101";				
	CONSTANT cod_l: STD_LOGIC_VECTOR (3 DOWNTO 0):="1111";
	CONSTANT cod_x: STD_LOGIC_VECTOR (3 DOWNTO 0):="1110";

	TYPE Memoria IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
	CONSTANT ROM0: Memoria:=(cod_w,cod_w,cod_d,cod_i,cod_s,cod_e,cod_n,cod_o,cod_w,cod_d,cod_i,cod_g,cod_i,cod_t,cod_a,cod_l);
	CONSTANT ROM1: Memoria:=(cod_w,cod_d,cod_i,cod_s,cod_e,cod_n,cod_o,cod_w,cod_d,cod_i,cod_g,cod_i,cod_t,cod_a,cod_l,cod_w);
	CONSTANT ROM2: Memoria:=(cod_d,cod_i,cod_s,cod_e,cod_n,cod_o,cod_w,cod_d,cod_i,cod_g,cod_i,cod_t,cod_a,cod_l,cod_w,cod_w);

	SIGNAL D0: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL D1: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL D2: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL MOSTRAR: STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	
		--CONTADOR DE ANILLO
		ContadorAnillo : PROCESS (CLK, CLR)
		BEGIN 
				IF (CLR = '1') THEN
					AN <= "110";
				ELSIF (CLK'EVENT AND CLK = '1') THEN
					CASE AN IS
						WHEN "110" => AN <= "101";			--Display derecho
						WHEN "101" => AN <= "011";			--Display central
						WHEN "011" => AN <= "110";			--Display izquierdo
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
		MuxDisplay : PROCESS (AN,D0,D1,D2)
		begin
			IF(AN = "110") THEN
				MOSTRAR <= D0;
			ELSIF (AN = "101") THEN
				MOSTRAR <= D1;
		   	ELSIF (AN = "011") THEN
	 	    	MOSTRAR <= D2;
			ELSE
				MOSTRAR <= cod_x;
			END IF;
		END PROCESS MuxDisplay;

		--CONVERTIDOR
		Convertidor : PROCESS (MOSTRAR)
		BEGIN
			CASE MOSTRAR IS
				WHEN "0000" => DISPLAY <="1111110";
				WHEN "0001" => DISPLAY <="1000010";
				WHEN "0011" => DISPLAY <="1001111";
				WHEN "0010" => DISPLAY <="0100100";
				WHEN "0110" => DISPLAY <="0110000";
				WHEN "0111" => DISPLAY <="0101010";
				WHEN "0101" => DISPLAY <="0000001";
				WHEN "0100" => DISPLAY <="0000100";
				WHEN "1100" => DISPLAY <="1110000";
				WHEN "1101" => DISPLAY <="0001000";
				WHEN "1111" => DISPLAY <="1110001";
				WHEN others => DISPLAY <="-------";
			END CASE;
		END PROCESS Convertidor;
END A_MarquesinaROM2;