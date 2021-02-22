module write_operation(s_addr, s_wr, to_reg); // this module makes write_op
	input s_wr; // define input s_wr
	input [15:0] s_addr; // define 16 bits input s_addr
	output [22:0] to_reg; // define 23 bits output to reg
	
	wire [22:0] w_a; // define wire 23 bits w_a
	
	_16_to_23_decoder D0_16_to_23_decoder( // 16_to_23 decoder instance
		.d(s_addr),
		.q(w_a)
		);
	
	// 23 and2 gate instance 
	_and2 U0_and2( 
		.a(s_wr),
		.b(w_a[0]),
		.y(to_reg[0])
		);

	_and2 U1_and2(
		.a(s_wr),
		.b(w_a[1]),
		.y(to_reg[1])
		);
		
	_and2 U2_and2(
		.a(s_wr),
		.b(w_a[2]),
		.y(to_reg[2])
		);
		
	_and2 U3_and2(
		.a(s_wr),
		.b(w_a[3]),
		.y(to_reg[3])
		);
		
	_and2 U4_and2(
		.a(s_wr),
		.b(w_a[4]),
		.y(to_reg[4])
		);
		
	_and2 U5_and2(
		.a(s_wr),
		.b(w_a[5]),
		.y(to_reg[5])
		);
		
	_and2 U6_and2(
		.a(s_wr),
		.b(w_a[6]),
		.y(to_reg[6])
		);
		
	_and2 U7_and2(
		.a(s_wr),
		.b(w_a[7]),
		.y(to_reg[7])
		);
		
	_and2 U8_and2(
		.a(s_wr),
		.b(w_a[8]),
		.y(to_reg[8])
		);
		
	_and2 U9_and2(
		.a(s_wr),
		.b(w_a[9]),
		.y(to_reg[9])
		);

	_and2 U10_and2(
		.a(s_wr),
		.b(w_a[10]),
		.y(to_reg[10])
		);
		
	_and2 U11_and2(
		.a(s_wr),
		.b(w_a[11]),
		.y(to_reg[11])
		);
		
	_and2 U12_and2(
		.a(s_wr),
		.b(w_a[12]),
		.y(to_reg[12])
		);
		
	_and2 U13_and2(
		.a(s_wr),
		.b(w_a[13]),
		.y(to_reg[13])
		);
		
	_and2 U14_and2(
		.a(s_wr),
		.b(w_a[14]),
		.y(to_reg[14])
		);
		
	_and2 U15_and2(
		.a(s_wr),
		.b(w_a[15]),
		.y(to_reg[15])
		);
		
	_and2 U16_and2(
		.a(s_wr),
		.b(w_a[16]),
		.y(to_reg[16])
		);

	_and2 U17_and2(
		.a(s_wr),
		.b(w_a[17]),
		.y(to_reg[17])
		);

	_and2 U18_and2(
		.a(s_wr),
		.b(w_a[18]),
		.y(to_reg[18])
		);

	_and2 U19_and2(
		.a(s_wr),
		.b(w_a[19]),
		.y(to_reg[19])
		);

	_and2 U20_and2(
		.a(s_wr),
		.b(w_a[20]),
		.y(to_reg[20])
		);

	_and2 U21_and2(
		.a(s_wr),
		.b(w_a[21]),
		.y(to_reg[21])
		);

	_and2 U22_and2(
		.a(s_wr),
		.b(w_a[22]),
		.y(to_reg[22])
		);

endmodule // end of module
