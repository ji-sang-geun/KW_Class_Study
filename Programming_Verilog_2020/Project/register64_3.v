module register64_3(clk, reset_n, en, d_in, d_out0, d_out1, d_out2); // this module makes 64 bits register 3
input clk, reset_n; // define input list
input [2:0] en;
input [31:0] d_in;

output [63:0] d_out0, d_out1, d_out2; // define output list

// 3 resettable 64 bits register instance
register64_r_en U0_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[0]),
	.d_in(d_in),
	.d_out(d_out0)
	);
	
register64_r_en U1_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[1]),
	.d_in(d_in),
	.d_out(d_out1)
	);
	
register64_r_en U2_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[2]),
	.d_in(d_in),
	.d_out(d_out2)
	);
	
endmodule // end of module
