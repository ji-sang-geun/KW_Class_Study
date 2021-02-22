`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_dff_en; // define the testbench's name

reg tb_clk, tb_en, tb_d; // define reg tb_clk, tb_en, tb_d
wire tb_q; // define wire tb_q

parameter STEP = 10; // define STEP means 10

_dff_en U0_dff_en( // d flipflop instance
	.en(tb_en),
	.clk(tb_clk),
	.d(tb_d),
	.q(tb_q)
	);
	
	always #(STEP/2) tb_clk = ~tb_clk; // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.
	
	initial
	begin // it means 1 time loop, begin - end means { }
	tb_clk = 1'b0; tb_en = 1'b1; tb_d = 1'b0;
	#(STEP/4); tb_d = 1'b1;
	#(STEP); tb_d = 1'b0;
	#(STEP); tb_d = 1'b1;
	#(STEP); tb_d = 1'b0;
	#(STEP); tb_d = 1'b1;
	#(STEP); tb_d = 1'b0; tb_en = 1'b0;
	#(STEP); tb_d = 1'b1;
	#(STEP); tb_d = 1'b0;
	#(STEP); tb_d = 1'b1;
	#(STEP); tb_d = 1'b0;
	#(STEP); tb_d = 1'b1;
	#(STEP); tb_d = 1'b0;
	#(STEP); $stop; // stop
	end
	endmodule // end of module
	