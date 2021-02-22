module cal_flags4(op,result,co_add,c3_add,co_sub,c3_sub,c,n,z,v); // this module's goal is print c,n,z,v
	input [2:0] op; // define 3 bits input op 
	input [3:0] result; // define 4 bits input result
	input co_add, c3_add, co_sub, c3_sub; // define input co_add, c3_add, co_sub, c3_sub
	output c,n,z,v; // define output c,n,z,v
	
// c == carry out
// c = 110 -> co_add / c = 111 -> co_sub
assign c = (op[2:1] != 2'b11) ? 1'b0 : ((op[0] == 1'b0) ? co_add : co_sub);
// n == negative	
// sign bit of the result = result[3]
assign n = result[3];
// z == zero
// z = 1 means all bit is zero if there is even one zero, then z = 0
assign z = (result[3:0] == 4'b0000) ? 1'b1 : 1'b0; 
// v == overflow
// v = 110 -> c3_add / v = 111 -> c3_sub
assign v = (op[2:1] != 2'b11) ? 1'b0 : ((op[0] == 1'b0) ? c3_add : c3_sub);
	
	
endmodule // end of module
	