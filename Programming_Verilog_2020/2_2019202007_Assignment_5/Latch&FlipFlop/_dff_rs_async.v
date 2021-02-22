module _dff_rs_async(clk, set_n, reset_n, d, q); // this module makes asynchronous reset/set d flipflop
input clk, set_n, reset_n, d; // define input clk, set_n, reset_n, d 
output q; // define output q
reg q; // define reg q

always @(posedge clk or negedge set_n or negedge reset_n) // Run only when clk is rising edge or reset_n is falling edge or set_n is falling edge
begin // begin - end means { }
if (reset_n == 1'b0) q <= 1'b0; // reset_n is active
else if (set_n == 1'b0) q <= 1'b1; // set_n is active
else q <= d;

end

endmodule // end of module
