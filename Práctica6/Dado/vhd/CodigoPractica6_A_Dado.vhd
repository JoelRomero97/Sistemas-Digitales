
--  CYPRESS NOVA XVL Structural Architecture

--  JED2VHD Reverse Assembler - 6.3 IR 35


--    VHDL File: CodigoPractica6_A_Dado.vhd

--    Date: Tue Oct 11 16:34:47 2016

--  Disassembly from Jedec file for: c22v10

--  Device Ordercode is: PALCE22V10-15PC
library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.primitive.all;


-- Beginning Test Bench Header

ENTITY practica6dado IS
    PORT (
	               clear :    in std_logic ;
	               clock :    in std_logic ;
	              enable :    in std_logic ;
	             display : inout std_logic_vector (6 downto 0)
    );
END practica6dado;

-- End of Test Bench Header

ARCHITECTURE DSMB of practica6dado is

	signal jed_node1	: std_logic:='0' ; -- clock
	signal jed_node2	: std_logic:='0' ; -- enable
	signal jed_node3	: std_logic:='0' ;
	signal jed_node4	: std_logic:='0' ;
	signal jed_node5	: std_logic:='0' ;
	signal jed_node6	: std_logic:='0' ;
	signal jed_node7	: std_logic:='0' ;
	signal jed_node8	: std_logic:='0' ;
	signal jed_node9	: std_logic:='0' ;
	signal jed_node10	: std_logic:='0' ;
	signal jed_node11	: std_logic:='0' ;
	signal jed_node12	: std_logic:='0' ;
	signal jed_node13	: std_logic:='0' ; -- clear
	signal jed_node14	: std_logic:='0' ;
	signal jed_node22	: std_logic:='0' ;
	signal jed_node23	: std_logic:='0' ;
	signal jed_node24	: std_logic:='0' ;

	for all: c22v10m use entity primitive.c22v10m (sim);

SIGNAL  one:std_logic:='1';
SIGNAL  zero:std_logic:='0';
SIGNAL  jed_oept_1:std_logic:='0';
--Attribute PIN_NUMBERS of clock:SIGNAL is "0001";

SIGNAL  jed_oept_2:std_logic:='0';
--Attribute PIN_NUMBERS of enable:SIGNAL is "0002";

SIGNAL  jed_oept_13:std_logic:='0';
--Attribute PIN_NUMBERS of clear:SIGNAL is "0013";

SIGNAL  jed_oept_15:std_logic:='0';
SIGNAL  jed_sum_15,jed_fb_15:std_logic:='0';
--Attribute PIN_NUMBERS of display(0):SIGNAL is "0015";

SIGNAL  jed_oept_16:std_logic:='0';
SIGNAL  jed_sum_16,jed_fb_16:std_logic:='0';
--Attribute PIN_NUMBERS of display(1):SIGNAL is "0016";

SIGNAL  jed_oept_17:std_logic:='0';
SIGNAL  jed_sum_17,jed_fb_17:std_logic:='0';
--Attribute PIN_NUMBERS of display(2):SIGNAL is "0017";

SIGNAL  jed_oept_18:std_logic:='0';
SIGNAL  jed_sum_18,jed_fb_18:std_logic:='0';
--Attribute PIN_NUMBERS of display(3):SIGNAL is "0018";

SIGNAL  jed_oept_19:std_logic:='0';
SIGNAL  jed_sum_19,jed_fb_19:std_logic:='0';
--Attribute PIN_NUMBERS of display(4):SIGNAL is "0019";

SIGNAL  jed_oept_20:std_logic:='0';
SIGNAL  jed_sum_20,jed_fb_20:std_logic:='0';
--Attribute PIN_NUMBERS of display(5):SIGNAL is "0020";

SIGNAL  jed_oept_21:std_logic:='0';
SIGNAL  jed_sum_21,jed_fb_21:std_logic:='0';
--Attribute PIN_NUMBERS of display(6):SIGNAL is "0021";

SIGNAL  jed_oept_25:std_logic:='0';
SIGNAL  jed_node25,jed_sum_25:std_logic:='0';
SIGNAL  jed_oept_26:std_logic:='0';
SIGNAL  jed_node26,jed_sum_26:std_logic:='0';

BEGIN
jed_node1 <= clock ;
jed_node2 <= enable ;
jed_node13 <= clear ;
Mcell_15:c22v10m
generic map(reg,
   invt,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_15,
     clk=>jed_node1,
     oe=>jed_oept_15,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(0),
     fb=>jed_fb_15
   );

Mcell_16:c22v10m
generic map(reg,
   invt,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_16,
     clk=>jed_node1,
     oe=>jed_oept_16,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(1),
     fb=>jed_fb_16
   );

Mcell_17:c22v10m
generic map(reg,
   invt,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_17,
     clk=>jed_node1,
     oe=>jed_oept_17,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(2),
     fb=>jed_fb_17
   );

Mcell_18:c22v10m
generic map(reg,
   invt,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_18,
     clk=>jed_node1,
     oe=>jed_oept_18,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(3),
     fb=>jed_fb_18
   );

Mcell_19:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_19,
     clk=>jed_node1,
     oe=>jed_oept_19,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(4),
     fb=>jed_fb_19
   );

Mcell_20:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_20,
     clk=>jed_node1,
     oe=>jed_oept_20,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(5),
     fb=>jed_fb_20
   );

Mcell_21:c22v10m
generic map(reg,
   invt,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_21,
     clk=>jed_node1,
     oe=>jed_oept_21,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>display(6),
     fb=>jed_fb_21
   );

jed_node25<=jed_sum_25;
jed_node26<=jed_sum_26;
jed_oept_15<=(one);

jed_sum_15<= (((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and (jed_fb_16) and (jed_fb_15)) or
((jed_fb_21) and not(not(jed_fb_20)) and not(not(jed_fb_19))
 and (jed_fb_18) and (jed_fb_17) and not(jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_fb_21) and (not(jed_fb_20)) and not(not(jed_fb_19))
 and not(jed_fb_18) and (jed_fb_17) and not(jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_fb_21) and not(not(jed_fb_20)) and (not(jed_fb_19))
 and not(jed_fb_18) and not(jed_fb_17) and (jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_fb_21) and not(not(jed_fb_20)) and not(not(jed_fb_19))
 and not(jed_fb_18) and (jed_fb_17) and (jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_node2) and not(jed_fb_15)));

jed_oept_16<=(one);

jed_sum_16<= (((jed_node2) and not(jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and not(jed_fb_18) and (jed_fb_17)
 and (jed_fb_16) and not(jed_fb_15)) or
((jed_fb_21) and not(not(jed_fb_20)) and not(not(jed_fb_19))
 and (jed_fb_18) and (jed_fb_17) and not(jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_fb_21) and (not(jed_fb_20)) and not(not(jed_fb_19))
 and not(jed_fb_18) and (jed_fb_17) and not(jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_node2) and not(jed_fb_16)));

jed_oept_17<=(one);

jed_sum_17<= (((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and (jed_fb_16) and (jed_fb_15)) or
((jed_node2) and not(jed_fb_21) and (not(jed_fb_20))
 and not(not(jed_fb_19)) and not(jed_fb_18) and (jed_fb_17)
 and not(jed_fb_16) and not(jed_fb_15)) or
(not(jed_node2) and not(jed_fb_17)));

jed_oept_18<=(one);

jed_sum_18<= (((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and (jed_fb_16) and (jed_fb_15)) or
((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and not(jed_fb_16) and not(jed_fb_15)) or
(not(jed_fb_21) and (not(jed_fb_20)) and not(not(jed_fb_19))
 and not(jed_fb_18) and (jed_fb_17) and not(jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_fb_21) and not(not(jed_fb_20)) and (not(jed_fb_19))
 and not(jed_fb_18) and not(jed_fb_17) and (jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_node2) and not(jed_fb_18)));

jed_oept_19<=(one);

jed_sum_19<= (((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and (jed_fb_16) and (jed_fb_15)) or
(not(jed_node2) and (not(jed_fb_19))));

jed_oept_20<=(one);

jed_sum_20<= (((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and not(jed_fb_16) and not(jed_fb_15)) or
(not(jed_fb_21) and (not(jed_fb_20)) and not(not(jed_fb_19))
 and not(jed_fb_18) and (jed_fb_17) and not(jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_node2) and (not(jed_fb_20))));

jed_oept_21<=(one);

jed_sum_21<= (((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and not(jed_fb_16) and not(jed_fb_15)) or
((jed_node2) and (jed_fb_21) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and (jed_fb_18) and (jed_fb_17)
 and (jed_fb_16) and (jed_fb_15)) or
(not(jed_fb_21) and (not(jed_fb_20)) and not(not(jed_fb_19))
 and not(jed_fb_18) and (jed_fb_17) and not(jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_fb_21) and not(not(jed_fb_20)) and (not(jed_fb_19))
 and not(jed_fb_18) and not(jed_fb_17) and (jed_fb_16)
 and not(jed_fb_15)) or
(not(jed_node2) and not(jed_fb_21)));

jed_sum_25<= (((jed_node13)));

end DSMB;
