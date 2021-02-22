module o_logic(Q1,Q0,La1,La0,Lb1,Lb0); // this module means output logic

input Q1, Q0; // define input Q1, Q0
output La1, La0, Lb1, Lb0; // define output La1, La0, Lb1, Lb0

wire inv_Q1; // define wire inv_Q1

_inv U0_inv( // inverter instance
	.a(Q1),
	.y(inv_Q1)
	);
	
// two 2 input and gate instance	
_and2 U1_and2(
	.a(inv_Q1),
	.b(Q0),
	.y(La0)
	);
	
_and2 U2_and2(
	.a(Q1),
	.b(Q0),
	.y(Lb0)
	);

assign La1 = Q1; // La1 = Q1;
assign Lb1 = inv_Q1; // Lb1 = ~Q1;

endmodule // end of module
