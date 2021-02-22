`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_tl_cntr; // define the testbench's name

reg tb_clk, tb_reset_n, tb_Ta, tb_Tb; // define reg tb_clk, tb_reset_n, tb_Ta, tb_Tb
wire [1:0] tb_La, tb_Lb; // define 2 bits wire tb_La, tb_Lb

tl_cntr U0_tl_cntr( // traffic light controller instance
	.clk(tb_clk),
	.reset_n(tb_reset_n),
	.Ta(tb_Ta),
	.Tb(tb_Tb),
	.La(tb_La),
	.Lb(tb_Lb)
	);
	
parameter STEP = 10; // define STEP means 10

always #(3) tb_clk = ~tb_clk; // The clock is in 3 seconds, that is, every 3 seconds, the clk is reversed from 1 -> 0 0 -> 1.

initial 
begin // it means 1 time loop, begin - end means { }
tb_clk = 1'b0; tb_reset_n = 1'b0; tb_Ta = 1'b0; tb_Tb = 1'b0;
#(STEP/2); tb_reset_n = 1'b1;
#(STEP); tb_Ta = 1'b1;
#(STEP); tb_Ta = 1'b0; tb_Tb = 1'b1;
#(STEP); tb_Ta = 1'b1;
#(STEP); $stop; // stop
end

endmodule // end of module
