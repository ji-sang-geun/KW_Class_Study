module _dff4_r(clk, reset_n, d, q); // this module means 4 bits resettable d flipflop 
input clk, reset_n; // define input clk, reset_n
input [3:0] d; // define 4 bits input d
output reg [3:0] q; // define output q

always @ (posedge clk or negedge reset_n) // Make flip flop through always statement
begin 
	if(reset_n == 0) q <= 4'b0; // reset is active low so, reset_n == 0  q is reset
	else q <= d; // q = d
end
endmodule // end of module
