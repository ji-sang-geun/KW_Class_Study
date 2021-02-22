`timescale 1ns/100ps // set the time of simulation ( Unit / precision)

module tb_cnt5; // define the testbench's name
	reg tb_clk, tb_reset_n, tb_inc;
	wire [2:0] tb_cnt;
	
	parameter STEP = 10; // define STEP means 10
	
	cnt5 U0_cnt5( // 5 way counter instance
		.cnt(tb_cnt),
		.clk(tb_clk),
		.reset_n(tb_reset_n),
		.inc(tb_inc)
		);
	
	always # (STEP/2) tb_clk = ~tb_clk; // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.
	
	initial begin // it means 1 time loop, begin - end means { }
	tb_reset_n = 1'b0; tb_clk = 1'b1; tb_inc = 1'b1;
	#(STEP); tb_reset_n = 1'b1; tb_inc = 1'b1;
	#(STEP); tb_inc = 1'b1;
	#(STEP); tb_inc = 1'b1;
	#(STEP); tb_inc = 1'b1;
	#(STEP); tb_inc = 1'b0;
	#(STEP); tb_inc = 1'b0;
	#(STEP); tb_inc = 1'b0;
	#(STEP); tb_reset_n = 1'b0;
	#(STEP*2); $stop; // stop 
	end
		
endmodule // end of module
