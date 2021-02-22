module read_operation(addr, data, from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7, from_reg8, from_reg9, from_reg10, from_reg11, from_reg12, from_reg13, from_reg14, from_reg15, from_reg16, from_reg17, from_reg18, from_reg19,from_reg20, from_reg21, from_reg22); // this module makes read_op
input [63:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7, from_reg8, from_reg9;
input [63:0] from_reg10, from_reg11, from_reg12, from_reg13, from_reg14, from_reg15, from_reg16, from_reg17, from_reg18, from_reg19;
input [63:0] from_reg20, from_reg21, from_reg22; // define 23 input 64 bits from_reg 
input [15:0] addr; // define 16 bits input Addr 
output [63:0] data; // define 64 bits output data

_23_to_1_MUX U0_23_to_1_MUX( // 23 to 1 mux instance
	.R0(from_reg0),
	.R1(from_reg1),
	.R2(from_reg2),
	.R3(from_reg3),
	.R4(from_reg4),
	.R5(from_reg5),
	.R6(from_reg6),
	.R7(from_reg7),
	.R8(from_reg8),
	.R9(from_reg9),
	.I0(from_reg10),
	.I1(from_reg11),
	.I2(from_reg12),
	.I3(from_reg13),
	.I4(from_reg14),
	.I5(from_reg15),
	.I6(from_reg16),
	.I7(from_reg17),
	.I8(from_reg18),
	.I9(from_reg19),
	.OP_START(from_reg20),
	.INT_MASK(from_reg21),
	.INTERRUPT(from_reg22),
	.sel(addr),
	.d_out(data)
	);
	
endmodule // end of module
