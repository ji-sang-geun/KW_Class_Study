module ns_logic(clk, reset_n, op_start, op_clear, op_done, state, counter); // this module makes multiplier's next state

input clk, reset_n; // define clk, reset_n 
input op_start, op_clear, op_done; // for next_state

output [1:0] state; // define 2 bits output state
output [5:0] counter; // define 6 bits output cycle counter

parameter start_state = 2'b00; // define start_state, means 2 bits 00
parameter multiple_state = 2'b01; // define multiple_state means 2 bits 01
parameter clear_state = 2'b10; // define clear_state means 2 bits 10

reg [1:0] state, next_state; // define 2 bits reg 
reg [5:0] counter, next_counter; // define 6 bits reg counter, next_counter 
reg [5:0] temp; // define 

wire [5:0] temp_counter; // define 6 bits wire temp_counter  
wire co; // define wire co

cla8 U0_cla8( // 8 bits cla instance
	.a({1'b0, next_counter}), // cycle calculation
	.b(8'b00000001),
	.ci(1'b0),
	.s(temp_counter),
	.co(co)
	);
	
// sequential part	
always @(posedge clk or negedge reset_n)
begin
	if(reset_n == 1'b0) 
	begin
		temp = 6'b000000;
		state <= start_state;
		counter <= 6'b000000;
	end
	else
	begin
		temp = temp_counter[5:0];
		state <= next_state;
		counter <= next_counter;
	end
end

// combinational part
always @(op_start, op_clear, op_done, state, counter, temp)
begin
	if(op_clear == 1'b1) // if op_clear is 1, next_state is start_state, and then, counter is initialized.
	begin
		next_state <= start_state;
		next_counter <= 6'b000000;
	end
	else
	begin
		case(state)
			start_state: // states are 00
			begin
				if(op_start == 1'b1 && op_clear == 1'b0 && op_done == 1'b0) // op_start == 1 and op_clear == 0 and op_done == 0
				begin
					next_state <= multiple_state;
					next_counter <= counter;
				end
				else
				begin
					next_state <= start_state;
					next_counter <= counter;
				end
			end
			multiple_state: // states are 01
			begin
				if(counter == 6'b100000) // counter is 32 it means 32 cycle
				begin
					next_state <= clear_state;
					next_counter <= counter;
				end
				else if(op_clear == 1'b1)
				begin
					next_state <= start_state;
					next_counter <= 6'b000000;
				end
				else
				begin
					next_state <= multiple_state;
					next_counter <= temp; 
				end
			end
			clear_state: // states are 10
			begin
				if(op_clear == 1'b1) // op_clear is 1
				begin
					next_state <= start_state; 
					next_counter <= 6'b000000;
				end
				else // op_clear is 0
				begin
					next_state <= clear_state;
					next_counter <= counter;
				end
			end
			default:
			begin
				next_state <= 2'bx;
				next_counter <= 6'bx;
			end
		endcase // end of case 
	end
end

endmodule // end of module
