module practica7_tecladomatricial ( 
	clock,
	clear,
	fila,
	columna,
	display
	) ;

input  clock;
input  clear;
input [3:0] fila;
inout [2:0] columna;
inout [6:0] display;
