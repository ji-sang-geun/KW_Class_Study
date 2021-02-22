module rca_clk(clock,a,b,ci,s_rca,co_rca); // this module makes rca - clock version

input clock; // define input clock
input [31:0] a,b; // define 32 bits input a,b
input ci; // define input ci
output [31:0] s_rca; // define 32 bits output s_rca
output co_rca; // define output co_rca

reg [31:0] reg_a, reg_b; // define 32 bits register reg_a, reg_b
reg reg_ci; // define register reg_ci
reg [31:0] reg_s_rca; // define 32 bits wire reg_s_rca
reg reg_co_rca; // define register reg_co_rca

wire [31:0] wire_s_rca; // define 32 bits wire wire_s_rca
wire wire_co_rca; // define wire wire_co_rca

always@(posedge clock) // clock change 0 -> 1
begin // it means 1 time loop, begin - end means { }
	reg_a <= a; // non - blocking 
	reg_b <= b;
	reg_ci <= ci;
	reg_s_rca <= wire_s_rca;
	reg_co_rca <= wire_co_rca;
end // end of loop

	rca32 U0_rca32( // Find s and co by performing rca32 on a and b and ci
	.a(reg_a), // a is inserted in the reg_a position of the rca32 module
	.b(reg_b), // b is inserted in the reg_b position of the rca32 module
	.ci(reg_ci), // ci is inserted in the reg_ci position of the rca32 module
	.s(wire_s_rca), // s_rca is inserted in the wire_s_rca position of the rca32 module
	.co(wire_co_rca) // co_rca is inserted in the wire_co_rca position of the rca32 module
	);

assign s_rca = reg_s_rca; // Substituting reg_s_rca for s_rca
assign co_rca = reg_co_rca; // Substituting reg_co_rca for co_rca

endmodule // end of module 
