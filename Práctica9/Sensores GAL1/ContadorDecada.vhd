library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity Sensores is port(

u : out std_logic_vector ( 3 downto 0 );--Para Contador dec
d : out std_logic_vector ( 2 downto 0 );--Para contador dec
e : in std_logic_vector(1 downto 0);
clr : in std_logic;
clk :in std_logic
); 

attribute PIN_NUMBERS of Sensores : entity is (
"clk:1 clr:13 e(1):2 e(0):3 "& 
"u(3):17 u(2):16 u(1):15 u(0):14 "& 
"d(2):20 d(1):19 d(0):18 "
);

end Sensores;


architecture A_Sensores of Sensores is
type estados is(e0,e1,e2,e3,e4,e5,e6,e7);
signal z : std_logic_vector(1 downto 0);
signal edo_act, edo_sig: estados;
begin
--PROCESO DE TRANSICIÒN
transicion: process (clk , clr)
		begin
			if(clr='1') then
				edo_act <= e0;
			elsif(clk'event and clk='1')then
				edo_act <= edo_sig;
			end if;
	end process;

--PARA LOS ESTADOS
estado: process (e,edo_act)
		begin
		  case edo_act is
		  --Para el estado 0
			when e0=>
				if(e="00") then
					z<="00";
					edo_sig <= e0;
				elsif(e="10")then
					z<="00";
					edo_sig <= e1;
				elsif(e="01")then
					z<="00";
					edo_sig<=e4;
				elsif(e="11")then
					z<="00";
					edo_sig<=e7;
				end if;
		--Para el estado 1
			when e1=>
				if(e="00") then
					z<="00";
					edo_sig <= e0;
				elsif(e="10")then
					z<="00";
					edo_sig <= e1;
				elsif(e="01")then
					z<="00";
					edo_sig<=e4;
				elsif(e="11")then
					z<="00";
					edo_sig<=e2;
				end if;
		--Para el estado 2
				when e2=>
				if(e="00") then
					z<="00";
					edo_sig <= e0;
				elsif(e="10")then
					z<="00";
					edo_sig <= e1;
				elsif(e="01")then
					z<="00";
					edo_sig<=e3;
				elsif(e="11")then
					z<="00";
					edo_sig<=e2;
				end if;
		--Para el estado 3
				when e3=>
				if(e="00") then
					z<="01";
					edo_sig <= e0;
				elsif(e="10")then
					z<="01";
					edo_sig <= e1;
				elsif(e="01")then
					z<="00";
					edo_sig<=e3;
				elsif(e="11")then
					z<="00";
					edo_sig<=e2;
				end if;
 		--Para el estado 4
				when e4=>
				if(e="00") then
					z<="00";
					edo_sig <= e0;
				elsif(e="10")then
					z<="00";
					edo_sig <= e1;
				elsif(e="01")then
					z<="00";
					edo_sig<=e4;
				elsif(e="11")then
					z<="00";
					edo_sig<=e5;
				end if;
 		--Para el estado 5
				when e5=>
				if(e="00") then
					z<="00";
					edo_sig <= e0;
				elsif(e="10")then
					z<="00";
					edo_sig <= e6;
				elsif(e="01")then
					z<="00";
					edo_sig<=e4;
				elsif(e="11")then
					z<="00";
					edo_sig<=e5;
				end if;
		--Para el estado 6
				when e6=>
				if(e="00") then
					z<="10";
					edo_sig <= e0;
				elsif(e="10")then
					z<="00";
					edo_sig <= e6;
				elsif(e="01")then
					z<="10";
					edo_sig<=e4;
				elsif(e="11")then
					z<="00";
					edo_sig<=e5;
				end if;
		--Para el estado 7
				when e7=>
				if(e="00") then
					z<="00";
					edo_sig <= e0;
				elsif(e="10")then
					z<="00";
					edo_sig <= e1;
				elsif(e="01")then
					z<="00";
					edo_sig<=e4;
				elsif(e="11")then
					z<="00";
					edo_sig<=e7;
				end if; 
		end case;
	end process;

   --Contador Decada

 ContadorDec : process(clk, clr)
		begin
			if(clr='1')then
				u<= (others =>'0');
				d<= (others =>'0');
			elsif(clk'event and clk='1')then
				if(e="01")then
					u<= u + 1;
					if(u="1001")then
						u<= "0000";
						d<= d + 1;
					end if;
			     elsif(e="10")then
				 	u<= u - 1;
					if(u="0000")then
						u<= "1001";
						d<= d-1;
					end if;
			   end if;
			end if;
	end process;

end A_Sensores;