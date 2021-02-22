module ns_logic(Ta, Tb, TaL, TbL, D2, D1, D0, Q2, Q1, Q0);		//next state logic
input Ta, Tb, TaL, TbL, Q2, Q1, Q0;// define input

output D2, D1, D0; // define output

wire inv_Q2, inv_Q1, inv_Q0, inv_TaL, inv_TbL, inv_Ta, inv_Tb; // define inv wire

wire wire1, wire2, wire3, wire4, wire5, wire6, wire7, wire8, wire9, wire10, wire11; // define wire

// seven inverter instance
_inv U0_inv(
   .a(Q2),
   .y(inv_Q2)
   );
   
_inv U1_inv(
   .a(Q1),
   .y(inv_Q1)
   );

_inv U2_inv(
   .a(Q0),
   .y(inv_Q0)
   );

_inv U3_inv(
   .a(TaL),
   .y(inv_TaL)
   );

_inv U4_inv(
   .a(TbL),
   .y(inv_TbL)
   );

_inv U5_inv(
   .a(Ta),
   .y(inv_Ta)
   );

_inv U6_inv(
   .a(Tb),
   .y(inv_Tb)
   );   
   

//D2 = Q2`*Q1*Q0 + Q2*Q1` + Q2*Q1*Q0`
_and3 U7_and3(
   .a(inv_Q2),
   .b(Q1),
   .c(Q0),
   .y(wire1)
   );

_and2 U8_and2(
   .a(inv_Q1),
   .b(Q2),
   .y(wire2)
   );
   
_and3 U9_and3(
   .a(Q2),
   .b(Q1),
   .c(inv_Q0),
   .y(wire3)
   );   
   
_or3 U10_or3(
   .a(wire1),
   .b(wire2),
   .c(wire3),
   .y(D2)
   );

//D1 = Q2`*Q1`*Q0 + Q1*Q0` + Q2*Q1`*Q0
_and3 U11_and3(
   .a(inv_Q2),
   .b(inv_Q1),
   .c(Q0),
   .y(wire4)
   );

_and2 U12_and2(
   .a(Q1),
   .b(inv_Q0),
   .y(wire5)
   );
   
_and3 U13_and3(
   .a(Q2),
   .b(inv_Q1),
   .c(Q0),
   .y(wire6)
   );   
   
_or3 U14_or3(
   .a(wire4),
   .b(wire5),
   .c(wire6),
   .y(D1)
   );


//D0 = Q2`*Q1`*Q0`*Ta` + Q2`*Q1*Q0`*TaL` + Q2*Q1`*Q0`*Tb` + Q2*Q1*Q0`*TbL`
_and4 U15_and4(
   .a(inv_Q2),
   .b(inv_Q1),
   .c(inv_Q0),
   .d(inv_Ta),
   .y(wire7)
   );
   
_and4 U16_and4(
   .a(inv_Q2),
   .b(Q1),
   .c(inv_Q0),
   .d(inv_TaL),
   .y(wire8)
   );   

_and4 U17_and4(
   .a(Q2),
   .b(inv_Q1),
   .c(inv_Q0),
   .d(inv_Tb),
   .y(wire9)
   );
   
_and4 U18_and4(
   .a(Q2),
   .b(Q1),
   .c(inv_Q0),
   .d(inv_TbL),
   .y(wire10)
   );   
   
_or4 U19_or4(
   .a(wire7),
   .b(wire8),
   .c(wire9),
   .d(wire10),
   .y(D0)
   );
   
endmodule // end of module


