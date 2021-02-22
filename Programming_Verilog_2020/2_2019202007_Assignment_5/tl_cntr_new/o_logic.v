module o_logic(Q2, Q1, Q0, La1, La0, Lb1, Lb0); // this module makes output logic

input Q2, Q1, Q0; // define input Q2, Q1, Q0
output La1, La0, Lb1, Lb0; // define output La1, La0, Lb1, Lb0

wire inv_Q2, inv_Q0; // Q1 is no inverse

wire out_La1, out_Lb1; // define wire

// two inverter instance
_inv U0_inv( 
	.a(Q2),
	.y(inv_Q2)
	);
	
_inv U1_inv(
	.a(Q0),
	.y(inv_Q0)
	);
	
// La 
// La1 = Q1*Q0` + Q2
_and2 U0_and2(
	.a(Q1),
	.b(inv_Q0),
	.y(out_La1)
	);

_or2 U1_or2(
	.a(out_La1),
	.b(Q2),
	.y(La1)
	);
	
// La0 = Q0 + Q2
_or2 U2_or2(
	.a(Q0),
	.b(Q2),
	.y(La0)
	);
	
// Lb
// Lb1 = Q2` + Q1 * Q0`
_and2 U3_and2(
	.a(Q1),
	.b(inv_Q0),
	.y(out_Lb1)
	);
	
_or2 U4_or2(
	.a(inv_Q2),
	.b(out_Lb1),
	.y(Lb1)
	);
	
// Lb0 = Q2` + Q0
_or2 U5_or2(
	.a(inv_Q2),
	.b(Q0),
	.y(Lb0)
	);
	
endmodule // end of module

	