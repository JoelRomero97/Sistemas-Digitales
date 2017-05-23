library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity ContadorDecada is port(

e: in std_logic_vector(1 downto 0);
clk, clr: in std_logic;
u: out std_logic_vector(3 downto 0);
d: out std_logic_vector(2 downto 0)
);
end ContadorDecada;

architecture AContadorDecada of ContadorDecada is

begin

	process(clk, clr)
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
end AContadorDecada;