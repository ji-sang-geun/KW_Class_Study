`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_dff_rs_sync_async; // define the testbench's name

reg tb_clk, tb_set_n, tb_reset_n, tb_d; // define reg tb_clk, tb_set_n, tb_reset_n, tb_d
wire tb_q_sync, tb_q_async; // define wire tb_q_sync, tb_q_async

parameter STEP = 10; // define STEP means 10

_dff_rs_sync_async U0_dff_rs_sync_async( // _dff_rs_sync_async instance
	.clk(tb_clk),
	.set_n(tb_set_n),
	.reset_n(tb_reset_n),
	.d(tb_d),
	.q_sync(tb_q_sync),
	.q_async(tb_q_async)
	);
	
	always #(STEP/2) tb_clk = ~(tb_clk); // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.
	always #(STEP *0.7) tb_d = ~(tb_d); // The d is in STEP*0.7 seconds, that is, every 7 seconds, the d is reversed from 1 -> 0 0 -> 1.
	
	initial
	begin // it means 1 time loop, begin - end means { }
	tb_clk = 1'b0; tb_d = 0; tb_reset_n = 1'b0; tb_set_n = 1'b1;
	#(STEP); tb_reset_n = 1'b1;
	#(STEP); tb_reset_n = 1'b0;
	#(STEP); tb_reset_n = 1'b1; tb_set_n = 1'b0;
	#(STEP); tb_set_n = 1'b1;
	#(STEP); tb_set_n = 1'b0;
	#(STEP); tb_reset_n = 1'b0;
	#(STEP); $stop; // stop
	end
	
endmodule // end of module
