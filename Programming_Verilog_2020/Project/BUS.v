module BUS(clk, reset_n, m_req, m_wr, m_addr, m_dout, s_dout, m_grant, m_din, s_addr, s_wr, s_din, s_sel); // this module makes bus
input clk, reset_n;  // define input clk, reset_n
input m_req, m_wr; // define input Master Request, write/read
input [15:0] m_addr; // define 16 bits input Master address
input [31:0] m_dout; // define 32 bits Master data out 
input [63:0] s_dout; // define 64 bits Slave data out

output m_grant; // define output master grant
output s_sel, s_wr; // define output slave select and write/read
output [15:0] s_addr; // define 8 bits output slave address
output [63:0] m_din, s_din; // define 64 bits output master data input and slave data input

wire sel_dff_out; // define wire d flipflop output in S_sel

BUS_arbit U0_BUS_arbit( // bus_arbit instance
	.clk(clk),
	.reset_n(reset_n),
	.m_req(m_req),
	.m_grant(m_grant)
	);

BUS_addr U1_BUS_addr(  // bus_addr instance
	.s_addr(s_addr),
	.s_sel(s_sel)
	);
	
dff_r_16bits U1_dff_r_16bits( // d flipflop instance
	.clk(clk),
	.reset_n(reset_n),
	.d(s_sel),
	.q(sel_dff_out)
	);
	
mx2_64bits U2_mx2_64bits( // mux2_64bits instance
	.d0(64'h00000000),
	.d1(s_dout),
	.s(sel_dff_out),
	.y(m_din)
	);
	
assign s_wr = m_wr;	
assign s_din = {32'b0, m_dout};
assign s_addr = m_addr;
	
endmodule // end of module
