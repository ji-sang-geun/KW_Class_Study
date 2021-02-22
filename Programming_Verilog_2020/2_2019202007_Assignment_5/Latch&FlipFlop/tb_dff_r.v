`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_dff_r; // define the testbench's name

reg tb_d, tb_reset_n, tb_clk; // define reg tb_d, tb_reset_n, tb_clk
wire tb_q; // define wire tb_q

parameter STEP = 10; // define STEP means 10

_dff_r U0_dff_r( // d flipflop instance
	.d(tb_d),
	.reset_n(tb_reset_n),
	.clk(tb_clk),
	.q(tb_q)
	);

always # (STEP/2) tb_clk = ~tb_clk; // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.
	
initial
begin // it means 1 time loop, begin - end means { }
tb_reset_n = 1'b0; tb_clk = 1'b0; tb_d = 1'b0;
#(STEP/4); tb_d = 1'b1;
#(STEP); tb_reset_n = 1'b1; tb_d = 1'b0;
#(STEP); tb_d = 1'b1;
#(STEP); tb_d = 1'b0;
#(STEP); tb_d = 1'b1;
#(STEP); tb_d = 1'b0;
#(STEP); tb_d = 1'b1;
#(STEP); tb_d = 1'b0;
#(STEP*2); tb_d = 1'b1;
#(STEP); tb_d = 1'b0;
#(STEP); tb_d = 1'b1;
#(STEP); $stop; // stop
end

endmodule // end of module
