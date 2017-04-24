library ieee;
use ieee.std_logic_1164.all;

entity p1 is port(
	d,clk,clr,t,s,r,j,k: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	display: out std_logic_vector(3 downto 0);
	q,qd,qt,qsr,qjk: inout std_logic
);
end p1;

architecture a_p1 of p1 is
begin--En un circuito secuencial no es necesario un else, de hecho es lo mas conveniente

	--Flip-Flop tipo D
	process(clk, clr)--en circuito secuencial van las entradas asincronas y el reloj 
	begin
		if (clr = '1'´) then
			qd <= '0';
		elsif(clk'event and clk = '1') then
 	    	qd <= d;
		end if;
	end process;

	--Flip-Flip tipo T
	process (clk, clr)
	begin
		if (clr = '1'´) then
			qt <= '0';
		elsif(clk'event and clk = '1') then
 	    	qt <= t xor qt;
		end if;
	end process;

	--Flip-Flip tipo SR
	process (clk, clr)
	begin
		if (clr = '1'´) then
			qsr <= '0';
		elsif(clk'event and clk = '1') then
 	    	qsr <= s or (qsr and (not r));
		end if;
	end process;

	--Flip-Flip tipo JK
	process (clk, clr)
	begin
		if (clr = '1'´) then
			qjk <= '0';
		elsif(clk'event and clk = '1') then
 	    	qjk <= ((not k) and qjk) or (j and (not qjk));
		end if;
	end process;

	--Multiplexor
	process (sel, qd, qt, qsr, qjk)
	begin
		if(sel = "00") then
			q <= qjk;
		elsif(sel = "01") then
			q <= qt;
		elsif(sel = "10") then
			q <= qd;
		else
			q <= qsr;
		end if;
	end process;
	
	--Convertidor
	process(q)
	begin
		if(q = '0') then
			display <= "0000";
		else
			display <= "1100";
		end if;
	end process;

end a_p1;
