library ieee;
use ieee.std_logic_1164.all;

--ENTIDAD
entity Prac2 is port(
	clr, clk, ES: in std_logic;
	D: in std_logic_vector(6 downto 0);
	--ENTRADAS
	Q: inout std_logic_vector(6 downto 0);
	--ENTRADAS Y SALIDAS 
	OP: in std_logic_vector(1 downto 0)
	--OPERADOR DEL MUX
);

attribute pin_numbers of Prac2: entity is
	"Q(0):14 Q(1):15 Q(2):16 Q(3):17 Q(4):18 Q(5):19 Q(6):20 "
	& "D(0):9 D(1):8 D(2):7 D(3):6 D(4):5 D(5):4 D(6):3 "
	& "OP(0):10 OP(1):11 "
	& "clk:1 ES:2 clr:13";
end Prac2;
--ASIGNACION DE PINES

--ARQUITECTURA
architecture aPrac2 of Prac2 is 
signal aux: std_logic_vector(6 downto 0);
--signal SAL: std_logic;
begin
	process(clr,clk,Q,OP,D,ES)
	begin
		if(clr= '1') then
			Q <= "0000000";
		elsif(rising_edge(clk)) then
		   Q <= aux;
	end if;
	
		--MUX
		case (OP) is 
			when "00" => --carga
				for i in 0 to 6 loop
					aux(i)<=d(i);
				end loop;
			when "01" => --retencion
				for i in 0 to 6 loop
					aux(i)<=Q(i);
				end loop;
			when "10" => --corrimiento a la izquierda
				for i in 0 to 6 loop
					if(i>0)then
						aux(i)<=Q(i-1);
				    else
						aux(i)<= ES;
					end if;
				end loop;
			when others => --corrimiento a la derecha
					for i in 0 to 6 loop
					if(i<6)then
						aux(i)<=Q(i+1);
				    else
						aux(i)<= ES;
					end if;
				end loop;
		   end case;
	end process;
end aPrac2;
