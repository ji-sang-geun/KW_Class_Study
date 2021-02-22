module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state); // this module makes 8 bits loadable up and down Counter
input clk, reset_n, inc, load; // define input clk, reset_n. inc, load
input [7:0] d_in; // define 8 bits input d_in
output [7:0] d_out; // define 8 bits output d_out
output [2:0] o_state; // define 3 bits output o_state

wire [2:0] next_state; // define 3 bits wire next_state
wire [2:0] state; // define 3 bits wire state

assign o_state = state; // Assign state to o_state

ns_logic U0_ns_logic( // ns_logic instance
	.load(load),
	.inc(inc),
	.state(state),
	.next_state(next_state)
	);

_register3_r U0_register3_r( // _register3_r instance
	.clk(clk),
	.reset_n(reset_n),
	.d(next_state),
	.q(state)
	);
	
os_logic U0_os_logic( // os_logic instance
	.state(state),
	.d_in(d_in),
	.d_out(d_out)
	);
	 
endmodule // end of module
