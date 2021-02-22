module RF(clk, reset_n, s_wr, s_addr, s_din, s_dout, interrupt_out); // this module makes Register file
input clk, reset_n; // define input list
input s_wr;
input [15:0] s_addr;
input [31:0] s_din;

output [63:0] s_dout; // define output list
output interrupt_out;

wire [22:0] to_reg; // wire means write_op to register
wire [63:0] from_reg[22:0]; // wire means register to read_op

write_operation U0_write_operation( // write_op instancee
	.s_addr(s_addr),
	.s_wr(s_wr),
	.to_reg(to_reg)
	);
	
register64_10 U1_register64_10( // 64 bits register 10 instance
	.clk(clk),
	.reset_n(reset_n),
	.en(to_reg[9:0]),
	.d_in({32'b0,s_din}),
	.d_out0(from_reg[0]),
	.d_out1(from_reg[1]),
	.d_out2(from_reg[2]),
	.d_out3(from_reg[3]),
	.d_out4(from_reg[4]),
	.d_out5(from_reg[5]),
	.d_out6(from_reg[6]),
	.d_out7(from_reg[7]),
	.d_out8(from_reg[8]),
	.d_out9(from_reg[9])
	);
	
	//
	
register64_10 U2_register64_10( // 64 bits register 10 instance
	.clk(clk),
	.reset_n(reset_n),
	.en(to_reg[19:10]),
	.d_in({32'b0,s_din}),
	.d_out0(from_reg[10]),
	.d_out1(from_reg[11]),
	.d_out2(from_reg[12]),
	.d_out3(from_reg[13]),
	.d_out4(from_reg[14]),
	.d_out5(from_reg[15]),
	.d_out6(from_reg[16]),
	.d_out7(from_reg[17]),
	.d_out8(from_reg[18]),
	.d_out9(from_reg[19])
	);
	
register64_3 U3_register64_3( // 64 bits register 3 instance
	.clk(clk),
	.reset_n(reset_n),
	.en(to_reg[22:20]),
	.d_in({32'b0,s_din}),
	.d_out0(from_reg[20]),
	.d_out1(from_reg[21]),
	.d_out2(from_reg[22])
	);
	
read_operation U4_read_operation( // read_op instance
	.addr(s_addr),
	.from_reg0(from_reg[0]),
	.from_reg1(from_reg[1]),
	.from_reg2(from_reg[2]),
	.from_reg3(from_reg[3]),
	.from_reg4(from_reg[4]),
	.from_reg5(from_reg[5]),
	.from_reg6(from_reg[6]),
	.from_reg7(from_reg[7]),
	.from_reg8(from_reg[8]),
	.from_reg9(from_reg[9]),
	.from_reg10(from_reg[10]),
	.from_reg11(from_reg[11]),
	.from_reg12(from_reg[12]),
	.from_reg13(from_reg[13]),
	.from_reg14(from_reg[14]),
	.from_reg15(from_reg[15]),
	.from_reg16(from_reg[16]),
	.from_reg17(from_reg[17]),
	.from_reg18(from_reg[18]),
	.from_reg19(from_reg[19]),
	.from_reg20(from_reg[20]),
	.from_reg21(from_reg[21]),
	.from_reg22(from_reg[22]),
	.data(s_dout)
	);
	
_and2 U5_and2( // interrupt out condition
	.a(from_reg[21][0]),
	.b(from_reg[22][0]),
	.y(interrupt_out)
	);	
	
endmodule // endmodule
