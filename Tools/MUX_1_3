module Multiplexor_1_3(I0, I1, I2, I3, I4, I5, I6, I7, sel, out);
  input I0, I1, I2, I3, I4, I5, I6, I7;
  input [2:0] sel;
  output out;
  wire [0:0] C0, C0_1, C0_2, C1, C1_1, C2, C2_1, C3, C3_1, C3_2, C4, C4_1, C5, C5_1, C5_2, C6, C6_1, C6_2, C7, C7_1, OP0, OP1, OP2, OP3, OP4, OP5, OP6, OP7, POS0, POS1, POS2, POS3, POS4, POS5, POS6;
  
  // ¿Es 0?
  nor (C0_1, sel[0], sel[1]);
  not (C0_2, C0_1);
  nor (C0, C0_2, sel[2]);
  
  // ¿Es 1?
  nor (C1_1, sel[1], sel[2]);
  and (C1, C1_1, sel[0]);
  
  // ¿Es 2?
  nor (C2_1, sel[0], sel[2]);
  and (C2, C2_1, sel[1]);
  
  // ¿Es 3?
  and (C3_1, sel[0], sel[1]);
  not (C3_2, sel[2]);
  and (C3, C3_1, C3_2);
  
  // ¿Es 4?
  nor (C4_1, sel[0], sel[1]);
  and (C4, C4_1, sel[2]);
  
  // ¿Es 5?
  and (C5_1, sel[2], sel[0]);
  not (C5_2, sel[1]);
  and (C5, C5_1, C5_2);
  
  // ¿Es 6?
  and (C6_1, sel[2], sel[1]);
  not (C6_2, sel[0]);
  and (C6, C6_1, C6_2);
  
  // ¿Es 7?
  and (C7_1, sel[2], sel[0]);
  and (C7, C7_1, sel[1]);
  
  // Elegir el bit correcto 
  
  and (OP0, C0, I0);
  and (OP1, C1, I1);
  and (OP2, C2, I2);
  and (OP3, C3, I3);
  and (OP4, C4, I4);
  and (OP5, C5, I5);
  and (OP6, C6, I6);
  and (OP7, C7, I7);
  
  // Dejar pasar bit seleccionado
  
  or (POS1, OP0, OP1);
  or (POS2, OP2, OP3);
  or (POS3, OP4, OP5);
  or (POS4, OP6, OP7);
  or (POS5, POS1, POS2);
  or (POS6, POS3, POS4);
  or (out, POS5, POS6);
endmodule
