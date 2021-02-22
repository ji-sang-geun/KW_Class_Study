module dff_r_2bits(clk, reset_n, d, q); // this module means resettable d flipflop 
input clk, reset_n; // define input clk, reset_n
input [1:0] d; // define 2 bits input d
output reg [1:0] q; // define 2 bits output q

always @ (posedge clk or negedge reset_n) // Make flip flop through always statement
begin 
	if(reset_n == 0) q <= 2'b00; // reset is active low so, reset_n == 0  q is reset
	else q <= d; // q = d
end
endmodule // end of module