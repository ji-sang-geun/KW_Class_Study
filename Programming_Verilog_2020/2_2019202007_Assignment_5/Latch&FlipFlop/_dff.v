module _dff(clk, d, q, q_bar); // this module makes d flipflop
input clk, d; // define input clk and d
output q, q_bar; // define output q and q_bar

wire clk_bar, latch_to_latch; // define wire clk_bar and latch_to_latch

_inv U0_inv( // inverter instance
	.a(clk),
	.y(clk_bar)
	);

// two D latch instance	
_dlatch U1_dlatch(
	.clk(clk_bar),
	.d(d),
	.q(latch_to_latch),
	.q_bar()
	);
	
_dlatch U2_dlatch(
	.clk(clk),
	.d(latch_to_latch),
	.q(q),
	.q_bar(q_bar)
	);
	
endmodule // end of module
