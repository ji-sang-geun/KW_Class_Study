module _dff_r_en(clk, reset_n, en, d, q); // this module makes resettable and en d flip flop 
input clk, reset_n, en, d; // define input clk, reset_n, en, d. reset_n is active low
output reg q;// define output q and reg q

always @ (posedge clk or negedge reset_n) // Only flip flops must be created using the always statement.
begin 
	if(reset_n == 0) q <= 1'b0; // reset is active low
	else if(en) q <=d; // en is 1 write mode
	else q <= q;
end

endmodule // end of module
