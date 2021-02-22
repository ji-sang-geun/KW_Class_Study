module _dlatch(clk, d, q, q_bar); // this module makes d latch
input clk, d; // define input clk and d
output q, q_bar; // define output q and q_bar

wire d_bar, nand_to_nand1, nand_to_nand2; // define wire

_inv U0_inv( // inverter instance 
	.a(d),
	.y(d_bar)
	);

// four 2 input nand gate instance
_nand2 U1_nand2( 
	.a(d),
	.b(clk),
	.y(nand_to_nand1)
	);
	
_nand2 U2_nand2(
	.a(d_bar),
	.b(clk),
	.y(nand_to_nand2)
	);
	
_nand2 U3_nand2(
	.a(nand_to_nand1),
	.b(q_bar),
	.y(q)
	);
	
_nand2 U4_nand2(
	.a(nand_to_nand2),
	.b(q),
	.y(q_bar)
	);
	
endmodule // end of module
