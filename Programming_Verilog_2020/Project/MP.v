module MP(clk, reset_n, s_wr, s_addr, s_din, s0_sel, s_dout, interrupt_out); // this module makes main processor
input clk, reset_n; // define input list
input s_wr, s0_sel;
input [15:0] s_addr;
input [31:0] s_din;

output [63:0] s_dout; // define output list 
output interrupt_out;

//always@ (posedge clk or negedge reset_n) begin

wire [31:0] alu_to_mx; // wire means alu to mux
wire [63:0] mul_to_mx; // wire means mul to mux
wire [63:0] mx_to_RF; 

RF U0_RF( // Register File instance
	.clk(clk),
	.reset_n(reset_n),
	.s_wr(s_wr),
	.s_addr(s_addr),
	.s_din(s_din),
	.s_dout(s_dout),
	.interrupt_out(interrupt_out)
	);
	
alu32 U1_alu32( // ALU32 instance
	.clk(clk),
	.reset_n(reset_n),
	.a(),
	.b(),
	.op(s_addr[14:12]),
	.result(alu_to_mx)
	);
	
multiplier U2_multiplier( // multiplier instance
	.clk(clk),
	.reset_n(reset_n),
	.multiplier(),
	.multiplicand(),
	.op_start(),
	.op_clear(),
	.op_done(),
	.result(mul_to_mx)
	);

// MUX instance
mx2_64bits U3_mx2_64bits(
	.d0({32'b0,alu_to_mx}),
	.d1(mul_to_mx),
	.s(s0_sel),
	.y()
	);
	
endmodule // end of module
