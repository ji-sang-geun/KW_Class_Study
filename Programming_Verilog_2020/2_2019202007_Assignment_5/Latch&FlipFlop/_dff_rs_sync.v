module _dff_rs_sync(clk, set_n, reset_n, d, q); // this module makes d synchronous reset/set flipflop 
input clk, set_n, reset_n, d; // define input clk, set_n, reset_n, d
output q; // define output q
reg q; // define reg q

always @(posedge clk) // Run only when clk is rising edge
begin // begin - end means { }
if(reset_n == 1'b0) q <= 1'b0; // reset_n is active
else if(set_n == 1'b0) q <= 1'b1; // set_n is active
else q<= d;

end

endmodule // end of module

