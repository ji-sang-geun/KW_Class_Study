module cla32(a,b,ci,s,co); // this module makes 32 bits cla

input [31:0] a,b; // define 32 bits input a,b
input ci; // define input ci
output [31:0] s; // define  32 bits output s
output co; // define output co

wire c1, c2, c3; // define wires

// to make 32 bits cla
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
		.co(co)
		);
		
endmodule // end of module
