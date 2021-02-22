module fifo(clk, reset_n, d_in, wr_en, rd_en, d_out, data_count, rd_err, rd_ack, wr_err, wr_ack, empty, full);
input clk, reset_n, wr_en, rd_en; // define inpt
input [31:0] d_in; // define 32 bits input din 

output full, empty, wr_ack, wr_err, rd_ack, rd_err; // define output
output [3:0] data_count; // define 4 bits output data_count
output [31:0] d_out; // define 32 bits output dout

wire we, re; // define wire we, re
wire [2:0] head, next_head, tail, next_tail, state, next_state; // define 3 bits wire
wire [3:0] next_data_count; // define 4 bits wire
wire [31:0] reg_to_mux, mux_to_ff; // define 32 bits wire

// one 4 bits d flipflop instance
_dff4_r data_count_dff_r(
	.clk(clk),
	.reset_n(reset_n),
	.d(next_data_count),
	.q(data_count)
	);

// three 3 bits d flipflop instance 	
_dff3_r state_dff_r( 
	.clk(clk),
	.reset_n(reset_n),
	.d(next_state),
	.q(state)
	);	
_dff3_r head_dff_r(
	.clk(clk),
	.reset_n(reset_n),
	.d(next_head),
	.q(head)
	);
_dff3_r tail_dff_r(
	.clk(clk),
	.reset_n(reset_n),
	.d(next_tail),
	.q(tail)
	);

// one fifo_next_state instance
fifo_ns U0_fifo_ns(
	.wr_en(wr_en),
	.rd_en(rd_en),
	.state(state),
	.data_count(data_count),
	.next_state(next_state)
	);

// one fifo_calculator instance	
fifo_cal U1_fifo_Cal(
	.state(next_state),
	.data_count(data_count),
	.head(head),
	.tail(tail),
	.next_data_count(next_data_count),
	.next_head(next_head),
	.next_tail(next_tail),
	.we(we),
	.re(re)
	);
	
// one fifo_output logic instance	
fifo_out U2_fifo_out(
	.state(state),
	.data_count(data_count),
	.full(full),
	.empty(empty),
	.wr_ack(wr_ack),
	.wr_err(wr_err),
	.rd_ack(rd_ack),
	.rd_err(rd_err)
	);
	
// one Register_file instance	
Register_file U3_Register_file(
	.clk(clk),
	.reset_n(reset_n),
	.wAddr(tail),
	.wData(d_in),
	.we(we),
	.rAddr(head),
	.rData(reg_to_mux)
	);
	
// one 32 bits 2 to 1 multiplexer instance		
_2_to_1_MUX32 U4_2_to_1_MUX32(
	.a(32'h00),
	.b(reg_to_mux),
	.sel(re),
	.d_out(mux_to_ff)
	);

// one 32 bits d flipflop instance
_dff32_r dout_dff_r(
	.clk(clk),
	.reset_n(reset_n),
	.d(mux_to_ff),
	.q(d_out)
	);

endmodule // end of module
