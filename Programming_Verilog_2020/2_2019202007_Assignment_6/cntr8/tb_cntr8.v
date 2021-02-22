`timescale 1ns/100ps // set the time of simulation ( Unit / precision)

module tb_cntr8; // define the testbench's name

reg tb_clk, tb_reset_n, tb_inc, tb_load; // define reg tb_clk, tb_reset_n, tb_inc, tb_load
reg [7:0] tb_d_in; // define 8 bits reg tb_d_in
wire [7:0] tb_d_out; // define 8 bits wire tb_d_out
wire [2:0] tb_o_state; // define 3 bit wire tb_o_state

parameter STEP = 10; // define STEP means 10

cntr8 U0_cntr8( // cntr8 instance
	.clk(tb_clk),
	.reset_n(tb_reset_n),
	.inc(tb_inc),
	.load(tb_load),
	.d_in(tb_d_in),
	.d_out(tb_d_out),
	.o_state(tb_o_state)
	);
	
	always #(STEP/2) tb_clk = ~tb_clk;  // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.

	initial begin // it means 1 time loop, begin - end means { }
	tb_reset_n = 1'b0; tb_clk = 1'b1; tb_inc = 1'b0; tb_load = 1'b0; tb_d_in = 8'b0;
	#(STEP*1.5); tb_reset_n = 1'b1; tb_inc = 1'b1; 
	#(STEP*4); tb_inc = 1'b0;
	#(STEP*4); tb_inc = 1'b1; tb_load = 1'b1; tb_d_in = 8'hff;
	#(STEP); tb_inc = 1'b1;
	#(STEP*2); $stop; // stop
	end
	
	endmodule // end of module
	
	