`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_Bus; // define the testbench's name
reg tb_clk, tb_reset_n; // define testbench's clock, reset_n
reg tb_m_req, tb_m_wr; // define testbench's master request and master write/read
reg [15:0] tb_m_address; // define 16 bits testbench's master address
reg [31:0] tb_m_dout;// define 32 bits master data out
reg [63:0] tb_s_dout; // define 64 bits slave data out

wire tb_m_grant; // define testbench's master grant
wire tb_s_sel, tb_s_wr; // define slave select and slave write/read
wire [15:0] tb_s_address; // define 8 bits slave address
wire [63:0] tb_m_din, tb_s_din; // define 64 bits master data input and slave data input

BUS U0_BUS( // bus instance
	.tb_clk,
	.tb_reset_n,
	.tb_m_req,
	.tb_m_wr,
	.tb_m_address,
	.tb_m_dout,
	.tb_s_dout,
	.tb_m_grant,
	.tb_m_din,
	.tb_s_address,
	.tb_s_wr,
	.tb_s_din,
	.tb_s_sel
	);
	
	always #5 tb_clk = ~tb_clk; // The clock is in 5 seconds, that is every 5 seconds
	
	initial begin // it means 1 time loop , begin - end means {}
	tb_clk = 1'b1; tb_reset_n = 1'b0; tb_m_req = 1'b0; tb_m_wr = 1'b0;
	tb_m_address = 16'h00; tb_m_dout = 32'h00000000; tb_s_dout = 64'h00000000; 
	#17; tb_reset_n = 1'b1;
	#10; tb_m_req = 1'b1; tb_s_dout = 64'h1;
	#10; tb_m_wr = 1'b1;
	#10; tb_m_address = 16'h0001; tb_m_dout = 32'h00000002;
	#10; tb_m_address = 16'h0002; tb_m_dout = 32'h00000004;
	#10; tb_m_address = 16'h0003; tb_m_dout = 32'h00000006;
	#10; tb_m_address = 16'h0020; tb_m_dout = 32'h00000020;
	#20; $stop; // stop
	end
	
endmodule // end of module
