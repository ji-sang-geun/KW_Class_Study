module _NAND ( // this is NAND Gate module
	input a, // define input a
	input b, // define input b
	output y // define output y
);

	assign y = ~(a&b); // y is a NAND gate consisting of a and b.
	
endmodule // end of module 
