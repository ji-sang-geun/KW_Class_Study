module cla8(a,b,ci,s,co); // this module makes 8 bits cla

input [7:0] a,b; // define 8 bits input a, b
input ci;
output [7:0] s; // define 8 bits output s
output co; // define output co

wire c1; // define wire c1

// to make 8 bits cla
cla4 U0_cla4( // cla4 instance
	.a(a[3:0]),
	.b(b[3:0]),
	.ci(ci),
	.s(s[3:0]),
	.co(c1)
	);
	
cla4 U1_cla4( // cla4 instance
	.a(a[7:4]),
	.b(b[7:4]),
	.ci(c1),
	.s(s[7:4]),
	.co(co)
	);
	
endmodule // end of module 