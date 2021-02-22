`timescale 1ns/100ps // set the time of simulation ( Unit / precision)

module tb_cla4; // define the testbench's name

reg [3:0] tb_a, tb_b; // deifne 4 bits register tb_a, tb_b it means testbench's a, testbench's b
reg tb_ci; // define register tb_ci. it means testbench's ci
wire [3:0] tb_s; // define 4 bits wire tb_s. it means testbench's s
wire tb_co; // define wire tb_co. it means testbench's co
wire [4:0] tb_result; // define 4 bits wire tb_result. it means testbench's result  

assign tb_result = {tb_co, tb_s}; // Sum and carry out concatenation. Check the results together

	cla4 U0_cla4( // named port mapping method
	.a(tb_a),
	.b(tb_b),
	.ci(tb_ci),
	.s(tb_s),
	.co(tb_co)
	);
	
	initial
	begin // it means 1 time loop, begin - end means { }
	tb_a = 0; tb_b = 0; tb_ci = 0; // wait for 10 time unit tb_a : 0 tb_ b :0 tb_ ci : 0
	#10; tb_a = 4'h3; tb_b = 4'h5; tb_ci = 0; // wait for 10 time unit and then, tb_a : 0011 tb_b : 0101 tb_ci : 0
	#10; tb_a = 4'h7; tb_b = 4'h9; tb_ci = 0; // wait for 10 time unit and then, tb_a : 0111 tb_b : 1001 tb_ci : 0
	#10; tb_a = 4'h5; tb_b = 4'h5; tb_ci = 1; // wait for 10 time unit and then, tb_a : 0101 tb_b : 0101 tb_ci : 1
	#10; tb_a = 4'h8; tb_b = 4'h7; tb_ci = 1; // wait for 10 time unit and then, tb_a : 1000 tb_b : 0111 tb_ci : 1
	#10; tb_a = 4'hf; tb_b = 4'hf; tb_ci = 0; // wait for 10 time unit and then, tb_a : 1111 tb_b : 1111 tb_ci : 0
	#10; tb_a = 4'hf; tb_b = 4'hf; tb_ci = 1; // wait for 10 time unit and then, tb_a : 1111 tb_b : 1111 tb_ci : 1
	#10; $stop; // wait for 10 time unit and then, stop
	end // end of loop

endmodule // end of module
	
	