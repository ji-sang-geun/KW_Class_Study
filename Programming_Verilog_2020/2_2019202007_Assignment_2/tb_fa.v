`timescale 1ns/100ps // set the time of simulation ( unit / precision )

module tb_fa; // define the testbench's name

reg tb_a,tb_b,tb_ci; // define register tb_a, tb_b, tb_ci. it means testbench's a, testbench's b and testbench's ci
wire tb_s,tb_co; // define wire tb_s, tb_co. it means testbench's s, testbench's co

fa U0_fa(tb_a,tb_b,tb_ci,tb_s,tb_co); // ordered port mapping method

initial
begin // it means 1 time loop, begin - end means { }
tb_a = 0; tb_b = 0; tb_ci = 0; // tb_a : 0 tb_ b :0 tb_ ci : 0
#10; tb_a = 0; tb_b = 0; tb_ci = 1; // wait for 10 time unit and then, tb_a : 0 tb_b : 0 tb_ci : 1
#10; tb_a = 0; tb_b = 1; tb_ci = 0; // wait for 10 time unit and then, tb_a : 0 tb_b : 1 tb_ci : 0
#10; tb_a = 0; tb_b = 1; tb_ci = 1; // wait for 10 time unit and then, tb_a : 0 tb_b : 1 tb_ci : 1
#10; tb_a = 1; tb_b = 0; tb_ci = 0; // wait for 10 time unit and then, tb_a : 1 tb_b : 0 tb_ci : 0
#10; tb_a = 1; tb_b = 0; tb_ci = 1; // wait for 10 time unit and then, tb_a : 1 tb_b : 0 tb_ci : 1
#10; tb_a = 1; tb_b = 1; tb_ci = 0; // wait for 10 time unit and then, tb_a : 1 tb_b : 1 tb_ci : 0
#10; tb_a = 1; tb_b = 1; tb_ci = 1; // wait for 10 time unit and then, tb_a : 1 tb_b : 1 tb_ci : 1
#10; // wait for 10 time unit 

end // end of loop
endmodule // end of module
