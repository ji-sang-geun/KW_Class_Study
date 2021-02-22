module _3_to_8_decoder(d,q); // this module is 3 to 8 decorder module
input [2:0] d; // define 3 bits input d
output reg [7:0] q; // define 8 bits output q and 8 bits reg q

always @ (d) // Calculate the next state through the case statement
begin // begin - end means { }
	case(d) 
	3'b000 : q = 8'b0000_0001;
	3'b001 : q = 8'b0000_0010;
	3'b010 : q = 8'b0000_0100;
	3'b011 : q = 8'b0000_1000;
	3'b100 : q = 8'b0001_0000;
	3'b101 : q = 8'b0010_0000;
	3'b110 : q = 8'b0100_0000;
	3'b111 : q = 8'b1000_0000;
	default : q = 8'hx; // To prevent the problem of latch
	endcase // end of case
end
endmodule // end of module
