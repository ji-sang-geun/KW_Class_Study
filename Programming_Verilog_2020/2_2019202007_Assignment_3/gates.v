module _inv(a,y); // this module makes inverter
input a; // define input a
output y; // define output y
assign y = ~a; // y is a's inverse
endmodule // end of module

module _nand2(a,b,y); // this module makes 2 input nand gate
input a,b; // define input a,b
output y; // define output y
assign y = ~(a&b); // y is (a and b)'s inverse
endmodule // end of module

module _and2(a,b,y); // this module makes 2 input and gate
input a,b; // define input a,b
output y; // define output y
assign y = a & b; // y is a and b 
endmodule // end of module

module _or2(a,b,y); // this module makes 2 input or gate
input a,b; // define input a,b
output y; // define output y
assign y = a | b; // y is a or b 
endmodule // end of module

module _xor2(a,b,y); // this module makes 2 input xor gate
input a,b; // define input a,b
output y; // define output y
wire inv_a, inv_b; // inv_a means a's inverse, inv_b means b's inverse
wire w0, w1; // w0 means inv_a & b, w1 means a & inv_b
_inv U0_inv(.a(a), .y(inv_a)); // Find inv_a by inv operation of a 
_inv U1_inv(.a(b), .y(inv_b)); // Find inv_b by inv operation of b
_and2 U2_and2(.a(inv_a), .b(b), .y(w0)); // Find w0 by AND operation of inv_a and b
_and2 U3_and2(.a(a), .b(inv_b), .y(w1)); // Find w1 by AND operation of inv_b and a
_or2 U4_or2(.a(w0), .b(w1), .y(y)); // Find y by OR operation of w0 and w1
endmodule // end of module

module _and3(a,b,c,y); // this module makes 3 input and gate
input a,b,c; // define input a,b,c
output y; // define  output y
assign y = a & b & c; // y is a and b and c
endmodule // end of module

module _and4(a,b,c,d,y); // this module makes 4 input and gate
input a,b,c,d; // define input a,b,c,d
output y; // define output y
assign y = a & b & c & d; // y is a and b and c and d
endmodule // end of module

module _and5(a,b,c,d,e,y); // this module makes 5 input and gate
input a,b,c,d,e; // define input a,b,c,d,e
output y; // define output y
assign y = a & b & c & d & e; // y is a and b and c and d and e
endmodule // end of module

module _or3(a,b,c,y);// this module makes 3 input or gate
input a,b,c; // define input a,b,c
output y; // define output y
assign y= a | b | c; // y is a or b or c
endmodule // end of module

module _or4(a,b,c,d,y); // this module makes 4 input or gate
input a,b,c,d; // define input a,b,c,d
output y; // define output y
assign y = a | b | c | d; // y is a or b or c or d
endmodule // end of module

module _or5(a,b,c,d,e,y); // this module makes 5 input or gate
input a,b,c,d,e; // define input a,b,c,d,e
output y; // define output y
assign y = a | b | c | d | e; // define y is a or b or c or d or e
endmodule // end of module
