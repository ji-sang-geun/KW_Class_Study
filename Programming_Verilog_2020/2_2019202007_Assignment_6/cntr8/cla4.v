module cla4(a,b,ci,s,co); // this module makes 4 bits cla

input [3:0] a,b; // define 4 bits input a,b
input ci; // define input ci
output [3:0] s; // define 4 bits output s
output co; // define output co

wire c1, c2, c3; // define wire c1, c2, c3

	fa_v2 U0_fa_v2( // Find s by performing full adder ver2 on a and b and ci
	.a(a[0]), // a is inserted in the a[0] position of the fa_v2 module
	.b(b[0]), // b is inserted in the b[0] position of the fa_v2 module
	.ci(ci), // ci is inserted in the ci position of the fa_v2 module
	.s(s[0]) // s is inserted in the s[0] position of the fa_v2 module
	);
	
	fa_v2 U1_fa_v2( // Find s by performing full adder ver2 on a and b and ci
	.a(a[1]), // a is inserted in the a[1] position of the fa_v2 module
	.b(b[1]), // b is inserted in the b[1] position of the fa_v2 module
	.ci(c1), // ci is inserted in the c1 position of the fa_v2 module
	.s(s[1]) // s is inserted in the s[1] position of the fa_v2 module
	);
	
	fa_v2 U2_fa_v2( // Find s by performing full adder ver2 on a and b and ci
	.a(a[2]), // a is inserted in the a[2] position of the fa_v2 module
	.b(b[2]), // b is inserted in the b[2] position of the fa_v2 module
	.ci(c2), // ci is inserted in the c2 position of the fa_v2 module
	.s(s[2]) // s is inserted in the s[2] position of the fa_v2 module
	);
	
	fa_v2 U3_fa_v2( // Find s by performing full adder ver2 on a and b and ci
	.a(a[3]), // a is inserted in the a[3] position of the fa_v2 module
	.b(b[3]), // b is inserted in the b[3] position of the fa_v2 module
	.ci(c3), // ci is inserted in the c3 position of the fa_v2 module
	.s(s[3]) // s is inserted in the s[3] position of the fa_v2 module
	);
	
	clb4 U4_clb4( // Find co by performing clb4 on a and b and ci and c1 and c2 and c3
	.a(a), // a is inserted in the a position of the clb4 module 
	.b(b), // b is inserted in the b position of the clb4 module 
	.ci(ci), // ci is inserted in the ci position of the clb4 module 
	.c1(c1), // c1 is inserted in the c1 position of the clb4 module 
	.c2(c2), // c2 is inserted in the c2 position of the clb4 module 
	.c3(c3), // c3 is inserted in the c3 position of the clb4 module 
	.co(co) // co is inserted in the co position of the clb4 module 
	);

endmodule // end of module 
