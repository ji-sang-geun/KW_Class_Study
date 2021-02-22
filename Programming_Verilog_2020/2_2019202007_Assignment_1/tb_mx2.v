`timescale 1ns/100ps // set the time of simulation ( unit / precision )

module tb_mx2;// define the testbench's name

	reg tb_d0, tb_d1, tb_s; // define register tb_d0, tb_d1, tb_s. it means testbench's d0, testbench's d1, testbench's s
	wire tb_y0, tb_y1; // define wire tb_y0, tb_y1. it means testbench's y0, testbench'y1
	
	mx2 U0_mx2(.d0(tb_d0), .d1(tb_d1), .s(tb_s), .y(tb_y0)); // named port mapping method
	
	mx2 U1_mx2(tb_d0, tb_d1, tb_s, tb_y1); // ordered port mapping method 
	
	initial begin // it means 1 time loop, begin - end means { }
		tb_d0 = 0; tb_d1 = 0; tb_s = 0; // tb_d0 : 0, tb_d1 : 0, tb_s : 0
	#10; tb_d0 = 0; tb_d1 = 0; tb_s = 1; // wait for 10 time unit and tb_d0 : 0, tb_d1 : 0, tb_s : 1 
	#10; tb_d0 = 0; tb_d1 = 1; tb_s = 0; // wait for 10 time unit and tb_d0 : 0, tb_d1 : 1, tb_s : 0
	#10; tb_d0 = 0; tb_d1 = 1; tb_s = 1; // wait for 10 time unit and tb_d0 : 0, tb_d1 : 1, tb_s : 1
	#10; tb_d0 = 1; tb_d1 = 0; tb_s = 0; // wait for 10 time unit and tb_d0 : 1, tb_d1 : 0, tb_s : 0
	#10; tb_d0 = 1; tb_d1 = 0; tb_s = 1; // wait for 10 time unit and tb_d0 : 1, tb_d1 : 0, tb_s : 1
	#10; tb_d0 = 1; tb_d1 = 1; tb_s = 0; // wait for 10 time unit and tb_d0 : 1, tb_d1 : 1, tb_s : 0
	#10; tb_d0 = 1; tb_d1 = 1; tb_s = 1; // wait for 10 time unit and tb_d0 : 1, tb_d1 : 0, tb_s : 1
	#10; // wait for 10 time unit
	end // end of loop

	
endmodule // end of module
