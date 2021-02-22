module mx2(
	input d0, // define input d0 
	input d1, // define input d1
	input s, // define input s
	output y // define output y
);

	wire sb; // sb is iv0 to nd20 
	wire w0; // w0 is nd20 to nd22
	wire w1; // w1 is nd21 to nd22
   
	_INV iv0( // inverse s to sb
		.s(s), // s is inserted in the s position of the _INV module
		.sb(sb) // sb is inserted in the sb position of the _INV module
	);

	_NAND nd20( // Find w0 by NAND operation of d0 and sb
		.a(d0), // d0 is inserted in the a position of the _NAND module
		.b(sb), // sb is inserted in the b position of the _NAND module
		.y(w0) // w0 is inserted in the y position of the _NAND module
	);
	
	_NAND nd21( // Find w1 by NAND operation of d1 and s
		.a(d1), // d1 is inserted in the a position of the _NAND module
		.b(s), // s is inserted in the b position of the _NAND module
		.y(w1) // w1 is inserted in the y position of the _NAND module
	);
	
	_NAND nd22( // Find y by NAND operation of w0 and w1
		.a(w0), // w0 is inserted in the a position of the _NAND module
		.b(w1), // w1 is inserted in the b position of the _NAND module
		.y(y) // y is inserted in the y position of the _NAND module
	);
	
endmodule // end of module