module _dff_rs_sync_async(clk, set_n, reset_n, d, q_sync, q_async); // this module means to compare asynchronous reset/set d flipflop and synchronous reset/set d flipflop
input clk, set_n, reset_n, d; // define input clk, set_n, reset_n, d
output q_sync, q_async; // define output q_sync, q_async

// synchronous set/reset d flipflop instance 
_dff_rs_sync U0_dff_rs_sync( 
	.clk(clk),
	.set_n(set_n),
	.reset_n(reset_n),
	.d(d),
	.q(q_sync)
	);

// asynchronous set/reset d flipflop instance	
_dff_rs_async U1_dff_rs_async(
	.clk(clk),
	.set_n(set_n),
	.reset_n(reset_n),
	.d(d),
	.q(q_async)
	);
	
endmodule // end of module
