module ns_logic(load, inc, state, next_state); // this module makes next state logic

//Defined as a three-digit binary code defined from DEC2_STATE, DEC_STATE, INC2_STATE, INC_STATE, IDLE_STATE, LOAD_STATE
parameter IDLE_STATE = 3'b000;
parameter LOAD_STATE = 3'b001;
parameter INC_STATE = 3'b010;
parameter INC2_STATE = 3'b011;
parameter DEC_STATE = 3'b100;
parameter DEC2_STATE = 3'b101;

input load, inc; // define input load, inc
input [2:0] state; // define 3 bits input state
output [2:0] next_state; // define 3 bits  output next_state

reg [2:0] next_state;

always @ (load, inc, state) // Calculate the next state through the case statement 
begin // begin - end means { }
case(state)
	IDLE_STATE : begin // begin - end means { }
	if(load == 1'b1) next_state <= LOAD_STATE; // load is true next state is load state
	else if(inc == 1'b1) next_state <= INC_STATE; // inc == increase, inc is true next state is inc state
	else if(inc == 1'b0) next_state <= DEC_STATE; // dec == decrease, inc is false next state is dec state
	else next_state <= IDLE_STATE; // If nothing, the next state is the idle state.
	end
	LOAD_STATE : begin // begin - end means { }
	if(load == 1'b1) next_state <= LOAD_STATE;
	else if(inc == 1'b1) next_state <= INC_STATE;
	else if(inc == 1'b0) next_state <= DEC_STATE;
	else next_state <= LOAD_STATE;
	end
	INC_STATE : begin // begin - end means { }
	if(load == 1'b1) next_state <= LOAD_STATE;
	else if(inc == 1'b1) next_state <= INC2_STATE;
	else if(inc == 1'b0) next_state <= DEC_STATE;
	else next_state <= INC_STATE;
	end
	INC2_STATE : begin // begin - end means { }
	if(load == 1'b1) next_state <= LOAD_STATE;
	else if(inc == 1'b1) next_state <= INC_STATE;
	else if(inc == 1'b0) next_state <= DEC_STATE;
	else next_state <= INC2_STATE;
	end
	DEC_STATE : begin // begin - end means { }
	if(load == 1'b1) next_state <= LOAD_STATE;
	else if(inc == 1'b1) next_state <= INC_STATE;
	else if(inc == 1'b0) next_state <= DEC2_STATE;
	else next_state <= DEC_STATE;
	end
	DEC2_STATE : begin // begin - end means { }
	if(load == 1'b1) next_state <= LOAD_STATE; 
	else if(inc == 1'b1) next_state <= INC_STATE;
	else if(inc == 1'b0) next_state <= DEC_STATE;
	else next_state <= DEC2_STATE;
	end
	default : next_state <= 3'bx; // To prevent the problem of latch
endcase // end of case
end
endmodule // end of module

	