module mx2_32bits(d0,d1,s,y); // this module makes 32bits 2 to 1 multiplexer
input [31:0] d0,d1; // define 32 bits input d0,d1
input s; // define input s
output [31:0] y; // define 32 bits output y

// y = sbar * d0 + s * d1, sbar means inverse to s
assign y = (s == 0) ? d0 : d1; // so, So, if s is 0, it depends on the value of d0, and if s is 1, the result depends on the value of d1.

endmodule // end of module
