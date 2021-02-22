`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_bus; // define the testbench's name
reg tb_clk, tb_reset_n; // define testbench's clock, reset_n
reg tb_M0_req, tb_M1_req, tb_M0_wr, tb_M1_wr; // define testbench's master request and master write/read
reg [7:0] tb_M0_address, tb_M1_address; // define 8 bits testbench's master address
reg [31:0] tb_M0_dout, tb_M1_dout, tb_S0_dout, tb_S1_dout; // define 32 bits master data out and slave data out

wire tb_M0_grant, tb_M1_grant; // define testbench's master grant
wire tb_S0_sel, tb_S1_sel, tb_S_wr; // define slave select and slave write/read
wire [7:0] tb_S_address; // define 8 bits slave address
wire [31:0] tb_M_din, tb_S_din; // define 32 bits master data input and slave data input

bus U0_bus( // bus instance
	.clk(tb_clk),
	.reset_n(tb_reset_n),
	.M0_req(tb_M0_req),
	.M1_req(tb_M1_req),
	.M0_wr(tb_M0_wr),
	.M1_wr(tb_M1_wr),
	.M0_address(tb_M0_address),
	.M1_address(tb_M1_address),
	.M0_dout(tb_M0_dout),
	.M1_dout(tb_M1_dout),
	.S0_dout(tb_S0_dout),
	.S1_dout(tb_S1_dout),
	.M0_grant(tb_M0_grant),
	.M1_grant(tb_M1_grant),
	.S0_sel(tb_S0_sel),
	.S1_sel(tb_S1_sel),
	.S_wr(tb_S_wr),
	.S_address(tb_S_address),
	.M_din(tb_M_din),
	.S_din(tb_S_din)
	);
	
	always #5 tb_clk = ~tb_clk; // The clock is in 5 seconds, that is every 5 seconds
	
	initial begin // it means 1 time loop , begin - end means {}
	tb_clk = 1'b1; tb_reset_n = 1'b0; tb_M0_req = 1'b0; tb_M0_wr = 1'b0; tb_M1_req = 1'b0; tb_M1_wr = 1'b0;
	tb_M0_address = 8'h00; tb_M1_address = 8'h00; tb_M0_dout = 32'h00000000; tb_M1_dout = 32'h00000000; tb_S0_dout = 32'h00000000; tb_S1_dout = 32'h00000000;
	#17; tb_reset_n = 1'b1;
	#10; tb_M0_req = 1'b1; tb_S0_dout = 32'h00000001; tb_S1_dout = 32'h00000002;
	#10; tb_M0_wr = 1'b1;
	#10; tb_M0_address = 8'h01; tb_M0_dout = 32'h00000002;
	#10; tb_M0_address = 8'h02; tb_M0_dout = 32'h00000004;
	#10; tb_M0_address = 8'h03; tb_M0_dout = 32'h00000006; // s0_sel
	#10; tb_M0_address = 8'h20; tb_M0_dout = 32'h00000020;
	#10; tb_M0_address = 8'h21; tb_M0_dout = 32'h00000022;
	#10; tb_M0_address = 8'h22; tb_M0_dout = 32'h00000024;
	#10; tb_M0_address = 8'h23; tb_M0_dout = 32'h00000026; // s1_Sel
	#10; tb_M0_address = 8'ha0; tb_M0_dout = 32'h000000ff; // No slave is selected
	#20; $stop; // stop
	end
	
endmodule // end of module
