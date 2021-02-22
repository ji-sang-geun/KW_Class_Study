module BUS_arbit(clk, reset_n, m_req, m_grant); // this module makes bus_arbiter
input clk, reset_n; // define input clock, reset_n
input m_req; // define input master request
output reg m_grant; // define output reg master grant

always @(posedge clk, negedge reset_n) // when clk is posedge or reset_n is negedge
begin
	if(reset_n == 1'b0) m_grant = 1'b0; // reset_n is active
	else case(m_req)
		1'b0: m_grant = 1'b0; // master_grant is 0
		1'b1: m_grant = 1'b1; // master_grant is 1
	endcase
end

endmodule // end of module
		