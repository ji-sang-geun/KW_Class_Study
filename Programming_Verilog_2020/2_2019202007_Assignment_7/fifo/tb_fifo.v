`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_fifo; // define the testbench's name
reg tb_clk, tb_reset_n, tb_rd_en, tb_wr_en; // define testbench's clock, reset_n, rd_en, wr_en
reg [31:0] tb_d_in; // define 32 bits reg tb_d_in

wire [31:0] tb_d_out; // define 32 bits wire tb_d_out
wire tb_full, tb_empty; // define wire tb_full, tb_empty
wire tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err; // define wire tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err
wire [3:0] tb_data_count; // define 4 bits tb_data_count

fifo U0_fifo( // fifo instance
	.clk(tb_clk), 
	.reset_n(tb_reset_n), 
	.d_in(tb_d_in), 
	.wr_en(tb_wr_en), 
	.rd_en(tb_rd_en), 
	.d_out(tb_d_out), 
	.data_count(tb_data_count), 
	.rd_err(tb_rd_err), 
	.rd_ack(tb_rd_ack), 
	.wr_err(tb_wr_err), 
	.wr_ack(tb_wr_ack), 
	.empty(tb_empty), 
	.full(tb_full)
	);

always #10 tb_clk = ~tb_clk; // The clock is in 10 seconds, that is, every 10 seconds, the clk is reversed from 1 -> 0 0 -> 1.
	
initial begin // it means 1 time loop, begin - end means { }
tb_clk = 1'b0; tb_reset_n = 1'b0;
tb_rd_en = 1'b0; tb_wr_en = 1'b0; tb_d_in = 32'h00110011;
#15 tb_reset_n = 1'b1;
#10 tb_wr_en = 1'b1;
#10 tb_d_in = 32'h00220022;
#10 tb_d_in = 32'h00330033;
#10 tb_d_in = 32'h00440044;
#10 tb_d_in = 32'h00550055;
#10 tb_d_in = 32'h00660066;
#10 tb_d_in = 32'h00770077;
#10 tb_d_in = 32'h00880088;
#10 tb_d_in = 32'h00990099;
#10 tb_d_in = 32'h00aa00aa;
#10 tb_d_in = 32'h00bb00bb;
#10 tb_d_in = 32'h00cc00cc;
#10 tb_d_in = 32'h00dd00dd;
#10 tb_d_in = 32'h00ee00ee;
#10 tb_d_in = 32'h00ff00ff;
#10 tb_wr_en = 1'b0; tb_rd_en = 1'b1;
#200 $stop;// stop
end
endmodule // end of module
