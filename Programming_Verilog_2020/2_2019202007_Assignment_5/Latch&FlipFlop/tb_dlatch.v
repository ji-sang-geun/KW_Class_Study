`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_dlatch; // define the testbench's name

reg tb_clk, tb_d; // define reg tb_clk, tb_d
wire tb_q, tb_q_bar; // define wire tb_q, tb_q_bar

parameter STEP = 10; // define STEP means 10

_dlatch U0_dlatch( // _dlatch instance
	.clk(tb_clk),
	.d(tb_d),
	.q(tb_q),
	.q_bar(tb_q_bar)
	);
	
always #(STEP/2) tb_clk = ~tb_clk; // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.

initial 
begin // it means 1 time loop, begin - end means { }
tb_clk = 1'b0; tb_d = 1'b0;
#(STEP * 1.5); tb_d = 1'b1;
#(STEP); tb_clk = 1'b1;
#(STEP * 0.5); tb_d = 1'b0;
#(STEP * 2); tb_clk = 1'b0;
#(STEP); tb_d = 1'b1;
#(STEP); tb_d = 1'b0;
#(STEP * 0.5); tb_clk = 1'b1;
#(STEP * 1.5); tb_d = 1'b1;
#(STEP); tb_clk = 1'b0;
#(STEP); tb_d = 1'b0;
#(STEP * 1.5); tb_clk = 1'b1;
#(STEP * 2); $stop; // stop
end

endmodule // end of module
