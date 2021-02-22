module _inv(a,y); // this module makes inverter
input a; // define input a;
output y; // define output y
assign y= ~a; // y is a's inverse
endmodule // end of module

module _nand2(a,b,y); // this module makes 2 input nand gate
input a,b; // define input a, b
output y; // define output y
assign y = ~(a&b); // y is (a and b)'s inverse
endmodule // end of module

module _and2(a,b,y); // this module makes 2 input and gate
input a,b; // define input a, b
output y; // define output y
assign y = a&b; // y is a and b 
endmodule // end of module

module _or2(a,b,y); // this module makes 2 input or gate
input a,b; // define input a, b
output y; // define output y
assign y = a|b; // y is a or b
endmodule // end of module

module _xor2(a,b,y); // this module makes 2 input exclusive or gate
input a,b; // define input a, b
output y; // define output y
wire inv_a, inv_b; // inv_a means a's inverse, inv_b means b's inverse
wire and_inva_b, and_a_invb; // and_inva_b means inv_a & b, and_a_invb means a & inv_b

_inv U0_inv(.a(a), .y(inv_a)); // Find inv_a by inv operation of a 
_inv U1_inv(.a(b), .y(inv_b)); // Find inv_b by inv operation of b
_and2 U2_and2(.a(inv_a), .b(b), .y(and_inva_b)); // Find and_inva_b by AND operation of inv_a and b
_and2 U3_and2(.a(a), .b(inv_b), .y(and_a_invb)); // Find and_a_invb by AND operation of a and inv_b
_or2 U3_or2(.a(and_inva_b), .b(and_a_invb), .y(y)); // Find y by OR operation of and_inva_b and and_a_invb 
endmodule // end of module
