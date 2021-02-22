module mux2(a,b,sel,d_out); // this module means 2 to 1 multiplexer
input a,b; // define input a,b
input sel; // define input sel
output reg d_out; // define output and reg d_out

always @ (sel, a, b) // Calculate the d_out through the case statement
	begin // it means 1 time loop, begin - end means { }
		case(sel)
		1'b0: d_out <= a;
		1'b1: d_out <= b;
		default: d_out <= 1'bx; // To prevent the problem of latch
		endcase // end of case 
	end
	
endmodule // end of module

// The above command is if(sel) and assign a:b? a: same as b