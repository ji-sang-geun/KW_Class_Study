module mux2_8bits(a,b,sel,d_out); // this module means 8 bits 2 to 1 multiplexer
input [7:0] a,b; // define 8 bits input a,b
input sel; // define input sel
output reg [7:0] d_out; // define 8 bits output and reg d_out

always @ (sel, a, b) // Calculate the d_out through the case statement
	begin // it means 1 time loop, begin - end means { }
		case(sel)
		1'b0: d_out <= a;
		1'b1: d_out <= b;
		default: d_out <= 8'bx; // To prevent the problem of latch
		endcase // end of case 
	end
	
endmodule // end of module

// The above command is if(sel) and assign a:b? a: same as b