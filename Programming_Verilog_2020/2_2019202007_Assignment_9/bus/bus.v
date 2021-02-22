module bus(M0_req, M0_wr, M0_address, M0_dout, M0_grant, M1_req, M1_wr, M1_address, M1_dout, M1_grant, M_din, reset_n, clk, S0_sel, S1_sel, S_wr, S_address, S_din, S0_dout, S1_dout); // this module make bus
input clk, reset_n; // define input clk, reset_n
input M0_req, M1_req, M0_wr, M1_wr; // define input Master Request, write/read
input [7:0] M0_address, M1_address; // define 8 bits input Master address
input [31:0] M0_dout, M1_dout, S0_dout, S1_dout; // define 32 bits Master data out and Slave data out

output M0_grant, M1_grant; // define output master grant
output S0_sel, S1_sel, S_wr; // define output slave select and write/read
output [7:0] S_address; // define 8 bits output slave address
output [31:0] M_din, S_din; // define 32 bits output master data input and slave data input

wire M_grant; // define wire Master grant
wire [1:0] S_sel_dff_out; // define 2 bits wire d flipflop output in S_sel

bus_arbit U0_bus_arbit( // bus_arbit instance
	.clk(clk),
	.reset_n(reset_n),
	.M0_req(M0_req),
	.M1_req(M1_req),
	.M_grant(M_grant)
	);
	
mux2 U1_mux2( // mux2 instance
	.a(M0_wr),
	.b(M1_wr),
	.sel(M_grant),
	.d_out(S_wr)
	);
	
mux2_8bits U2_mux2_8bits( // mux2_8bits instance
	.a(M0_address),
	.b(M1_address),
	.sel(M_grant),
	.d_out(S_address)
	);
	
mux2_32bits U3_mux2_32bits( // mux2_32bits instance
	.a(M0_dout),
	.b(M1_dout),
	.sel(M_grant),
	.d_out(S_din)
	);
	
bus_addr U4_bus_addr( // bus_addr instance
	.S_address(S_address),
	.S0_sel(S0_sel),
	.S1_sel(S1_sel)
	);

dff_r_2bits U5_dff_2_2bits( // d flipflop instance
	.clk(clk),
	.reset_n(reset_n),
	.d({S1_sel, S0_sel}),
	.q(S_sel_dff_out)
	);
	
mux3_32bits U6_mux3_32bits( // mux3_32bits instance
	.a(32'h00),
	.b(S0_dout),
	.c(S1_dout),
	.sel(S_sel_dff_out),
	.d_out(M_din)
	);
	
assign M0_grant = ~M_grant; // M_grant is 0 -> M0_grant is 1
assign M1_grant = M_grant; // M_grant is 1 -> M1_grant is 1
	
endmodule // end of module
	