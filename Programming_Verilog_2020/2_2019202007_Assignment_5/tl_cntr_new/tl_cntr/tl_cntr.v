module tl_cntr(clk, reset_n, Ta, Tb, La, Lb); // this module makes traffic light controller
input clk, reset_n, Ta, Tb; // define input clk, reset_n, Ta, Tb
output [1:0] La, Lb; // define output La, Lb

wire D1, D0, Q1, Q0; // define wire D1, D0, Q1, Q0

ns_logic U0_ns_logic( // next_state_logic instance
	.Ta(Ta),
	.Tb(Tb),
	.Q1(Q1),
	.Q0(Q0),
	.D1(D1),
	.D0(D0)
	);
	
_register2_r_async U1_register2_r_async( // asynchronous 2 bit register instance
	.clk(clk),
	.reset_n(reset_n),
	.D1(D1),
	.D0(D0),
	.Q1(Q1),
	.Q0(Q0)
	);
	
o_logic U2_o_logic( // output logic instance
	.Q1(Q1),
	.Q0(Q0),
	.La1(La[1]),
	.La0(La[0]),
	.Lb1(Lb[1]),
	.Lb0(Lb[0])
	);
	
endmodule // end of module
