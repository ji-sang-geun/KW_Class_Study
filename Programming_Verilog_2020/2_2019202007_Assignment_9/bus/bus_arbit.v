module bus_arbit(clk, reset_n, M0_req, M1_req, M_grant); // this module makes bus_arbiter
input clk, reset_n; // define input clock, reset_n
input M0_req, M1_req; // define input master request
output reg M_grant; // define output reg master grant

always @ (posedge clk, negedge reset_n) // when clk is posedge or reset_n is negedge
begin
	if(reset_n == 1'b0) // reset_n is active
	begin
		M_grant = 1'b0; // master_grant is 0
	end 
	else case({M0_req, M1_req}) // reset_n is not active
		{2'b00} : begin // master 0 request, master 1 request = 0,0
			M_grant = 1'b0; // master grant is 0
		end
		{2'b01} : begin // master 0 request, master 1 request = 0,1
			M_grant = 1'b1; // master grant is 1
		end
		{2'b10} : begin // master 0 request, master 1 request = 1,0
			M_grant = 1'b0; // master grant is 0
		end
		{2'b11} : begin // master 0 request, master 1 request = 1,1
			if(M_grant == 1'b0) begin // master grant is 0
				M_grant = 1'b0; // master grant is 0
				end
			else if(M_grant == 1'b1) begin // master grant is 1
				M_grant = 1'b1; // master grant is 1
				end
		end
	endcase // end of case
end

endmodule // end of module

