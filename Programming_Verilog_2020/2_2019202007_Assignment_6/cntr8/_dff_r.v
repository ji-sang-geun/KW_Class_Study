module _dff_r(clk, reset_n, d, q); // this module means resettable d flipflop 
input clk, reset_n, d; // define input clk, reset_n, d
output reg q; // define output q

always @ (posedge clk or negedge reset_n) // Make flip flop through always statement
begin 
	if(reset_n == 0) q <= 1'b0; // reset is active low so, reset_n == 0  q is reset
	else q <= d; // q = d
end
endmodule // end of module
