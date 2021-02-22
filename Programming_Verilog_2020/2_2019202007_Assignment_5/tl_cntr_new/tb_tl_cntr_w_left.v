`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_tl_cntr_w_left;	// define the testbench's name

reg tb_clk, tb_reset_n; // define reg
reg tb_Ta, tb_Tal, tb_Tb, tb_Tbl;

wire [1:0] tb_La, tb_Lb; // define wire

tl_cntr_w_left  U0_tl_cntr_w_left( // traffic light controller with left signals instance
	.clk(tb_clk), 
	.reset_n(tb_reset_n), 
	.Ta(tb_Ta), 
	.Tal(tb_Tal), 
	.Tb(tb_Tb), 
	.Tbl(tb_Tbl), 
	.La(tb_La), 
	.Lb(tb_Lb)
	);
												
always# (5) tb_clk = ~tb_clk;	// The clock is in 5 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.				

initial
begin	 // it means 1 time loop, begin - end means { }
		tb_clk = 0; 	tb_reset_n = 0;
		tb_Ta = 0;		tb_Tal = 0;		tb_Tb = 0;		tb_Tbl = 0;
#20	tb_reset_n = 1;tb_Ta = 1;		tb_Tal = 0;		tb_Tb = 0;		tb_Tbl = 0;
#20	tb_Ta = 0;		tb_Tal = 1;		tb_Tb = 0;		tb_Tbl = 0;
#20	tb_Ta = 0;		tb_Tal = 0;		tb_Tb = 1;		tb_Tbl = 0;
#20	tb_Ta = 0;		tb_Tal = 0;		tb_Tb = 0;		tb_Tbl = 1;
#20	tb_Ta = 1;		tb_Tal = 0;		tb_Tb = 0;		tb_Tbl = 0;
#20 	$stop; // stop
end

endmodule // end of module 









