`timescale 1ns/100ps // set the time of simulation ( Unit / precision)

module tb_cla_clk; // define the testbench's name

reg clock; // define register clock 
reg [31:0] tb_a, tb_b; // define 32 bits register tb_a, tb_b it means testbench's a, testbench's b
reg tb_ci; // define register tb_ci it means testbench's ci

wire [31:0] tb_s_cla; // define 32 bits wire tb_s_cla
wire tb_co_cla; // define wire tb_co_cla

parameter STEP = 10; // 10 units in step

	cla_clk U0_cla_clk( // Find s_cla, co_cla by performing cla_clk module on a and b and clock and ci
	.clock(clock), // clock is inserted in the clock position of the cla_clk module
	.a(tb_a), // a is inserted in the tb_a position of the cla_clk module
	.b(tb_b), // b is inserted in the tb_b position of the cla_clk module
	.ci(tb_ci), // ci is inserted in the tb_ci position of the cla_clk module
	.s_cla(tb_s_cla), // s_cla is inserted in the tb_s_cla position of the cla_clk module
	.co_cla(tb_co_cla) // co_cla is inserted in the tb_co_cla position of the cla_clk module
	);
	
	always # (STEP/2) clock = ~clock; // always# (STEP/2) clock = ~clock; If you declare the code, the value of clock changes every STEP/2 cycle.
	
	initial
	begin // it means 1 time loop, begin - end means { }
	clock = 1'b1; tb_a = 32'h0000_0000; tb_b = 32'h0000_0000; tb_ci = 1'b0; // clock : 1 tb_a : 0x0000_0000 tb_b : 0x0000_0000 tb_ci : 0
	#(STEP); tb_a = 32'hFFFF_FFFF; tb_b = 32'h0000_0000; tb_ci = 1'b1; // wait for step and then, tb_a : 0xFFFF_FFFF tb_b : 0x0000_0000 tb_ci : 1
	#(STEP); tb_a = 32'h0000_FFFF; tb_b = 32'hFFFF_0000; tb_ci = 1'b0; // wait for step and then, tb_a : 0x0000_FFFF tb_b : 0xFFFF_0000 tb_ci : 0
	#(STEP); tb_a = 32'h135f_a562; tb_b = 32'h3561_4642; tb_ci = 1'b0; // wait for step and then, tb_a : 0x135f_a562 tb_b : 0x3561_4642 tb_ci : 0
	#(STEP*2); $stop; // wait for 2 step and then stop
	end // end of loop
endmodule // end of module
