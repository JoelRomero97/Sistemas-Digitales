---------------------------------------------------------------------------------------------------
--Contador Generico
---------------------------------------------------------------------------------------------------

library ieee;

use ieee.std_logic_1164.all;
--Para operaciones de contadores
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Practica5_B_ContadorGenerico is 
port( Q: inout std_logic_vector(9 downto 0);  --i/o
      clock,clear,Enable :in std_logic);

	  --Atributos
--attribute pin_numbers of Practica5_B_ContadorGenerico: entity is
--"clock:1 clear:13 Enable:2"
--& " Q(0):14 Q(1):15 Q(2):16 Q(3):17 Q(4):18 Q(5):19 Q(6):20 Q(7):21 Q(8):22 Q(9):23";  

end Practica5_B_ContadorGenerico;

architecture A_Practica5_B of Practica5_B_ContadorGenerico is

--señales

signal acarreo: std_logic; 	

begin
	--process con clk y variables de control asicronas
	--no deben de ir las señales de carga, porque son sincronas, a menos que asi las definieramos como asincronas

	process(clock,clear)

		variable i,j: std_logic;
		variable aux: std_logic;
		variable aux2: std_logic;

	begin

	if(clear = '1') then   --1
	    Q <= (others => '0');  --others rellena todo con ceros, z o 1	

	elsif(clock'event and clock = '1') then

	    if(Enable = '0') then  --2
			Q <= Q;  --Retención

	    else
			for i in 0 to 8 loop
			aux := '1';
			for j in 0 to i-1 loop
			aux := Q(j) and aux;
			--aux2:= Enable and aux;
			end loop;
			Q(i) <= Q(i) xor (aux and Enable);
			end loop;
			
	    end if;  --2
	end if;  --1

	end process;

end A_Practica5_B;

--variable a:integer;
--for(i=0;i<n;i++)	
--for(j=0;i<2;j++)
--aux;
--aux2=E and aux;
--Qi=aux2 xor Qi;
		 
--if(UD /= '1') then
		   --Q <= Q-1;  -- dow: contador descendente
--for(i=0;i<10;i++)
--for(j=0;j<i;j++)
--aux := j;
--aux2 := Enable and aux;
--Q <= aux2 xor Q;

--for i in 0 to 10 loop
--for j in 0 to i loop
--aux;
--aux2 := Enable and aux;
--Q <= aux2 xor Q;
--end loop;
--end loop;


