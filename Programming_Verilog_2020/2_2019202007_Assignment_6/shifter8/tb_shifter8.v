`timescale 1ns/100ps // set the time of simulation ( Unit / precision)

module tb_shifter8; // define the testbench's name

reg tb_clk, tb_reset_n; // define reg tb_clk, tb_reset_n
reg [2:0] tb_op; // define 3 bits reg tb_op it means op code 
reg [1:0] tb_shamt; // define 2 bits reg tb_shamt it means shift amount
reg [7:0] tb_d_in; // define 8 bits reg tb_d_in 

wire [7:0] tb_d_out; // define 8 bits wire tb_d_out it is output 

parameter STEP = 10; // define STEP means 10

shifter8 U0_shifter8( // shifter8 instance
	.clk(tb_clk),
	.reset_n(tb_reset_n),
	.op(tb_op),
	.shamt(tb_shamt),
	.d_in(tb_d_in),
	.d_out(tb_d_out)
	);
	
	always # (STEP/2) tb_clk = ~tb_clk; // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.
	
	initial begin // it means 1 time loop, begin - end means { }
	tb_reset_n = 1'b0; tb_clk = 1'b1; tb_op = 3'b0; tb_shamt = 2'b0; tb_d_in = 8'b0; 
	#(STEP); tb_reset_n = 1'b1; tb_op = 3'b001; tb_d_in = 8'b01110111; 
	#(STEP); tb_op = 3'b010; 
	#(STEP); tb_shamt = 2'b01;
	#(STEP); tb_op = 3'b011;
	#(STEP); tb_op = 3'b010; tb_shamt = 2'b11; tb_d_in = 8'b01110111;
	#(STEP); tb_op = 3'b001; tb_d_in = 8'b10000111; 
	#(STEP); tb_op = 3'b100; tb_shamt = 2'b01;
	#(STEP); tb_shamt = 2'b11;
	#(STEP*2); $stop; // stop
	end
	
endmodule // end of module
