type estados is ED0,ED1,ED2,ED3,ED4,ED5,ED6,ED7,ED8,ED9,ED10,ED11,ED12

signal edo_act, edo_sig :estados;

process(clk,clr)
begin 
if(clr="1") then

edo_act <=ED0;
 elsif(clk 'event and clk="1") then
 edo_act<=edo_sig;
end if;
end process;
clr=1;


entity mensaje is port {
display:out std_logic_vector(6 downto 0);
anodos:out std_logic_vector(6 downto 0);
}


signal edo_act,edo_sig;
signal LI: std_logic_vector(6 downto 0):= "1000001";
signal LP: std_logic_vector(6 downto 0):= "1001001";
signal LN: std_logic_vector(6 downto 0):= "1000101";


process(edo_act,e)
begin

end process

case edo_act is
	when edo_act=>e0
display<= LI;
anodos <="011"
if (e='0') then 
edo_sig <=e0;
else
edo_sig <=e1;
end if;
	when edo_act=>e1
display<= LP;
anodos <="101";
if (e='0') then 
edo_sig <=e1;
else
edo_sig <=e2;
end if;
	when edo_act=>e0
display<= LN;
anodos <="110"
if (e='0') then 
edo_sig <=e2;
else
edo_sig <=e0;
end if;
end case;