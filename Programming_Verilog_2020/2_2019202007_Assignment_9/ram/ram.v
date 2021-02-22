module ram(clk, cen, wen, addr, din, dout); // this module makes ram
input clk, cen, wen; // define input clock, chip enable and write enable
input [4:0] addr; // define 5 bits input address
input [31:0] din; // define 32 bits input data in

output reg [31:0] dout; // define 32 bits output register data out 

reg [31:0] mem [0:31]; // memory declaration is reg [wordsize-1:0] variable_name[0:storagesize-1]
integer i; // define integer i because it used in for 

initial begin // initialize memory 
	for(i=0; i<32; i = i+1) mem[i] = 0; // mem[i] = 0 it means initialize
end

always @ (posedge clk) // when clock is posedge
begin 
	if(cen == 1) // chip enable is 1
	begin
		if(wen == 1) // write enable is 1
		begin // Writes din to the memory pointed to by address, and outputs 0 to dout.
		mem[addr] = din; 
		dout = 0;
		end
		else if(wen == 0) dout = mem[addr]; // The memory value indicated by the address is written to the dout.
	end
	else if(cen == 0) dout = 0; // dout becomes 0.
end

endmodule // end of module
