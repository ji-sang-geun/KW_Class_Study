module _register3_r_async(clk, reset_n, D2, D1, D0, Q2, Q1, Q0);	// this module makes resettable 3 bits register
input clk, reset_n; // define input clk, reset_n
input D2, D1, D0; // define input D2, D1, D0
output Q2, Q1, Q0; // define output Q2, Q1, Q0

// three asynchronous resettable d flipflop instance
_dff_r_async U0_dff_r_async( 
	.clk(clk),
	.reset_n(reset_n),
	.d(D0),
	.q(Q0)
	);
	
_dff_r_async U1_dff_r_async(
	.clk(clk),
	.reset_n(reset_n),
	.d(D1),
	.q(Q1)
	);
	
_dff_r_async U2_dff_r_async(
	.clk(clk),
	.reset_n(reset_n),
	.d(D2),
	.q(Q2)
	);

endmodule // end of module

