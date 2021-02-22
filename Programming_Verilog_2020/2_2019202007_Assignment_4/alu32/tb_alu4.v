`timescale 1ns/100ps // set the time of simulation ( Unit / precision)

module tb_alu4; // define the testbench's name
	reg [3:0] tb_a, tb_b; // define 4bits register tb_a, tb_b it means testbench's a, testbench's b
	reg [2:0] tb_op; // define 3bits register tb_op it means op Code
	wire [3:0] tb_result; // define 4bits wire tb_result 
	wire tb_c, tb_n, tb_z, tb_v; // define tb_c, tb_n, tb_z, tb_v. tb_c = carry out, tb_n = negative, tb_z = zero, tb_v = overflow
	
	alu4 U0_alu4( // instance alu4 under test
	.a(tb_a),
	.b(tb_b),
	.op(tb_op),
	.result(tb_result),
	.c(tb_c),
	.n(tb_n),
	.z(tb_z),
	.v(tb_v)
	);
	
	// used self-checking testbench
	initial begin // it means 1 time loop, begin - end means { }
		$display("Self-checking START"); // self checking start
		tb_a = 4'b0000; tb_b = 4'b0000; tb_op = 3'b000; #10; // NOT A 
		if(tb_result === 4'b1111) $display("operand 000 Success"); // so, result is 4'b1111
		tb_a = 4'b1100; tb_b = 4'b0000; tb_op = 3'b000;	#10; // NOT A
		if(tb_result === 4'b0011) $display("operand 000 Success"); // so, result is 4'b0011 
		tb_a = 4'b1100; tb_b = 4'b0011; tb_op = 3'b001;	#10; // NOT B
		if(tb_result === 4'b1100) $display("operand 001 Success"); // so, result is 4'b1100
		tb_a = 4'b0101; tb_b = 4'b1001; tb_op = 3'b010;	#10; // AND
		if(tb_result === 4'b0001) $display("operand 010 Success"); // so, result is 4'b0001
		tb_a = 4'b0101; tb_b = 4'b1010; tb_op = 3'b011;	#10; // OR
		if(tb_result === 4'b1111) $display("operand 011 Success"); // so, result is 4'b1111
		tb_a = 4'b0011; tb_b = 4'b0101; tb_op = 3'b100;	#10; // XOR
		if(tb_result === 4'b0110) $display("operand 100 Success"); // so, result is 4'b0110
		tb_a = 4'b0011; tb_b = 4'b0101; tb_op = 3'b101;	#10; // XNOR
		if(tb_result === 4'b1001) $display("operand 101 Success"); // so, result is 4'b1001
		tb_a = 4'ha; tb_b = 4'h3; tb_op = 3'b110;	#10; // addition
		if(tb_result === 4'hd) $display("operand 110 Success"); // so, result is 4'hd
		tb_a = 4'h1; tb_b = 4'h8; tb_op = 3'b110;	#10; // addition
		if(tb_result === 4'h9) $display("operand 110 Success"); // so, result is 4'h9
		tb_a = 4'h7; tb_b = 4'h7; tb_op = 3'b110;	#10; // addition
		if(tb_result === 4'he) $display("operand 110 Success"); // so, result is 4'he
		tb_a = 4'h3; tb_b = 4'h3; tb_op = 3'b110;	#10; // addition
		if(tb_result === 4'h6) $display("operand 110 Success"); // so, result is 4'h6
		tb_a = 4'hf; tb_b = 4'h5; tb_op = 3'b111;	#10; // subtraction
		if(tb_result === 4'ha) $display("operand 111 Success"); // so, result is 4'ha
		tb_a = 4'h5; tb_b = 4'h7; tb_op = 3'b111;	#10; // subtraction
		if(tb_result === 4'he) $display("operand 111 Success"); // so, result is 4'he
		tb_a = 4'ha; tb_b = 4'ha; tb_op = 3'b111;	#10; // subtraction
		if(tb_result === 4'h0) $display("operand 111 Success"); // so, result is 4'h0
		$stop; // stop
	end // end of loop
	endmodule // end of module
