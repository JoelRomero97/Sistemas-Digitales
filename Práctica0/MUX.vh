module mux ( 
	a,
	b,
	ref,
	sel,
	display
	) ;

input [2:0] a;
input [2:0] b;
input [2:0] ref;
input  sel;
inout [6:0] display;
