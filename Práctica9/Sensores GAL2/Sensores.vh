module sensores ( 
	clk,
	clr,
	display,
	uni,
	dec,
	sel
	) ;

input  clk;
input  clr;
inout [6:0] display;
input [3:0] uni;
input [2:0] dec;
input [2:0] sel;
