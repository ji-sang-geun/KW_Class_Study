`timescale 1ns/100ps // set the time of simulation (Unit / precision)

module tb_ram; // define the testbench's name
reg tb_clk, tb_cen, tb_wen; // define testbench's clcok, chip enable, write enable
reg [4:0] tb_addr;// define 5 bits testbench's register address
reg [31:0] tb_din; // define 32 bits testbench's register data in

wire [31:0] tb_dout; // define 32 bits testbench's wire data out

ram U0_ram( // ram instance
	.clk(tb_clk),
	.cen(tb_cen),
	.wen(tb_wen),
	.addr(tb_addr),
	.din(tb_din),
	.dout(tb_dout)
	);
	
	always #5 tb_clk = ~tb_clk; // The clock is in 5 seconds, that is every 5 seconds
	
	initial begin // it means 1 time loop , begin - end means {}
		tb_clk = 1'b0; tb_cen = 1'b0; tb_wen = 1'b0; tb_addr = 5'b0; tb_din = 32'b0;
		#20; tb_cen = 1'b1; tb_wen = 1'b1;
		#10; tb_addr = 5'b00001; tb_din = 32'h0000_0001;
		#10; tb_addr = 5'b00010; tb_din = 32'h0000_0002;
		#10; tb_addr = 5'b00011; tb_din = 32'h0000_0003;
		#10; tb_addr = 5'b00100; tb_din = 32'h0000_0004;
		#10; tb_addr = 5'b00101; tb_din = 32'h0000_0005;
		
		#10; tb_wen = 1'b0; 
		#10; tb_addr = 5'b00001;
		#10; tb_addr = 5'b00010;
		#10; tb_addr = 5'b00011;
		#10; tb_addr = 5'b00100;
		#10; tb_addr = 5'b00101;
		#15; tb_addr = 5'b01000; // this address is empty
		#10; $stop; // stop
	end
endmodule // end of module
