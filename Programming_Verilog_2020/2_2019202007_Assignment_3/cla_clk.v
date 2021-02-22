module cla_clk(clock, a, b, ci, s_cla, co_cla); // this module makes cla - clock version

input clock; // define input clock
input [31:0] a,b; // define 32 bits input a,b
input ci; // define input ci
output [31:0] s_cla; // define 32 bits output s_cla 
output co_cla; // define output co_cla

reg [31:0] reg_a, reg_b; // define 32 bits register reg_a, reg_b
reg reg_ci; // define register reg_ci
reg [31:0] reg_s_cla; // define 32 bits register reg_s_cla
reg reg_co_cla; // define reg_co_cla

wire [31:0] wire_s_cla; // define 32 bits wire wire_s_cla
wire wire_co_cla; // define wire wire_co_cla

always@(posedge clock) // clock change 0 -> 1
begin // it means 1 time loop, begin - end means { }
	reg_a <= a; // non blocking
	reg_b <= b;
	reg_ci <= ci;
	reg_s_cla <= wire_s_cla;
	reg_co_cla <= wire_co_cla;
end // end of loop

	cla32 U0_cla32( // Find s and co by performing cla32 on a and b and ci
	.a(reg_a), // a is inserted in the reg_a position of the cla32 module
	.b(reg_b), // b is inserted in the reg_b position of the cla32 module
	.ci(reg_ci), // ci is inserted in the reg_ci position of the cla32 module
	.s(wire_s_cla), // s is inserted in the wire_s_cla position of the cla32 module
	.co(wire_co_cla) // co is inserted in the wire_co_cla position of the cla32 module
	);

	assign s_cla = reg_s_cla; // Substituting reg_s_cla for s_cla
	assign co_cla = reg_co_cla; // Substituting reg_co_cla for co_cla
	
endmodule // end of module
	
