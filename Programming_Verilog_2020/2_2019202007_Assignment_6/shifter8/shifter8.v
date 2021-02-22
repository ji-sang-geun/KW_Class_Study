module shifter8(clk, reset_n, op, shamt, d_in, d_out); // this module is 8 bits shifter 
input clk, reset_n; // define input clk, reset_n, reset_n is active low
input [2:0] op; // define 3 bits input op, it means op code
input [1:0] shamt; // define 2 bits input shamt, it means shift amount
input [7:0] d_in; // define 8 bits input d_in.
output [7:0] d_out; // define 8 bits output d_out, it means output

wire [7:0] d_next; // define 8 bits wire d_next

cc_logic U0_cc_logic( // cc_logic instance
	.op(op),
	.shamt(shamt), 
	.d_in(d_in), 
	.d_out(d_out),
	.d_next(d_next)
	);

_register8_r U0_register8_r( // _register8_r instance
	.clk(clk),
	.reset_n(reset_n),
	.d(d_next),
	.q(d_out)
	);

endmodule // end of module
