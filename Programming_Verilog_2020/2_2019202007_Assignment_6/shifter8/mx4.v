module mx4(y, d0, d1, d2, d3, s); // this module makes 4x1 multiplexer
input d0, d1, d2, d3; // define input d0, d1, d2, d3
input [1:0] s; // define 2 bits input s
output y; // define output y

wire mx2_to_mx2_1; // define wire mx2_to_mx2_1 it means U0_mx2 -> U2_mx2
wire mx2_to_mx2_2; // define wire mx2_to_mx2_1 it means U1_mx2 -> U2_mx2


// 3 2x1 multiplexer instance
mx2 U0_mx2( 
	.d0(d0),
	.d1(d1),
	.s(s[0]),
	.y(mx2_to_mx2_1)
	);
	
mx2 U1_mx2(
	.d0(d2),
	.d1(d3),
	.s(s[0]),
	.y(mx2_to_mx2_2)
	);
	
mx2 U2_mx2(
	.d0(mx2_to_mx2_1),
	.d1(mx2_to_mx2_2),
	.s(s[1]),
	.y(y)
	);

endmodule // end of module 
