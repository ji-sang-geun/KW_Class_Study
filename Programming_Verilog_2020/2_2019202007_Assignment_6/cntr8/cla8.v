module cla8(a,b,ci,s,co); // this module means 8 bits CLA
input [7:0] a,b; // define 8 bits input a,b
input ci; // define input ci it means carry in
output [7:0] s; // define 8 bits output s;
output co; // define output co it means carry out

wire c1; // define wire c1

// 2 cla4 instance
cla4 U0_cla4( 
	.a(a[3:0]),
	.b(b[3:0]),
	.ci(ci),
	.s(s[3:0]),
	.co(c1)
	);
	
cla4 U1_cla4(
	.a(a[7:4]),
	.b(b[7:4]),
	.ci(c1),
	.s(s[7:4]),
	.co(co)
	);
	
endmodule // end of module
