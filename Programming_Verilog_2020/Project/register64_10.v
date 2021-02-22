module register64_10(clk, reset_n, en, d_in, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7, d_out8, d_out9); // this module makes 64 bits register 10
input clk, reset_n; // define input list
input [9:0] en;
input [63:0] d_in;

output [63:0] d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7, d_out8, d_out9; // define output list

// 10 resettable 64 bits register instance
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
	
register64_r_en U3_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[3]),
	.d_in(d_in),
	.d_out(d_out3)
	);
	
register64_r_en U4_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[4]),
	.d_in(d_in),
	.d_out(d_out4)
	);
	
register64_r_en U5_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[5]),
	.d_in(d_in),
	.d_out(d_out5)
	);
	
register64_r_en U6_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[6]),
	.d_in(d_in),
	.d_out(d_out6)
	);
	
register64_r_en U7_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[7]),
	.d_in(d_in),
	.d_out(d_out7)
	);
	
register64_r_en U8_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[8]),
	.d_in(d_in),
	.d_out(d_out8)
	);
	
register64_r_en U9_register64_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[9]),
	.d_in(d_in),
	.d_out(d_out9)
	);
	
endmodule // end of module
