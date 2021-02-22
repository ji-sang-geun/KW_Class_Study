module cnt5(cnt, clk, reset_n, inc); // this module means 5 way counter
input clk, reset_n, inc; // define clk, reset_n, inc. reset_n is active low 
output [2:0] cnt;


// Defined as a three-digit binary code defined from 0 to 4.
parameter zero = 3'b000;
parameter one = 3'b001;
parameter two = 3'b010;
parameter three = 3'b011;
parameter four = 3'b100;

reg [2:0] cnt;
reg [2:0] next_cnt; // next state

always @(posedge clk or negedge reset_n) // Only flip flops must be created using the always statement.
begin
	if(reset_n == 1'b0) cnt <= zero; // reset is active low
	else cnt <= next_cnt; 
end

always @ (inc or cnt)
begin 
	case({cnt, inc}) // Calculate the next state through the case statement
	{zero, 1'b0} : next_cnt <= four;
	{zero, 1'b1} : next_cnt <= one;
	{one, 1'b0} : next_cnt <= zero;
	{one, 1'b1} : next_cnt <= two;
	{two, 1'b0} : next_cnt <= one;
	{two, 1'b1} : next_cnt <= three;
	{three, 1'b0} : next_cnt <= two;
	{three, 1'b1} : next_cnt <= four;
	{four, 1'b0} : next_cnt <= three;
	{four, 1'b1} : next_cnt <= zero;
	default : next_cnt <= 3'bx; // To prevent the problem of latch
	endcase // end of case
end
endmodule // end of module
	
