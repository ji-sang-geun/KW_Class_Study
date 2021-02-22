module ha( // this module means half adder
input a,b, // define input a,b
output s,co // define output s,co s means sum and co means carry out
);

	_and2 U0_and2( // Find y by performing AND operation on a and b
		.a(a), // a is inserted in the a position of the _and2 module
		.b(b), // b is inserted in the b position of the _and2 module
		.y(co) // y is inserted in the co position of the _and2 module
	);
	
	_xor2 U1_xor2( // Find y by performing Exclusive OR operation on a and b
		.a(a), // a is inserted in the a position of the _and2 module
		.b(b), // b is inserted in the a position of the _and2 module
		.y(s) // y is inserted in the a position of the _and2 module
	);

endmodule // end of module
