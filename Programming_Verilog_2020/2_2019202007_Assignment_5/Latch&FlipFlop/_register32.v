module _register32(clk, d, q); // this module makes 32 bits register

input clk; // define input clk
input [31:0] d; // define 32 bits input d
output [31:0] q; // define 32 bits output q

//  fout 8 bits register8 instance
_register8 U0_register8(
	.clk(clk),
	.d(d[7:0]),
	.q(q[7:0])
	);

_register8 U1_register8(
	.clk(clk),
	.d(d[15:8]),
	.q(q[15:8])
	);
	
_register8 U2_register8(
	.clk(clk),
	.d(d[23:16]),
	.q(q[23:16])
	);
	
_register8 U3_register8(
	.clk(clk),
	.d(d[31:24]),
	.q(q[31:24])
	);
	
endmodule // end of module
