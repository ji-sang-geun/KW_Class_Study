module cla64(a,b,ci,s,co); // this module makes 64 bits cla

input [63:0] a,b; // define 64 bits input a,b
input ci; // define input ci
output [63:0] s; // define  64 bits output s
output co; // define output co

wire c1, c2, c3, c4, c5, c6, c7; // define wires

// to make 64 bits cla
	cla8 U0_cla8( 
		.a(a[7:0]),
		.b(b[7:0]),
		.ci(ci),
		.s(s[7:0]),
		.co(c1)
		);

	cla8 U1_cla8(
		.a(a[15:8]),
		.b(b[15:8]),
		.ci(c1),
		.s(s[15:8]),
		.co(c2)
		);
		
	cla8 U2_cla8(
		.a(a[23:16]),
		.b(b[23:16]),
		.ci(c2),
		.s(s[23:16]),
		.co(c3)
		);
		
	cla8 U3_cla8(
		.a(a[31:24]),
		.b(b[31:24]),
		.ci(c3),
		.s(s[31:24]),
		.co(c4)
		);
		
	cla8 U4_cla8(
		.a(a[39:32]),
		.b(b[39:32]),
		.ci(c4),
		.s(s[39:32]),
		.co(c5)
		);
		
	cla8 U5_cla8(
		.a(a[47:40]),
		.b(b[47:40]),
		.ci(c5),
		.s(s[47:40]),
		.co(c6)
		);
		
	cla8 U6_cla8(
		.a(a[55:48]),
		.b(b[55:48]),
		.ci(c6),
		.s(s[55:48]),
		.co(c7)
		);

	cla8 U7_cla8(
		.a(a[63:56]),
		.b(b[63:56]),
		.ci(c7),
		.s(s[63:56]),
		.co(co)
		);
		
endmodule // end of module
