module _register3_r(clk, reset_n, d, q); // this module makes 3 bits register with resettable
input clk, reset_n; // define input clk, reset_n reset_n is active low
input [2:0] d; // define 3 bits input d
output [2:0] q; // define 3 bits output q 

// 3 resettable d flip flop instance
_dff_r U0_dff_r(
	.clk(clk),
	.reset_n(reset_n),
	.d(d[0]),
	.q(q[0])
	);
	
_dff_r U1_dff_r(
	.clk(clk),
	.reset_n(reset_n),
	.d(d[1]),
	.q(q[1])
	);
	
_dff_r U2_dff_r(
	.clk(clk),
	.reset_n(reset_n),
	.d(d[2]),
	.q(q[2])
	);
	
endmodule // end of module
