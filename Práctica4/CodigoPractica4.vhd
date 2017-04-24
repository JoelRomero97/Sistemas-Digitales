library ieee;
use ieee.std_logic_1164.all;

entity Practica4 is
port(clr,clk:in std_logic;
	 display:out std_logic_vector(6 downto 0);
	 anodo:out std_logic_vector(2 downto 0));

attribute pin_numbers of Practica4: entity is
"clk:1 anodo(0):14 anodo(1):23 anodo(2):22"
& " clr:13 display(0):15 display(1):16 display(2):17 display(3):18 display(4):19 display(5):20 display(6):21";

end Practica4;

architecture a_Practica4 of Practica4 is

-- constant: Permite definir valores permanentes.
-- Dn significa el anodo a encender o apagar 

constant D0 : std_logic_vector(2 downto 0) := "011";
constant D1 : std_logic_vector(2 downto 0) := "101";
constant D2 : std_logic_vector(2 downto 0) := "110";

-- Ln significa letra a la que mandara al anodo

constant L1 : std_logic_vector(6 downto 0) := "0000001"; --b: "1000010";  --O: "0000001";
constant L2 : std_logic_vector(6 downto 0) := "0001000"; --d: "1100000";  --A: "0001000";
constant L3 : std_logic_vector(6 downto 0) := "1000011"; --z: "0010010";  --J: "1000011";

-- Estados del automata conformados por (Ln concatenado con Dn)

constant A : std_logic_vector(9 downto 0) := L1&D0; --"0000001011";
constant B : std_logic_vector(9 downto 0) := L2&D1; --"0001000101";
constant C : std_logic_vector(9 downto 0) := L3&D2; --"0000111110";

signal transicion: std_logic_vector(9 downto 0);

begin
   process(clk,clr)  --Se calcula la salida dentro de la transicion
	begin
		if(clr ='1') then
		  transicion <= A;   --A es el estado de inicio 
		elsif(clk'event and clk = '1') then
 		  case transicion is
		  	when A => transicion <= B;  --Cuando estoy en A cambio de estado a B
  		    when B => transicion <= C;  --Cuando estoy en B cambio de estado a C
			when C => transicion <= A;  --Cuando estoy en C cambio de estado a A
			when others => transicion <= A;
		   end case;
		 end if;
	  end process;

--Asigno los valores de display y anodo afuera del proceses una vez que ya se calcularon sus valores
	  display <= transicion (9 downto 3); 
	  anodo <= transicion (2 downto 0);

end a_practica4;
			
