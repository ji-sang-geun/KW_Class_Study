module alu32(clk,reset_n,a,b,op,result); // this module makes arithmetic logic unit 32bits 
input clk, reset_n; // define clock, reset_n. reset_n is low active
input [31:0] a,b; // define 32 bits input a,b
input [2:0] op; // define 3 bits input op, it means op code
output reg [31:0] result; // define 32 bits output result 

reg [31:0] next_result;

wire [31:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_sub; // define 64 bits wire w_not_a, w_not_b, w_and, w_or, w_nor, w_xnor, w_add, w_sub
wire co_prev_add, co_add, co_prev_sub, co_sub; // define co_prev_add, co_add, co_prev_sub, co_sub

always@(posedge clk or negedge reset_n) begin
	if(reset_n == 1'b0) result <= 32'b0;
	else result <= next_result;
end

always @(op, next_result) begin
	case({1'b0,op})
		3'b000: next_result <= result; //NOP
		3'b001: next_result <= w_not_a;
		3'b010: next_result <= w_and;
		3'b011: next_result <= w_or;
		3'b100: next_result <= w_xor;
		3'b101: next_result <= w_xnor;
		3'b110: next_result <= w_add;
		3'b111: next_result <= w_sub;
		default: next_result <= 32'bx;
	endcase
end

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
	
endmodule
