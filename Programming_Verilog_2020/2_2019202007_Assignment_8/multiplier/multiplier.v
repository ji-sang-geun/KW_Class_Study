module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);
	input clk, reset_n; // Define clock and reset_bar
	input [63:0] multiplier; // define multiplier 
	input [63:0] multiplicand; // define multiplicand
	input op_start, op_clear; // define start operation, clear operation
	
	output op_done; // define done operation
	output [127:0] result; // define multiplier result (64+ 64) 
	
	wire [1:0] state;
	wire [6:0] cycle_counter;
	wire [63:0] addition ,subtraction;
	
	ns_logic U0_ns_logic( // ns_logic instance
		.clk(clk),
		.reset_n(reset_n),
		.op_start(op_start),
		.op_clear(op_clear),
		.op_done(op_done),
		.state(state),
		.counter(cycle_counter)
		);
		
	o_logic U1_o_logic( // o_logic instance
		.clk(clk),
		.reset_n(reset_n),
		.multiplier(multiplier),
		.multiplicand(multiplicand),
		.state(state),
		.counter(cycle_counter),
		.op_done(op_done),
		.result(result)
		);
	
	endmodule // end of module