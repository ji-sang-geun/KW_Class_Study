module ha(a,b,s,co); // this module makes half adder

input a,b; // define input a,b
output s,co; // define output s,co s means sum and co means carry out

assign s = a^b; // Find y by performing Exclusive OR operation on a and b
assign co = a&b; // Find y by performing AND operation on a and b

endmodule // end of module
