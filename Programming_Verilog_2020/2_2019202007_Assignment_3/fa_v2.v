module fa_v2(a,b,ci,s); // this module makes full adder version 2
input a,b,ci; // define input a,b,ci
output s; // define output s
wire w0; // define wire w0 

	_xor2 U0_xor2( // Find y by performing XOR operation on a and b
	.a(a), // a is inserted in the a position of the _xor2 module
	.b(b), // b is inserted in the b position of the _xor2 module
	.y(w0) // y is inserted in the w0 position of the _xor2 module
	);
	
	_xor2 U1_xor2( // Find y by performing XOR operation on a and b
	.a(w0), // a is inserted in the w0 position of the _xor2 module
	.b(ci), // b is inserted in the ci position of the _xor2 module
	.y(s) // y is inserted in the s position of the _xor2 module
	);
	

endmodule // end of module 
