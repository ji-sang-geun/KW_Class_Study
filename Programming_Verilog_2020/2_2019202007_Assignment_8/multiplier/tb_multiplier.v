`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_multiplier; // define the testbench's name

reg tb_clk, tb_reset_n; // define reg tb_clk, tb_reset_n
reg [63:0] tb_multiplier; // define 64 bits tb_multiplier
reg [63:0] tb_multiplicand; // define 64 bits reg tb_multiplication
reg tb_op_start, tb_op_clear; // define reg tb_op_start, tb_op_clear

wire tb_op_done; // define wire tb_op_done
wire [127:0] tb_result; // define 128 bits wire tb_result

multiplier U0_multiplier( // multiplier instance
	.clk(tb_clk),
	.reset_n(tb_reset_n),
	.multiplier(tb_multiplier),
	.multiplicand(tb_multiplicand),
	.op_start(tb_op_start),
	.op_clear(tb_op_clear),
	.op_done(tb_op_done),
	.result(tb_result)
	);
	
always #7 tb_clk = ~tb_clk; // The clock changes every 7 seconds

initial begin
tb_clk = 1'b0; tb_reset_n = 1'b0; tb_op_start = 1'b0; tb_op_clear = 1'b0; 
tb_multiplier = ~(64'b100000) + 64'b1; tb_multiplicand = ~(64'b100000) + 64'b1; // Add 1 for 2's complement
#10 tb_reset_n = 1'b1; tb_op_start = 1'b1; // If reset_n == 1 and op_start == 1, booth multiplication is performed
#1000
$stop; 
end

endmodule // end of module
