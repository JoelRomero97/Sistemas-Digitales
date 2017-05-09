module practica8_marquesina ( 
	clock,
	clear,
	enable,
	anodo,
	display
	) ;

input  clock;
input  clear;
input [2:0] enable;
inout [2:0] anodo;
inout [6:0] display;
