module bus_addr(S_address, S0_sel, S1_sel); // this module makes bus_address_decoder
input [7:0] S_address; // define 8 bits input slave address
output reg S0_sel, S1_sel; // define output reg slave select

always @ (S_address) // when S_address is active
begin
	if((S_address >= 8'h00) && (S_address < 8'h20)) {S0_sel, S1_sel} = 2'b10; // slave 0 is active
	else if((S_address >= 8'h20) && (S_address < 8'h40)) {S0_sel, S1_sel} = 2'b01; // slave 1 is active
	else {S0_sel, S1_sel} = 2'b00; // slave 0 and 1 is not active
end

endmodule // end of module
