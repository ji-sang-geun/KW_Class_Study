module _dff_r(d, reset_n, clk, q); // this module makes resettable D flipflop

input d, reset_n, clk; // define input d, reset_n, clk, reset_n is low active
output q; // define output q

wire and_to_dff; // define wire and_to_dff

_and2 U0_and2( // 2 input and gate instance
	.a(d),
	.b(reset_n),
	.y(and_to_dff)
	);

_dff U1_dff( // D flipflop instance
	.clk(clk),
	.d(and_to_dff),
	.q(q),
	.q_bar()
	);
	
endmodule // end of module
	
