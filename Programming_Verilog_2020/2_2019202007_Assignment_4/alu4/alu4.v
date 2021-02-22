module alu4(a,b,op,result,c,n,z,v); // this module makes 4bits arithmetic logic unit 
	input [3:0] a,b; // define 4 bits input a,b
	input [2:0] op; // define 3 bits input op
	output [3:0] result; // define 4 bits output result
	output c,n,z,v; // define output c,n,z,v
	wire [3:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_sub; // define 4 bits wire w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_sub
	wire c3_add, co_add, c3_sub, co_sub; // define wire c3_add, co_add, c3_sub, co_sub
	
	_inv_4bits U0_inv_4bits( // instance _inv_4bits
	.a(a),
	.y(w_not_a) // y is ~a
	);
	
	_inv_4bits U1_inv_4bits( // instance _inv_4bits
	.a(b),
	.y(w_not_b) // y is ~b
	);
	
	_and2_4bits U2_and2_4bits( // instance _and2_4bits
	.a(a),
	.b(b),
	.y(w_and) // y is a and b
	);
	
	_or2_4bits U3_or2_4bits( // instance _or2_4bits
	.a(a),
	.b(b),
	.y(w_or) // y is a or b
	);
	
	_xor2_4bits U4_xor2_4bits( // instance _xor2_4bits
	.a(a),
	.b(b),
	.y(w_xor) // y is a xor b
	);
	
	_xnor2_4bits U5_xnor2_4bits( // instance _xnor2_4bits
	.a(a),
	.b(b),
	.y(w_xnor) // y is a xnor b
	);
	
	cla4_ov U6_cla4_ov( // addition
	.a(a),
	.b(b),
	.ci(1'b0),
	.s(w_add), // goto mx8
	.c3(c3_add), // goto cal_flags
	.co(co_add) // goto cal_flags
	);
	
	cla4_ov U7_cla_ov( // subtraction
	.a(a),
	.b(w_not_b), // it means a + (-b)
	.ci(1'b1),
	.s(w_sub), // goto mx8
	.c3(c3_sub), // goto cal_flags
	.co(co_sub) // goto cal_flags
	);
	
	
	mx8_4bits U8_mx8_4bits( // 8 to 1 multiplexer
	.a(w_not_a), // ~a
	.b(w_not_b), // ~b
	.c(w_and), // a and b
	.d(w_or), // a or b
	.e(w_xor), // a xor b
	.f(w_xnor), // a xnor b
	.g(w_add), // addition (a+b)
	.h(w_sub), // subtraction (a+(-b))
	.s2(op[2]), // 3rd binary opcode
	.s1(op[1]), // 2nd binary opcode
	.s0(op[0]), // 1st binary opcode
	.y(result) // result 
	);
	
	cal_flags4 U9_cal_flag4( // cal_flag it means, find result's c,n,z,v 
	.op(op), // opcode 
	.result(result), 
	.co_add(co_add),
	.c3_add(c3_add),
	.co_sub(co_sub),
	.c3_sub(c3_sub),
	.c(c), // carry
	.n(n), // negative
	.z(z), // zero
	.v(v) // overflow
	);
	
	endmodule // end of module
	
	
	