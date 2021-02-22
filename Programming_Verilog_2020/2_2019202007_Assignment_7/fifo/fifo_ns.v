module fifo_ns(wr_en, rd_en, state, data_count, next_state); // this module means next state logic fifo
input wr_en, rd_en; // define input wr_en, rd_en
input [2:0] state; // define 3 bits input state
input [3:0] data_count; // define 4 bits input data_count
output [2:0] next_state; // define 3 bits output next_state

parameter INIT = 3'b000; // define INIT is 3'b000
parameter NO_OP = 3'b001; // define NO_OP is 3'b001
parameter WRITE = 3'b010; // define WRITE is 3'b010
parameter READ = 3'b011; // define READ is 3'b011
parameter WR_ERROR = 3'b100; // define WR_ERROR is 3'b100
parameter RD_ERROR = 3'b101; // define RD_ERROR is 3'b101

reg [2:0] next_state; // define 3 bits reg next_state
reg write_state, read_state, full_state, empty_state, noop_state; // define reg

always @ (wr_en, rd_en, data_count)
begin // it means 1 time loop, begin - end means { }
	if((wr_en)&&(!rd_en)&&(data_count < 4'b1000)) write_state <= 1'b1; // if wr_en == 1 and rd_en == 0 and data_count < 4'b1000 -> write_state == 1
	else write_state <= 1'b0;

	if((!wr_en)&&(rd_en)&&(data_count > 4'b0000)) read_state <= 1'b1; // if wr_en == 0 and rd_en == 1 and data_count > 4'b0000 -> read_state == 1
	else read_state <= 1'b0;

	if((wr_en)&&(!rd_en)&&(data_count == 4'b1000)) full_state <= 1'b1; // if wr_en == 1 and rd_en == 0 and data_count == 4'b1000 -> full_state == 1
	else full_state <= 1'b0;

	if((!wr_en)&&(rd_en)&&(data_count == 4'b0000)) empty_state <= 1'b1; // if wr_en == 0 and rd_en == 0 and data_count == 4'b0000 -> empty_state == 1
	else empty_state = 1'b0;

	if((!wr_en)&&(!rd_en)) noop_state <= 1'b1; // if wr_en == 0 and rd_en == 0 -> noop_state
	else if((wr_en)&&(rd_en)) noop_state <= 1'b1; // if wr_en == 1 and rd_en == 1 -> noop_state
	else noop_state <= 1'b0; 
end

always @ (state, write_state, read_state, full_state, empty_state, noop_state, data_count)
begin // it means 1 time loop, begin - end means { }
	case(state) 
		INIT: begin // Init Case
		if(write_state) next_state <= WRITE;
		else if(empty_state) next_state <= RD_ERROR;
		else if(noop_state) next_state <= NO_OP;
		end
		
		NO_OP: begin // No operation Case
		if(write_state) next_state <= WRITE;
		else if(full_state) next_state <= WR_ERROR;
		else if(read_state) next_state <= READ;
		else if(empty_state) next_state <= RD_ERROR;
		end
		
		WRITE: begin // Write Case 
		if(write_state) next_state <= WRITE;
		else if(read_state) next_state <= READ;
		else if(full_state) next_state <= WR_ERROR;
		else if(noop_state) next_state <= NO_OP;
		end
		
		READ: begin // Read Case
		if(read_state) next_state <= READ;
		else if(write_state) next_state <= WRITE;
		else if(empty_state) next_state <= RD_ERROR;
		else if(noop_state) next_state <= NO_OP;
		end
		
		WR_ERROR: begin // Write Error Case
		if(full_state) next_state <= WR_ERROR;
		else if(read_state) next_state <= READ;
		else if(noop_state) next_state <= NO_OP;
		end
		
		RD_ERROR: begin // Read Error Case
		if(empty_state) next_state <= RD_ERROR;
		else if(write_state) next_state <= WRITE;
		else if(noop_state) next_state <= NO_OP;
		end
		
	endcase // end of case
end
endmodule // end of module

