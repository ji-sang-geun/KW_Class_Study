module mx2(d0,d1,s,y); // this module makes 2x1 multiplexer 
input d0,d1; // define input d0, d1
input s; // define input s
output y; // define output y
wire sb, w0, w1; // define wire sb, w0, w1, sb means inverse to s

// y= sb*d0 + s*d1
_inv U0_inv( // inverse s
	.a(s),
	.y(sb)
	);

_and2 U1_and2( // sb * d0
	.a(sb),
	.b(d0),
	.y(w0)
	);
	
_and2 U2_and2( // s * d1
	.a(s),
	.b(d1),
	.y(w1)
	);
	
_or2 U3_or2( // w0 + w1
	.a(w0),
	.b(w1),
	.y(y)
	);
	
endmodule // end of module