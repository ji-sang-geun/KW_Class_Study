module ASR8(d_in, shamt, d_out); // this module means 8 bits Arthmetic Shift Left 
input [7:0] d_in; // define 8 bits input d_in
input [1:0] shamt; // define 2 bits input shamt. it means shift amount
output [7:0] d_out; // define 8 bits output d_out

// 8 mx4 instances
mx4 U7_mx4( // D7
	.y(d_out[7]),
	.d0(d_in[7]),
	.d1(d_in[7]),
	.d2(d_in[7]),
	.d3(d_in[7]),
	.s(shamt)
	);
	
mx4 U6_mx4( // D6
	.y(d_out[6]),
	.d0(d_in[6]),
	.d1(d_in[7]),
	.d2(d_in[7]),
	.d3(d_in[7]),
	.s(shamt)
	);
	
mx4 U5_mx4( // D5
	.y(d_out[5]),
	.d0(d_in[5]),
	.d1(d_in[6]),
	.d2(d_in[7]),
	.d3(d_in[7]),
	.s(shamt)
	);
	
mx4 U4_mx4( // D4
	.y(d_out[4]),
	.d0(d_in[4]),
	.d1(d_in[5]),
	.d2(d_in[6]),
	.d3(d_in[7]),
	.s(shamt)
	);

mx4 U3_mx4( // D3
	.y(d_out[3]),
	.d0(d_in[3]),
	.d1(d_in[4]),
	.d2(d_in[5]),
	.d3(d_in[6]),
	.s(shamt)
	);

mx4 U2_mx4( // D2
	.y(d_out[2]),
	.d0(d_in[2]),
	.d1(d_in[3]),
	.d2(d_in[4]),
	.d3(d_in[5]),
	.s(shamt)
	);
	
mx4 U1_mx4( // D1
	.y(d_out[1]),
	.d0(d_in[1]),
	.d1(d_in[2]),
	.d2(d_in[3]),
	.d3(d_in[4]),
	.s(shamt)
	);

mx4 U0_mx4( // D0
	.y(d_out[0]),
	.d0(d_in[0]),
	.d1(d_in[1]),
	.d2(d_in[2]),
	.d3(d_in[3]),
	.s(shamt)
	);
	
endmodule // end of module
