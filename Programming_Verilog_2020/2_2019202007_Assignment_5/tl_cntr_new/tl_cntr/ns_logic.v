module ns_logic(Ta, Tb, Q1, Q0, D1, D0); // this module makes next_state logic

input Ta, Tb, Q1, Q0; // define input Ta, Tb, Q1, Q0
output D1, D0; // define output D1, D0

wire inv_Q1, inv_Q0, inv_Ta, inv_Tb; // define wire
wire D0_1, D0_2; 

// four inverter instance
_inv U0_inv(
	.a(Q1),
	.y(inv_Q1)
	);
	
_inv U1_inv(
	.a(Q0),
	.y(inv_Q0)
	);
	
_inv U2_inv(
	.a(Ta),
	.y(inv_Ta)
	);
	
_inv U3_inv(
	.a(Tb),
	.y(inv_Tb)
	);


// two 3 input and gate instance
_and3 U4_and3(
	.a(inv_Q1),
	.b(inv_Q0),
	.c(inv_Ta),
	.y(D0_1)
	);
	
_and3 U5_and3( 
	.a(Q1),
	.b(inv_Q0),
	.c(inv_Tb),
	.y(D0_2)
	);
	
_or2 U6_or2( // 2 input or gate instance
	.a(D0_1),
	.b(D0_2),
	.y(D0)
	);
	
_xor2 U7_xor2( // 2 input xor gate instance
	.a(Q1),
	.b(Q0),
	.y(D1)
	);
	
endmodule // end of module
