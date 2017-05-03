library ieee;
use ieee.std_logic_1164.all;

entity Practica7_TecladoMatricial is 
port(clock, clear: in std_logic;
	 Fila:in std_logic_vector(3 downto 0);
	 Columna: inout std_logic_vector(2 downto 0);
	 display:out std_logic_vector(6 downto 0));
	
attribute pin_numbers of Practica7_TecladoMatricial: entity is
"clock:1 Fila(0):8 Fila(1):9 Fila(2):10 Fila(3):11 clear:13"
& " display(0):15 display(1):16 display(2):17 display(3):18 display(4):19 display(5):20 display(6):21"
& " Columna(0):23 Columna(1):22 Columna(2):14";

end Practica7_TecladoMatricial;

architecture A_Teclado_Matricial of Practica7_TecladoMatricial is

signal aux: std_logic_vector(6 downto 0);
signal Tecla: std_logic_vector(6 downto 0);
signal Operacion: std_logic;

begin

ContAnilloLeft: process(clock,clear)
	begin
			if(clear = '1') then
				Columna <= "110"; --Columna 2
		
			elsif(clock'event and clock = '1') then 
				 --case (columna) is
				  --when "011" => Columna <= "101";
				  --when "101" => Columna <= "110";
				  --when "110" => Columna <= "011";
				  --when others => Columna <= "011";
				 --end case;
				Columna <= TO_STDLOGICVECTOR( TO_BITVECTOR( Columna ) ROL 1);
			end if;
		end process ContAnilloLeft;


convertidorCod: process(Columna, Fila)
	begin
		Operacion <= not (Fila(3) and Fila(2) and Fila(1) and Fila(0));
		case (Columna) is
			when "011" => 
					case (Fila) is
					when "1110" =>
						Tecla <= "1001111"; --Num 1
					when "1101" =>
						Tecla <= "1001100"; --Num 4
					when "1011" =>
						 Tecla <= "0001111"; --Num 7
					when "0111" =>
						 Tecla <= "1100010"; --Num *
					when others =>
						Tecla <= "1111111"; --Num 
					end case;	

			when "101" => 
					case (Fila) is
					when "1110" =>
						Tecla <= "0010010"; --Num 2
					when "1101" =>
						Tecla <= "0100100"; --Num 5
					when "1011" =>
						Tecla <= "0000000"; --Num 8
					when "0111" =>
						Tecla <= "0000001"; --Num 0
					when others =>
						Tecla <= "1111111"; --Num 
					end case;
				
			when "110" => 
				case (Fila) is
					when "1110" =>
						Tecla <= "0000110"; --Num 3
					when "1101" =>
						Tecla <= "0100000"; --Num 6
					when "1011" =>
						Tecla <= "0001100"; --Num 9
					when "0111" =>
						Tecla <= "1001000"; --Num #
					when others =>
						Tecla <= "1111111"; --Num 
					end case;	

			when others =>
					Tecla <= "1111111";
					
		 end case;
	 end process convertidorCod;

--aux <= Tecla;

	 Registro: process(clock,clear)
	 begin
	 	if(clear = '1') then
		   Operacion <= '0';
		   display <= "1111111";
		
		elsif(clock'event and clock = '1') then
 	    	 if (Operacion = '1') then
		   				--for i in 0 to 6 loop  --estructura del for -> FOR <variable> IN <rango> LOOP (codigo) END LOOP; 
						--display(i) <= Tecla(i); --carga
						--display(i) <= display(i); --carga
						--end loop;
			  			display <= Tecla; --carga	
		  			  	--aux <= Tecla;		  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  			  
			  elsif(Operacion = '0') then
		   				--for i in 0 to 6 loop
					    --display(i) <= display(i); --retención
						--end loop;
						display <= display; --retención
						--aux <= aux;
			  else 
			  	display <= "1111111";
				--aux <= "1111111";
			 end if;
		 end if;
	  end process Registro;

	  --display <= aux;
end A_Teclado_Matricial;


-- Columna "110"
--when "110" => 
--if(Fila(0) = '1') then
					--Tecla <= "0000110"; --Num 3
					--display <= "0000110"; --Num 3
				--end if;

				--if(Fila(1) = '1') then
					--Tecla <= "0100000"; --Num 6
					--display <= "0100000"; --Num 6
				--end if;

				--if(Fila(2) = '1') then
					--Tecla <= "0001100"; --Num 9
					--display <= "0001100"; --Num 9
				--end if;

				--if(Fila(3) = '1') then
					--Tecla <= "1001000"; --Num #
					--display <= "1001000"; --Num #
				--end if;

--Columna "101"
--when "101" => 
--if(Fila(0) = '1') then
					--Tecla <= "0010010"; --Num 2
					--display <= "0010010"; --Num 2
				--end if;

				--if(Fila(1) = '1') then
					--Tecla <= "0100100"; --Num 5
					--display <= "0100100"; --Num 5
				--end if;

				--if(Fila(2) = '1') then
					--Tecla <= "0000000"; --Num 8
					--display <= "0000000"; --Num 8
				--end if;

				--if(Fila(3) = '1') then
					--Tecla <= "0000001"; --Num 0
					--display <= "0000001"; --Num 0
				--end if;

 --Columna "011"
 --when "011" => 
 --if(Fila(0) = '1') then
					--Tecla <= "1001111"; --Num 1
					--display <= "1001111"; --Num 1
				--end if;

				--if(Fila(1) = '1') then
					--Tecla <= "1001100"; --Num 4
					--display <= "1001100"; --Num 4
				--end if;

				--if(Fila(2) = '1') then
					--Tecla <= "0001111"; --Num 7
					--display <= "0001111"; --Num 7
				--end if;

				--if(Fila(3) = '1') then
					--Tecla <= "1100010"; --Num *
					--display <= "1100010"; --Num *
				--end if;

--Others
