module mux3_32bits(a,b,c,sel,d_out); // this module means 32 bits 3 to 1 multiplexer
input [31:0] a,b,c; // define 32 bits input a,b,c
input [1:0] sel; // define 2 bits input sel
output reg [31:0] d_out; // define 32 bits output and reg d_out

always @ (sel, a, b, c) // Calculate the d_out through the case statement
	begin // it means 1 time loop, begin - end means { }
		case(sel)
		2'b00: d_out <= a;
		2'b01: d_out <= b;
		2'b10: d_out <= c;
		default: d_out <= 32'bx; // To prevent the problem of latch
		endcase // end of case 
	end
	
endmodule // end of module

// The above command is if(sel) and assign a:b? a: same as b