module register8_r_en(clk, reset_n, en, d_in, d_out); // this module makes resettable + en 8 bits register 
input clk, reset_n, en; // define input clk, reset_n and en , en = 1 write mode en = 0 read mode
input [7:0] d_in; // define 8 bits input d_in
output [7:0] d_out; // define 8 bits output d_out

//8 resettable and en d flip flop instance
_dff_r_en U0_dff_r_en( 
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[0]),
	.q(d_out[0])
	);

_dff_r_en U1_dff_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[1]),
	.q(d_out[1])
	);
	
_dff_r_en U2_dff_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[2]),
	.q(d_out[2])
	);


_dff_r_en U3_dff_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[3]),
	.q(d_out[3])
	);

_dff_r_en U4_dff_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[4]),
	.q(d_out[4])
	);

_dff_r_en U5_dff_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[5]),
	.q(d_out[5])
	);

_dff_r_en U6_dff_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[6]),
	.q(d_out[6])
	);

_dff_r_en U7_dff_r_en(
	.clk(clk),
	.reset_n(reset_n),
	.en(en),
	.d(d_in[7]),
	.q(d_out[7])
	);
	
endmodule // end of module