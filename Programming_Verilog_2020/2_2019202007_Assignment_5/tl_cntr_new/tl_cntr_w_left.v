module tl_cntr_w_left(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);		//Traffic Light Controller with Left Turn Signals
input clk, reset_n;
input Ta, Tal, Tb, Tbl;
output [1:0] La, Lb;

wire D2, D1, D0, Q2, Q1, Q0;

ns_logic U0_ns_logic( // next state logic instance
	.Ta(Ta),
	.TaL(Tal),
	.Tb(Tb),
	.TbL(Tbl),
	.Q2(Q2),
	.Q1(Q1),
	.Q0(Q0),
	.D2(D2),
	.D1(D1),
	.D0(D0)
	);
	
_register3_r_async U1_register3_r_async( // resettable 3 bits register instance
	.clk(clk),
	.reset_n(reset_n),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.Q2(Q2),
	.Q1(Q1),
	.Q0(Q0)
	);
	
o_logic U2_o_logic( // output logic instance
	.Q2(Q2),
	.Q1(Q1),
	.Q0(Q0),
	.La1(La[1]),
	.La0(La[0]),
	.Lb1(Lb[1]),
	.Lb0(Lb[0])
	);
	
endmodule // end of module
