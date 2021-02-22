`timescale 1ns/100ps // set the time of simulation ( Unit / precision)

module tb_Register_file; // define the testbench's name

reg tb_clk, tb_reset_n, tb_we; // define reg tb_clk, tb_reset_n, tb_we
reg [2:0] tb_wAddr, tb_rAddr; // define 3 bits reg tb_wAddr, tb_rAddr
reg [31:0] tb_wData; // define 32 bits reg tb_wData 

wire [31:0] tb_rData; // define 32 bits wire tb_rData it is output 

parameter STEP = 10; // define STEP means 10

Register_file U0_Register_file( // Register_file instance 
	.clk(tb_clk),
	.reset_n(tb_reset_n),
	.wAddr(tb_wAddr),
	.wData(tb_wData),
	.we(tb_we),
	.rAddr(tb_rAddr),
	.rData(tb_rData)
	);

	always #(STEP) tb_clk = ~tb_clk; // The clock is in STEP seconds, that is, every 10 seconds, the clk is reversed from 1 -> 0 0 -> 1.
	
	initial begin // it means 1 time loop, begin - end means { }
	tb_reset_n = 1'b0; tb_clk = 1'b0; tb_wAddr = 3'b0; tb_rAddr = 3'b0; tb_wData = 32'h0; tb_we = 1'b0;
	#(STEP * 1.5); tb_reset_n = 1'b1; tb_we = 1'b1; tb_wData = 32'h11111111;
	#(STEP * 2); tb_wAddr = 3'b001; tb_wData = 32'hff00ff00;
	#(STEP * 2); tb_wAddr = 3'b010; 
	#(STEP * 2); tb_wAddr = 3'b011; tb_wData = 32'h00ff00ff;
	#(STEP * 2); tb_we = 1'b0; tb_rAddr = 3'b001;
	#(STEP * 2); tb_rAddr = 3'b010;
	#(STEP * 2); tb_rAddr = 3'b011;
	#(STEP * 2); $stop; // stop
	end 
	
endmodule // end of module
