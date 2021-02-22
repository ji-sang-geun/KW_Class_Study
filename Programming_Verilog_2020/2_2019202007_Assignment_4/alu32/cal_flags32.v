module cal_flags32(op, result, co_add, co_prev_add, co_sub, co_prev_sub,c,n,z,v); // this module's goal is to find and print c,n,z,v
input [2:0] op; // define 3 bits input op. it means op code 
input [31:0] result; // define 32 bits input result 
input co_add, co_prev_add, co_sub, co_prev_sub; // define input co_add, co_sub, co_prev_add, co_prev_sub 
output c,n,z,v; // define output c,n,z,v

// c == carry out
// c = 110 -> co_add / c = 111 -> co_sub
assign c = (op[2:1] != 2'b11) ? 1'b0 : ((op[0] == 1'b0) ? co_add : co_sub);
// n == negative	
// sign bit of the result = result[31]
assign n = result[31];
// z == zero
// z = 1 means all bit is zero if there is even one zero, then z = 0
assign z = (result[31:0] == 32'h0000_0000) ? 1'b1 : 1'b0;
// v == overflow
// v = 110 -> co_add^co_prev_add / v = 111 -> co_sub^co_prev_sub
assign v = (op[2:1] != 2'b11) ? 1'b0 : ((op[0] == 1'b0) ? co_prev_add^co_add : co_prev_sub^co_sub);

endmodule // end of module
