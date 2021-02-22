module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err); // this module makes fifo's output logic
input [2:0] state; // define 3 bits input state
input [3:0] data_count; // define 4 bits input data_count
output wr_ack, wr_err, rd_ack, rd_err, full, empty; // define output

parameter INIT = 3'b000; // define INIT is 3'b000
parameter NO_OP = 3'b001; // define NO_OP is 3'b001
parameter WRITE = 3'b010; // define WRITE is 3'b010
parameter READ = 3'b011; // define READ is 3'b011
parameter WR_ERROR = 3'b100; // define WR_ERROR is 3'b100
parameter RD_ERROR = 3'b101; // define RD_ERROR is 3'b101

reg wr_ack, wr_err, rd_ack, rd_err, full, empty; // define reg

always @ (data_count) 
begin // it means 1 time loop, begin - end means { }
	if(data_count == 4'b0000) {empty, full} = 2'b10; // data_count == 0 means empty so, empty is 1
	else if(data_count == 4'b1000) {empty, full} = 2'b01; // data_count == 8 means full so, full is 1
	else {empty, full} = 2'b00; // else, empty and full is both zero
end

always @ (state) 
begin // it means 1 time loop, begin - end means { }
	case(state)
	INIT: {wr_ack, wr_err, rd_ack, rd_err} = 4'b0000; // init means initialize it means all zero
	NO_OP: {wr_ack, wr_err, rd_ack, rd_err} = 4'b0000; // No_OP means no operation
	WRITE: {wr_ack, wr_err, rd_ack, rd_err} = 4'b1000; // WRITE means not full but wr_ack is 1
	READ: {wr_ack, wr_err, rd_ack, rd_err} = 4'b0010; // READ means not empty but rd_ack is 1
	WR_ERROR: {wr_ack, wr_err, rd_ack, rd_err} = 4'b0100; // WR_ERROR means full and then, Write once more 
	RD_ERROR: {wr_ack, wr_err, rd_ack, rd_err} = 4'b0001; // RD_ERROR means empty and then, read once more
	default: {wr_ack, wr_err, rd_ack, rd_err} = 4'bx; // To prevent the problem of latch
	endcase // end of case 
end

endmodule // end of module
