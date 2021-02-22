module cc_logic(op, shamt, d_in, d_out, d_next); // this module means combinational circuits logic
input [2:0] op; // define 3 bits input op, it means op code
input [1:0] shamt; // define 2 bits input shamt, it means shift amount
input [7:0] d_in; // define 8 bits input d_in
input [7:0] d_out; // define 8 bits input d_out
output reg [7:0] d_next; // define 8 bits output and reg d_next

wire [7:0] d_lsl; // define 8 bits wire d_lsl
wire [7:0] d_lsr; // define 8 bits wire d_lsr
wire [7:0] d_asr; // define 8 bits wire d_asr

// Defined as a three-digit binary code defined from NOP, LOAD, LSL, LSR, ASR
parameter NOP = 3'b000; 
parameter LOAD = 3'b001;
parameter LSL = 3'b010;
parameter LSR = 3'b011;
parameter ASR = 3'b100;

always @ (op, shamt, d_in, d_out, d_lsl, d_lsr, d_asr) // Calculate the next state through the case statement 
begin // begin - end means { }
	case(op) 
		NOP : d_next <= 8'b0;
		LOAD : d_next <= d_in;
		LSL : d_next <= d_lsl;
		LSR : d_next <= d_lsr;
		ASR : d_next <= d_asr;
		default : d_next <= 8'bx; // To prevent the problem of latch
	endcase // end of case
end

LSL8 U0_LSL8( // LSL8 instance
	.d_in(d_out),
	.shamt(shamt),
	.d_out(d_lsl)
	);
	
LSR8 U0_LSR8( // LSR8 instance
	.d_in(d_out),
	.shamt(shamt),
	.d_out(d_lsr)
	);
	
ASR8 U0_ASR8( // ASR8 instance
	.d_in(d_out),
	.shamt(shamt),
	.d_out(d_asr)
	);
	
endmodule // end of module
