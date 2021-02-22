module alu32(a,b,op,result,c,n,z,v); // this module makes arithmetic logic unit 32bits 
input [31:0] a,b; // define 32 bits input a,b
input [2:0] op; // define 3 bits input op, it means op code
output [31:0] result; // define 32 bits output result 
output c,n,z,v; // define output c,n,z,v

wire [31:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_sub; // define 32 bits wire w_not_a, w_not_b, w_and, w_or, w_nor, w_xnor, w_add, w_sub
wire co_prev_add, co_add, co_prev_sub, co_sub; // define co_prev_add, co_add, co_prev_sub, co_sub

_inv_32bits U0_inv_32bits( // instance 32bits inverter
	.a(a),
	.y(w_not_a)
	);
	
_inv_32bits U1_inv_32bits( // instance 32bits inverter
	.a(b),
	.y(w_not_b)
	);
	
_and2_32bits U2_and2_32bits( // instance 32bits and gate
	.a(a),
	.b(b),
	.y(w_and)
	);

_or2_32bits U3_or2_32bits( // instance 32bits or gate
	.a(a),
	.b(b),
	.y(w_or)
	);

_xor2_32bits U4_xor2_32bits( // instance 32bits xor gate
	.a(a),
	.b(b),
	.y(w_xor)
	);
	
_xnor2_32bits U5_xnor2_32bits( // instance 32bits xnor gate
	.a(a),
	.b(b),
	.y(w_xnor)
	);
	
cla32_ov U6_cla32_ov( // addition
	.a(a),
	.b(b),
	.ci(1'b0),
	.s(w_add),
	.co_prev(co_prev_add),
	.co(co_add)
	);
	
cla32_ov U7_cla32_ov( //subtraction
	.a(a),
	.b(w_not_b),
	.ci(1'b1),
	.s(w_sub),
	.co_prev(co_prev_sub),
	.co(co_sub)
	);
	
mx8_32bits U8_mx8_32bits( // 8 to 1 32bit multiplexer
	.a(w_not_a),
	.b(w_not_b),
	.c(w_and),
	.d(w_or),
	.e(w_xor),
	.f(w_xnor),
	.g(w_add),
	.h(w_sub),
	.s2(op[2]),
	.s1(op[1]),
	.s0(op[0]),
	.y(result)
	);

cal_flags32 U9_cal_flags32( // instance 32bits cal flags
	.op(op),
	.result(result),
	.co_add(co_add),
	.co_prev_add(co_prev_add),
	.co_sub(co_sub),
	.co_prev_sub(co_prev_sub),
	.c(c),
	.n(n),
	.z(z),
	.v(v)
	);
	
endmodule