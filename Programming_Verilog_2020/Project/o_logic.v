module o_logic(clk, reset_n, multiplier, multiplicand, counter, state, op_done, result); // this module makes multiplier output logic
	input clk, reset_n; // define clock and reset_bar
	input [31:0] multiplier; // define 32 bits multiplier 
	input [31:0] multiplicand; // define 32 bits multiplicand
	input [5:0] counter; // define 6 bits(To calculate 32) cycle counter
	input [1:0] state; // define 2 bits state
	
	output op_done; // define done operation
	output [63:0] result; // define 64 bits multiplier result (32+32)
	
	parameter start_state = 2'b00; // derfine start_state means 2 bits 00
	parameter multiple_state = 2'b01; // define multiple_state means 2 bits 01
	parameter clear_state = 2'b10; // define clear_state = 2 bits 10
	
	reg op_done; // define reg op_done
	reg [63:0] result; // define 64 bits result
	reg [63:0] next_result; // define 64 bits next_result
	reg [63:0] temp; // define 64 bits reg temp
	
	reg [31:0] addition_store, subtraction_store; // define 32 bits reg
	reg last_result; // define reg last_result it means X-1
	
	wire [31:0] addition, subtraction; // define bits wire addition and subtraction
	
	// sequential part	
	always @(posedge clk or negedge reset_n)
	begin
		if(reset_n == 1'b0) // if reset == 0, reset is active 
		begin
			addition_store = 32'b0;
			subtraction_store = 32'b0;
			result = 64'b0;
		end
		else
		begin
			addition_store = addition;
			subtraction_store = subtraction;
			result <= next_result;
		end
	end
	
	// combinational part
	always @(multiplier, multiplicand, counter, state, result, next_result, last_result, temp, addition_store, subtraction_store)
	begin
		case(state)
			start_state: // bits are 00
			begin
				next_result = {32'b0,multiplier}; // 
				op_done = 1'b0;
				last_result = 1'b0;
				temp = 64'b0;
			end
			multiple_state: // bits are 01 
			begin
				if(counter == 6'b100000) // if cycle is 32
				begin 
					op_done = 1'b1;
					next_result = result;
					last_result = 1'b0;
					temp = 64'b0; 
				end
				else
				begin
					op_done = 1'b0;
					if(result[0] == 1'b0 && last_result == 1'b0) // 00 == shift
					begin
						temp = result;
						last_result = result[0];
						next_result = {result[63], result[63:1]}; // mathmatical right shift
					end
					else if(result[0] == 1'b0 && last_result == 1'b1) // 01 == addition
					begin
						temp[63:32] = addition_store;
						temp[31:0] = result[31:0];
						last_result = result[0];
						next_result = {temp[63], temp[63:1]}; // mathmatical right shift
					end
					else if(result[0] == 1'b1 && last_result == 1'b0) // 10 == subtraction
					begin
						temp[63:32] = subtraction_store;
						temp[31:0] = result[31:0];
						last_result = result[0];
						next_result = {temp[63], temp[63:1]}; // mathmatical right shift
					end
					else if(result[0] == 1'b1 && last_result == 1'b1) // 11 == shift
					begin
						temp = result;
						last_result = result[0];
						next_result = {result[63], result[63:1]}; // mathmatical right shift
					end
					else // 
					begin
						temp = result;
						next_result = 64'b0;
						op_done = 1'b0;
						last_result = 1'b0;
					end
				end
			end
			clear_state: // bits are 10
			begin
				next_result = result;
				op_done = 1'b1;
				last_result = 1'b0;
				temp = 64'b0;
			end
			default:
			begin
				next_result = 64'bx;
				op_done = 1'bx;
				last_result = 1'bx;
				temp = 64'bx;
			end
		endcase // end of case
	end
	
	cla32 U0_cla32( // addition
		.a(next_result[31:16]),
		.b(multiplicand[15:0]),
		.ci(1'b0),
		.s(addition),
		.co()
		);
		
	cla32 U1_cla32( // subtraction
		.a(next_result[31:16]),
		.b(~multiplicand[15:0]),
		.ci(1'b1),
		.s(subtraction),
		.co()
		);
		
endmodule // end of module 
