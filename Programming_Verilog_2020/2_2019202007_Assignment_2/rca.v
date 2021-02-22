module rca(a,b,ci,s,co); // this module makes ripple carry adder
input [3:0] a,b; // define 4 bits input a, b
input ci; // define input ci, it means carry in
output [3:0] s; // define 4 bits output s, it means sum
output co; // define output co, it means carry out
wire [2:0] c; // c means carry out to carry in. it is 3 bits

fa U0_fa( // Find s and co by performing full-adder on a and b and ci
	.a(a[0]), // a is inserted in the a[0] position of the fa module 
	.b(b[0]), // b is inserted in the b[0] position of the fa module
	.ci(ci), // ci is inserted in the ci position of the fa module
	.s(s[0]), // s is inserted in the s[0] position of the fa module
	.co(c[0]) // co is inserted in the c[0] position of the fa module
);

fa U1_fa( // Find s and co by performing full-adder on a and b and ci
	.a(a[1]), // a is inserted in the a[1] position of the fa module
	.b(b[1]), // b is inserted in the b[1] position of the fa module
	.ci(c[0]), // c1 is inserted in the c[0] position of the fa module
	.s(s[1]), // s is inserted in the s[1] position of the fa module
	.co(c[1]) // co is inserted in the c[1] position of the fa module
);
	
fa U2_fa( // Find s and co by performing full-adder on a and b and ci
	.a(a[2]), // a is inserted in the a[2] position of the fa module
	.b(b[2]), // b is inserted in the b[2] position of the fa module
	.ci(c[1]), // ci is inserted in the c[1] position of the fa module
	.s(s[2]), // s is inserted in the s[2] position of the fa module
	.co(c[2]) // co is inserted in the c[2] position of the fa module
);

fa U3_fa( // Find s and co by performing full-adder on a and b and ci
	.a(a[3]), // a is inserted in the a[3] position of the fa module
	.b(b[3]), // b is inserted in the b[3] position of the fa module
	.ci(c[2]), // ci is inserted in the c[2] position of the fa module
	.s(s[3]), // s is inserted in the s[3] position of the fa module
	.co(co) // co is inserted in the co position of the fa module
);

endmodule // end of module
