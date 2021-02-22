module _INV( // this is Inverter module
	input s, // define input s
	output sb // define output sb
);

	assign sb = ~s; // sb is inverse of s
endmodule // end of module
