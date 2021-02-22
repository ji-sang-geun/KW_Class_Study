module fa( // this module makes full adder
	input a, b, ci, // define input a, b, ci ci means carry in
	output s, co // define output s, co s means sum, co means carry out
);

	wire sm,c1,c2; // sm means s to b, c1,c2 means co to OR operation 
	
	ha U0_ha( // Find s and co by performing half-adder on a and b
		.a(b), // a is inserted in the b position of the ha module
		.b(ci), // b is inserted in the ci position of the ha module
		.s(sm), // s is inserted in the sm position of the ha module
		.co(c1) // co is inserted in the c1 position of the ha module
	);
	
	ha U1_ha( // Find s and co by performing half-adder on a and b
		.a(a), // a is inserted in the a position of the ha module
		.b(sm), // b is inserted in the sm position of the ha module
		.s(s), // s is inserted in the s position of the ha module
		.co(c2) // co is inserted in the c2 position of the ha module
	);
	
	_or2 U2_or2( // Find y by OR operation of a and b
		.a(c1), // a is inserted in the c1 position of the _or2 module
		.b(c2), // b is inserted in the c2 position of the _or2 module
		.y(co) // y is inserted in the co position of the _or module
	);
endmodule // end of module
