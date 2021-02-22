module TOP(clk, reset_n, m_req, m_wr, m_addr, m_dout, m_grant, interrupt_out, m_din); // TOP module
input clk, reset_n; // define input clk and reset_n
input m_req, m_wr; // define input list
input [15:0] m_addr;
input [31:0] m_dout;

output m_grant; // define output list
output interrupt_out;
output [63:0] m_din;

wire [63:0] s_dout, s_din; // wire means wire to BUS and MP
wire s_sel, s_wr;
wire [15:0] s_addr;

BUS U0_BUS(
	.clk(clk),
	.reset_n(reset_n),
	.m_req(m_req),
	.m_wr(m_wr),
	.m_addr(m_addr),
	.m_dout(m_dout),
	.s_dout(s_dout),
	.m_grant(m_grant),
	.m_din(m_din),
	.s_addr(s_addr),
	.s_wr(s_wr),
	.s_din(s_din),
	.s_sel(s_sel)
	);
	
MP U1_MP(
	.clk(clk),
	.reset_n(reset_n),
	.s_wr(s_wr),
	.s_addr(s_addr),
	.s_din(s_din),
	.s0_sel(s_sel),
	.s_dout(s_dout),
	.interrupt_out(interrupt_out)
	);

endmodule // end of module
