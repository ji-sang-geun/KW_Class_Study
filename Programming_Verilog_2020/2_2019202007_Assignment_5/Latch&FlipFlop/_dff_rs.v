module _dff_rs(d,set_n,reset_n,clk,q); // this module makes set/reset d flip flop
input d,set_n,reset_n,clk; // define input d, set_n, reset_n, clk
output q; // define output q

wire set_n_bar, or_to_and, and_to_dff; // define wire 

_inv U0_inv( // inverter instance
	.a(set_n),
	.y(set_n_bar)
	);

_or2 U0_or2( // 2 input or gate instance
	.a(d),
	.b(set_n_bar),
	.y(or_to_and)
	);

_and2 U2_and2( // 2 input and gate instance
	.a(or_to_and),
	.b(reset_n),
	.y(and_to_dff)
	);

_dff U0_dff( // d flipflop instance
	.d(and_to_dff),
	.clk(clk),
	.q(q),
	.q_bar()
	);
	
endmodule // end of module
