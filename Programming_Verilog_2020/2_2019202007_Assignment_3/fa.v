module fa(a,b,ci,s,co); // this module makes full adder

input a,b,ci; // define input a,b,ci
output s,co; // define output s,co

wire [2:0]w; // wire means co to OR operation

	ha U0_ha( // Find s and co by performing half-adder on a and b
	.a(b), // a is inserted in the b position of the ha module
	.b(ci), // b is inserted in the ci position of the ha module
	.s(w[0]), // s is inserted in the w[0] position of the ha module
	.co(w[1]) // co is inserted in the w[1] position of the ha module
	);
	
	ha U1_ha( // Find s and co by performing half-adder on a and b
	.a(a), // a is inserted in the a position of the ha module
	.b(w[0]), // b is inserted in the w[0] position of the ha module
	.s(s), // s is inserted in the s position of the ha module
	.co(w[2]) // co is inserted in the w[2] position of the ha module
	);
	
	_or2 U2_or2( // Find y by OR operation of a and b
	.a(w[1]), // a is inserted in the w[1] position of the _or2 module
	.b(w[2]), // b is inserted in the w[2] position of the _or2 module
	.y(co) // y is inserted in the co position of the _or2 module
	);
	
	endmodule // end of module
	