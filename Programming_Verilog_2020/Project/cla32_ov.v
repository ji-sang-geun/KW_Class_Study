module cla32_ov(a,b,ci,s,co_prev,co); // this module is 32bits carry look ahead finding overflow 
input [31:0] a,b; // define 32 bits input a,b
input ci; // define input ci
output [31:0] s; // define 32 bits output s 
output co_prev; // define output co_prev
output co; // define output co

wire c1,c2,c3,c4,c5,c6,c7; // define wire c1, c2, c3, c4, c5, c6, c7

cla4 U0_cla4( // 1st instance cla4 
	.a(a[3:0]),
	.b(b[3:0]),
	.ci(ci), // put ci into carry in
	.s(s[3:0]),
	.co(c1) // receives c1 through co
	);
	
cla4 U1_cla4( // 2nd instance cla4 
	.a(a[7:4]),
	.b(b[7:4]),
	.ci(c1), // put c1 into carry in
	.s(s[7:4]),
	.co(c2) // receives c2 through co
	);
	
cla4 U2_cla4( // 3rd instance cla4 
	.a(a[11:8]),
	.b(b[11:8]),
	.ci(c2), // put c2 into carry in
	.s(s[11:8]),
	.co(c3) // receives c3 through co
	);

cla4 U3_cla4( // 4th instance cla4 
	.a(a[15:12]),
	.b(b[15:12]),
	.ci(c3), // put c3 into carry in
	.s(s[15:12]),
	.co(c4) // receives c4 through co
	);

cla4 U4_cla4( // 5th instance cla4 
	.a(a[19:16]),
	.b(b[19:16]),
	.ci(c4), // put c4 into carry in
	.s(s[19:16]),
	.co(c5) // receives c5 through co 
	);
	
cla4 U5_cla4( // 6th instance cla4 
	.a(a[23:20]),
	.b(b[23:20]),
	.ci(c5), //put c5 into carry in
	.s(s[23:20]),
	.co(c6) // receives c6 through co
	);
	
cla4 U6_cla4( // 7th instance cla4
	.a(a[27:24]),
	.b(b[27:24]),
	.ci(c6), // put c6 into carry in
	.s(s[27:24]),
	.co(c7) // receives c7 through co
	);

cla4_ov U7_cla4_ov( // 8th instance cla4_ov
	.a(a[31:28]),
	.b(b[31:28]),
	.ci(c7), // put c7 into carry in
	.s(s[31:28]),
	.c3(co_prev), // receives c_prev through c3
	.co(co) // receives co through co
	);

endmodule // end of module
