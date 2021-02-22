module _dff_en(en, clk, d, q); // this module makes enabled d flip flop
input en, clk, d; // define input en, clk, d
output q; // define output q

wire mx2_to_dff; // define wire mx2_to_dff

mx2 U0_mx2( // 2_to_1 multiplexer instance
	.d0(q),
	.d1(d),
	.s(en),
	.y(mx2_to_dff)
	);

_dff U1_dff( // D flipflop instance
	.clk(clk),
	.d(mx2_to_dff),
	.q(q),
	.q_bar()
	);
	
endmodule // end of module
	