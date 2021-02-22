module _register2_r_async(clk, reset_n, D1, D0, Q1, Q0); // this module makes asynchronous 2 bit register
input clk, reset_n; // define input clk, reset_n
input D1, D0; // define input D1, D0
output Q1, Q0; // define output Q1, Q0

// two asynchronous D flipflop instance
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

endmodule // end of module
