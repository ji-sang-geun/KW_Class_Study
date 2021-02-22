module register32_r_en(clk, reset_n, en, d_in, d_out); // this module means 32 bits resettable and en register
input clk, reset_n, en; // define input clk, reset_n and en , en = 1 write mode en = 0 read mode
input [31:0] d_in; // define 32 bits input d_in
output [31:0] d_out; // define 32 bits output 3_out

// 4 register8_r_en instance
register8_r_en U0_register8_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d_in(d_in[7:0]),
	.d_out(d_out[7:0])
	);
	
register8_r_en U1_register8_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d_in(d_in[15:8]),
	.d_out(d_out[15:8])
	);
	
register8_r_en U2_register8_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d_in(d_in[23:16]),
	.d_out(d_out[23:16])
	);

register8_r_en U3_register8_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d_in(d_in[31:24]),
	.d_out(d_out[31:24])
	);
	
endmodule // end of module
