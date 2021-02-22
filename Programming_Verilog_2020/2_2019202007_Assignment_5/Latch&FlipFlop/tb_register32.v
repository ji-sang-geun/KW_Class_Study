`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_register32; // define the testbench's name

reg [31:0] tb_d; // define 32 bits reg tb_d
reg tb_clk; // define reg tb_clk. it means clock
wire [31:0] tb_q; // define 32 bits wire tb_q

parameter STEP = 10; // define STEP means 10

_register32 U0_register32( // _register32 instance
	.clk(tb_clk),
	.d(tb_d),
	.q(tb_q)
	);
	
always #(STEP/2) tb_clk = ~tb_clk; // The clock is in STEP/2 seconds, that is, every 5 seconds, the clk is reversed from 1 -> 0 0 -> 1.

initial
begin // it means 1 time loop, begin - end means { }
tb_clk = 1'b0; tb_d = 32'h12345678; 
#(STEP*0.6); tb_d = 32'h98765432;
#(STEP*0.6); tb_d = 32'hffeeddcc;
#(STEP*1.2); tb_d = 32'hbbaa9988;
#(STEP*0.4); tb_d = 32'h77665544;
#(STEP*0.8); tb_d = 32'h33221100;
#(STEP*0.8); tb_d = 32'h12345678;
#(STEP); $stop; // stop

end		
endmodule // end of module
