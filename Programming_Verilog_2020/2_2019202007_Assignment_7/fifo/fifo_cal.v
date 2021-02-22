module fifo_cal(state, data_count, head, tail, next_data_count, next_head, next_tail, we, re); // this module makes calculate address logic fifo
input [2:0] state, head, tail; // define 3 bits input state, head, tail
input [3:0] data_count; // define 4 bits input data_count
output [2:0] next_head, next_tail; // define 3 bits output next_head, next_tail
output [3:0] next_data_count; // define 4 bits output next_data_count
output we, re; // define output we, re

parameter INIT = 3'b000; // define INIT is 3'b000
parameter NO_OP = 3'b001; // define NO_OP is 3'b001
parameter WRITE = 3'b010; // define WRITE is 3'b010
parameter READ = 3'b011; // define READ is 3'b011
parameter WR_ERROR = 3'b100; // define WR_ERROR is 3'b100
parameter RD_ERROR = 3'b101; // define RD_ERROR is 3'b101

reg we, re; // define reg we, re
reg [2:0] next_head, next_tail; // define 3 bits reg next_head, next_tail
reg [3:0] next_data_count; // define 4 bits reg next_data_count

always @ (state, data_count)
begin // it means 1 time loop, begin - end means { }
	case(state)
		INIT: begin // INIT CASE
		next_head <= 3'b000;
		next_tail <= 3'b000;
		next_data_count <= 4'b0000;
		{we,re} <= 2'b00;
		end
		
		NO_OP: begin // NO_OP CASE
		next_head <= head;
		next_tail <= tail;
		next_data_count <= data_count;
		{we,re} <= 2'b00;
		end
		
		WRITE: begin // WRITE CASE
		next_head <= head;
		next_tail <= tail + 3'b001;
		next_data_count <= data_count + 4'b0001;
		{we,re} <= 2'b10;
		end
		
		READ: begin // READ CASE
		next_head <= head + 3'b001;
		next_tail <= tail;
		next_data_count <= data_count - 4'b0001;
		{we, re} <= 2'b01;
		end
		
		WR_ERROR: begin // WR_ERROR CASE
		next_head <= head;
		next_tail <= tail;
		next_data_count <= 4'b1000;
		{we, re} <= 2'b00;
		end
		
		RD_ERROR: begin // RD_ERROR CASE
		next_head <= head;
		next_tail <= tail;
		next_data_count <= 4'b0000;
		{we, re} <= 2'b00;
		end
		
		default: begin // To prevent the problem of latch
		next_head <= 3'bx;
		next_tail <= 3'bx;
		next_data_count <= 4'bx;
		{we, re} <= 2'bx;
		end
	endcase // end of case
end

endmodule // end of module
