module _8_to_1_MUX(a,b,c,d,e,f,g,h,sel,d_out); // this module makes 8 to 1 multiplexer
input [31:0] a,b,c,d,e,f,g,h; // define 32 bits input a,b,c,d,e,f,g,h
input [2:0] sel; // define 3 bits input sel
output reg [31:0] d_out; // define 32 bit output d_out and reg d_out

always@ (sel,a,b,c,d,e,f,g,h) // Calculate the next state through the case statement
begin // it means 1 time loop, begin - end means { }
case(sel)
	3'b000 : d_out <= a;
	3'b001 : d_out <= b;
	3'b010 : d_out <= c;
	3'b011 : d_out <= d;
	3'b100 : d_out <= e;
	3'b101 : d_out <= f;
	3'b110 : d_out <= g;
	3'b111 : d_out <= h;
	default : d_out <= 32'bx; // To prevent the problem of latch
endcase // end of case
end
endmodule // end of module 
