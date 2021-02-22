module _23_to_1_MUX(R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,OP_START, INT_MASK, INTERRUPT,sel,d_out); // this module makes 23 to 1 multiplexer
input [63:0] R0,R1,R2,R3,R4,R5,R6,R7,R8,R9; // define 64 bits input register DATA_REG
input [63:0] I0,I1,I2,I3,I4,I5,I6,I7,I8,I9; // define 64 bits input register INST_REG
input [63:0] OP_START, INT_MASK, INTERRUPT; // define 64 bits input register CONT_REG
input [15:0] sel; // define 16 bits input sel
output reg [63:0] d_out; // define 64 bit output d_out and reg d_out

always@ (sel,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,OP_START,INT_MASK,INTERRUPT) // Calculate the next state through the case statement
begin // it means 1 time loop, begin - end means { }
case(sel)
	16'h0100 : d_out <= R0;
	16'h0101 : d_out <= R1;
	16'h0102 : d_out <= R2;
	16'h0103 : d_out <= R3;
	16'h0104 : d_out <= R4;
	16'h0105 : d_out <= R5;
	16'h0106 : d_out <= R6;
	16'h0107 : d_out <= R7;
	16'h0108 : d_out <= R8;
	16'h0109 : d_out <= R9;
	16'h0110 : d_out <= I0;
	16'h0111 : d_out <= I1;
	16'h0112 : d_out <= I2;
	16'h0113 : d_out <= I3;
	16'h0114 : d_out <= I4;
	16'h0115 : d_out <= I5;
	16'h0116 : d_out <= I6;
	16'h0117 : d_out <= I7;
	16'h0118 : d_out <= I8;
	16'h0119 : d_out <= I9;
	16'h0120 : d_out <= OP_START;
	16'h0121 : d_out <= INT_MASK;
	16'h0122 : d_out <= INTERRUPT;
	default : d_out <= 64'bx; // To prevent the problem of latch
	
endcase // end of case
end
endmodule // end of module 
