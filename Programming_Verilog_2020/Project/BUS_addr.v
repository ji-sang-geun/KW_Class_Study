module BUS_addr(s_addr, s_sel); // this module makes bus_address_decoder
input [15:0] s_addr; // define 16 bits input slave address
output reg s_sel; // define output reg slave select

always @(s_addr) // when S_address is active
begin
	if((s_addr >= 16'h0100) && (s_addr <= 16'h0111)) s_sel = 1'b1; // slave is active
	else s_sel = 1'b0; // slave is not active
end

endmodule // end of module 
