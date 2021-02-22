module register32_8(clk, reset_n, en, d_in, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7); // this module means 8 * (32bit register) instance module 
input clk, reset_n; // define clk, reset_n, reset_n is active low
input [7:0] en; // define 8 bits input en
input [31:0] d_in; // define 32 bits input d_in
output [31:0] d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7; // define 32bits output

// 8 register32_r_en instance
register32_r_en U0_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[0]),
	.d_in(d_in),
	.d_out(d_out0)
	);
	
register32_r_en U1_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[1]),
	.d_in(d_in),
	.d_out(d_out1)
	);
	
register32_r_en U2_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[2]),
	.d_in(d_in),
	.d_out(d_out2)
	);
	
register32_r_en U3_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[3]),
	.d_in(d_in),
	.d_out(d_out3)
	);
	
register32_r_en U4_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[4]),
	.d_in(d_in),
	.d_out(d_out4)
	);
	
register32_r_en U5_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[5]),
	.d_in(d_in),
	.d_out(d_out5)
	);
	
register32_r_en U6_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[6]),
	.d_in(d_in),
	.d_out(d_out6)
	);
	
register32_r_en U7_register32_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en[7]),
	.d_in(d_in),
	.d_out(d_out7)
	);

endmodule // end of module
