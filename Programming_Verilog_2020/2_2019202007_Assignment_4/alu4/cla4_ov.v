module cla4_ov(a,b,ci,s,c3,co); // this module is 4bits carry look ahead finding overflow 

input [3:0] a,b; // define 4 bits input a,b
input ci; // define input ci it means carry in
output [3:0] s; // define 4 bits output s
output c3, co; // define output c3, co

wire c1, c2; // define wire c1, c2

	fa_v2 U0_fa_v2( // first instance full adder version 2
	.a(a[0]),
	.b(b[0]),
	.ci(ci), // put ci into carry in
	.s(s[0])
	);
	
	fa_v2 U1_fa_v2( // second instance full adder version 2
	.a(a[1]),
	.b(b[1]),
	.ci(c1), // put c1 into carry in
	.s(s[1])
	);
	
	fa_v2 U2_fa_v2( // third instance full adder version 2
	.a(a[2]),
	.b(b[2]),
	.ci(c2), // put c2 into carry in
	.s(s[2])
	);
	
	fa_v2 U3_fa_v2( // fourth instance full adder version 2
	.a(a[3]),
	.b(b[3]),
	.ci(c3), // put c3 into carry in
	.s(s[3])
	);
	
	clb4 U4_clb4( // fifth instance carry look ahead block
	.a(a),
	.b(b),
	.ci(ci),
	.c1(c1),
	.c2(c2),
	.c3(c3),
	.co(co) // carry out 
	);
	
endmodule // end of module 
