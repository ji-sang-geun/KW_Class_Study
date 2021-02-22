module Register_file(clk, reset_n, wAddr, wData, we, rAddr, rData); // this module makes register file
input clk, reset_n, we; // define input clk, reset_n, we. reset_n is active low
input [2:0] wAddr, rAddr; // define 3 bits input wAddr and rAddr
input [31:0] wData; // define 32 bits input wData
output [31:0] rData; // define 32 bits output rData

wire [7:0] to_reg; // define 8 bits wire to_reg
wire [31:0] from_reg[7:0]; 

write_operation U0_write_operation( // write_operation instance 
	.Addr(wAddr), // wAddr selects one of eight register
	.we(we), 
	.to_reg(to_reg)
	);

register32_8 U0_register32_8( // register32_8 instance
	.clk(clk),
	.reset_n(reset_n),
	.en(to_reg),
	.d_in(wData),
	.d_out0(from_reg[0]),
	.d_out1(from_reg[1]),
	.d_out2(from_reg[2]),
	.d_out3(from_reg[3]),
	.d_out4(from_reg[4]),
	.d_out5(from_reg[5]),
	.d_out6(from_reg[6]),
	.d_out7(from_reg[7])
	);

read_operation U0_read_operation( // read_operation instance
	.Addr(rAddr),
	.Data(rData), // output
	.from_reg0(from_reg[0]),
	.from_reg1(from_reg[1]),
	.from_reg2(from_reg[2]),
	.from_reg3(from_reg[3]),
	.from_reg4(from_reg[4]),
	.from_reg5(from_reg[5]),
	.from_reg6(from_reg[6]),
	.from_reg7(from_reg[7])
	);
	
	
endmodule // end of module
