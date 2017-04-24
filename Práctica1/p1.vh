module p1 ( 
	d,
	clk,
	clr,
	t,
	s,
	r,
	j,
	k,
	sel,
	display,
	q,
	qd,
	qt,
	qsr,
	qjk
	) ;

input  d;
input  clk;
input  clr;
input  t;
input  s;
input  r;
input  j;
input  k;
input [1:0] sel;
inout [3:0] display;
inout  q;
inout  qd;
inout  qt;
inout  qsr;
inout  qjk;
