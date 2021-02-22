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

module _inv_4bits(a,y); // this module makes 4 bits inverter 
input [3:0] a; // define 4 bits input a
output [3:0] y; // define 4 bits output y
assign y = ~a; // y is not a
endmodule // end of module

module _and2_4bits(a,b,y); // this module makes 4 bits and gate 
input [3:0] a,b; // define 4 bits input a,b
output [3:0] y; // define 4 bits output y
assign y = a&b; // y is a and b
endmodule // end of module

module _or2_4bits(a,b,y); // this module makes 4 bits or gate
input [3:0] a,b; // define 4 bits input a,b
output [3:0] y; // define 4 bits output y
assign y =a|b; // y = a or b
endmodule // end of module 

module _xor2_4bits(a,b,y); // this module makes 4 bits xor gate
input [3:0] a,b; // define 4 bits input a,b
output [3:0] y; // define 4 bits output y
	_xor2 U0_xor2( // first instance _xor2 gate
	.a(a[0]),
	.b(b[0]), 
	.y(y[0])
	);
	_xor2 U1_xor2( // second instance _xor2 gate
	.a(a[1]),
	.b(b[1]),
	.y(y[1])
	);
	_xor2 U2_xor2( // third instance _xor2 gate
	.a(a[2]),
	.b(b[2]),
	.y(y[2])
	);
	_xor2 U3_xor2( // fourth instance _xor2 gate
	.a(a[3]),
	.b(b[3]),
	.y(y[3])
	);
endmodule // end of module

module _xnor2_4bits(a,b,y); // this module makes 4 bits xnor gate
input [3:0] a,b; // define 4 bits input a,b
output [3:0] y; // define 4 bits output y
wire [3:0] w0; // define 4 bits wire w0
	_xor2_4bits U0_xor2_4bits( // instance _xor2_4bits
	.a(a),
	.b(b),
	.y(w0)
	);
	_inv_4bits U1_inv_4bits( // instance _inv_4bits
	.a(w0),
	.y(y)
	);
endmodule // end of module 

module _inv_32bits(a,y); // this module makes 32 bits inverter
input [31:0] a; // define 32 bits input a
output [31:0] y; // define 32 bits output b
assign y = ~a; // y = ~a
endmodule // end of module

module _and2_32bits(a,b,y); // this module makes 32 bits 2-to-1 and gate
input [31:0] a,b; // define 32 bits input a,b
output [31:0] y; // define 32bits output y
assign y = a&b; // y = a and b
endmodule // end of module

module _or2_32bits(a,b,y); // this module makes 32 bits 2-to-1 or gate
input [31:0] a,b; // define 32bits input a,b
output [31:0] y; // define 32bits output y
assign y = a|b; // y = a or b
endmodule // end of module

module _xor2_32bits(a,b,y); // this module makes 32bits xor2 gate
input [31:0] a,b; // define 32bits input a,b
output [31:0] y; // define 32bits output y

_xor2_4bits U0_xor2_4bits( // 1st instance xor2_4bits
	.a(a[3:0]),
	.b(b[3:0]),
	.y(y[3:0])
	);

_xor2_4bits U1_xor2_4bits( // 2nd instance xor2_4bits
	.a(a[7:4]),
	.b(b[3:0]),
	.y(y[7:4])
	);

_xor2_4bits U2_xor2_4bits( // 3rd instance xor2_4bits
	.a(a[11:8]),
	.b(b[11:8]),
	.y(y[11:8])
	);

_xor2_4bits U3_xor2_4bits( // 4th instance xor2_4bits
	.a(a[15:12]),
	.b(b[15:12]),
	.y(y[15:12])
	);
	
_xor2_4bits U4_xor2_4bits( // 5th instance xor2_4bits
	.a(a[19:16]),
	.b(b[19:16]),
	.y(y[19:16])
	);
	
_xor2_4bits U5_xor2_4bits( // 6th instance xor2_4bits
	.a(a[23:20]),
	.b(b[23:20]),
	.y(y[23:20])
	);

_xor2_4bits U6_xor2_4bits( // 7th instance xor2_4bits
	.a(a[27:24]),
	.b(b[27:24]),
	.y(y[27:24])
	);
	
_xor2_4bits U7_xor2_4bits( // 8th instance xor2_4bits
	.a(a[31:28]),
	.b(b[31:28]),
	.y(y[31:28])
	);

endmodule // end of module 

module _xnor2_32bits(a,b,y); // this module makes xnor2_32bits
input [31:0] a,b; // define 32 bits input a,b
output [31:0] y; // define 32 bits output y

_xnor2_4bits U0_xnor2_4bits( // 1st instance xnor2_4bits
	.a(a[3:0]),
	.b(b[3:0]),
	.y(y[3:0])
	);
	
_xnor2_4bits U1_xnor2_4bits( // 2nd instance xnor2_4bits
	.a(a[7:4]),
	.b(b[7:4]),
	.y(y[7:4])
	);
	
_xnor2_4bits U2_xnor2_4bits( // 3rd instance xnor2_4bits
	.a(a[11:8]),
	.b(b[11:8]),
	.y(y[11:8])
	);

_xnor2_4bits U3_xnor2_4bits( // 4th instance xnor2_4bits
	.a(a[15:12]),
	.b(b[15:12]),
	.y(y[15:12])
	);
	
_xnor2_4bits U4_xnor2_4bits( // 5th instance xnor2_4bits
	.a(a[19:16]),
	.b(b[19:16]),
	.y(y[19:16])
	);
	
_xnor2_4bits U5_xnor2_4bits( // 6th instance xnor2_4bits
	.a(a[23:20]),
	.b(b[23:20]),
	.y(y[23:20])
	);
	
_xnor2_4bits U6_xnor2_4bits( // 7th instance xnor2_4bits
	.a(a[27:24]),
	.b(b[27:24]),
	.y(y[27:24])
	);
	
_xnor2_4bits U7_xnor2_4bits( // 8th instance xnor2_4bits
	.a(a[31:28]),
	.b(b[31:28]),
	.y(y[31:28])
	);
endmodule // end of module
