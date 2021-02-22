module os_logic(state, d_in, d_out); // this module makes output logic

//Defined as a three-digit binary code defined from DEC2_STATE, DEC_STATE, INC2_STATE, INC_STATE, IDLE_STATE, LOAD_STATE
parameter IDLE_STATE = 3'b000;
parameter LOAD_STATE = 3'b001;
parameter INC_STATE = 3'b010;
parameter INC2_STATE = 3'b011;
parameter DEC_STATE = 3'b100;
parameter DEC2_STATE = 3'b101;

input [2:0] state; // define 3 bits input state
input [7:0] d_in; // define 8 bits input d_in
output [7:0] d_out; // define 8 bits output d_out

reg [7:0] d_out; // define 8 bits reg d_out
wire [7:0] d_inc; // define 8 bits wire d_inc
wire [7:0] d_dec; // define 8 biis wire d_dec

always @ (state) // Calculate the next state through the case statement 
begin // begin - end means { }
	case(state)
		IDLE_STATE : d_out = 8'b00000000;
		LOAD_STATE : d_out = d_in;
		INC_STATE : d_out = d_inc;
		INC2_STATE : d_out = d_inc;
		DEC_STATE : d_out = d_dec;
		DEC2_STATE : d_out = d_dec;
		default : d_out = 8'bx; // To prevent the problem of latch
	endcase
end

// 2 cla8 instance
cla8 U0_cla8( // increase
	.a(d_out),
	.b(8'b00000001), // +1
	.ci(1'b0), 
	.s(d_inc),
	.co()
	);

cla8 U1_cla8( // decrease
	.a(d_out),
	.b(8'b11111111), // -1
	.ci(1'b0),
	.s(d_dec),
	.co()
	);
	
endmodule // end of module
