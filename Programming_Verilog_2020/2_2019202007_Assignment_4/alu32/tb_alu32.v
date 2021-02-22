`timescale 1ns/100ps //set simulation time scale

module tb_alu32; //alu32 testbench module
   reg [31:0] tb_a,tb_b;
   reg [2:0] tb_op;   
   wire [31:0] tb_result;
   wire tb_c,tb_n,tb_z,tb_v;
   reg clk;
   reg [31:0] tb_result_exp;
   reg [31:0] vectornum,errors;
   reg [98:0] testvectors[1000:0]; //array of testvectors
   
   alu32 U0_alu32(.a(tb_a),.b(tb_b),.op(tb_op),.result(tb_result),.c(tb_c),.n(tb_n),.z(tb_z),.v(tb_v)); //load alu32 module
   
   always //10ns period clock generation
   begin
      clk=1; #5;
      clk=0; #5;
   end
   
   initial
   begin
      $readmemb("C:\altera_lite\15.1\practice\week_4\2\example.txt",testvectors); //read binary data
      vectornum=0;   errors=0; //initialize
   end
   
   always @ (posedge clk)
   begin
      #1; {tb_a,tb_b,tb_op,tb_result_exp}=testvectors[vectornum];
   end
   
   always @ (negedge clk)
   begin
      if(tb_result!==tb_result_exp)
         begin
            $display("Error: inputs=%b",{tb_a,tb_b,tb_op}); //display on the screen
            $display("outputs=%b(%b exp)",tb_result,tb_result_exp);
            errors=errors+1;
         end
      vectornum=vectornum+1;
      if(testvectors[vectornum]===99'bx)
         begin
            $display("%d tests completed with %d errors",vectornum,errors);
            $finish;
         end
   end
endmodule //mark end of module