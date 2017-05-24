module moore ( 
	l,
	clk,
	clr,
	display,
	columna,
	fila
	) ;

input  l;
input  clk;
input  clr;
inout [6:0] display;
inout [2:0] columna;
input [3:0] fila;
