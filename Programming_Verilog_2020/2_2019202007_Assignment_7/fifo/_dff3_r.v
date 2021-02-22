module _dff3_r(clk, reset_n, d, q); // this module means 3 bits resettable d flipflop 
input clk, reset_n; // define input clk, reset_n
input [2:0] d; // define 3 bits input d
output reg [2:0] q; // define 3 bits output q

always @ (posedge clk or negedge reset_n) // Make flip flop through always statement
begin 
	if(reset_n == 0) q <= 3'b0; // reset is active low so, reset_n == 0  q is reset
	else q <= d; // q = d
end
endmodule // end of module
