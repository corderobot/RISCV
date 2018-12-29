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

module Multiplexor_32_3(I0, I1, I2, I3, I4, I5, I6, I7, sel, out);
  input [31:0] I0, I1, I2, I3, I4, I5, I6, I7;
  input [2:0] sel;
  output [31:0] out;
  Multiplexor_1_3 M13_0 (I0[0], I1[0], I2[0], I3[0], I4[0], I5[0], I6[0], I7[0], sel, out[0]);
Multiplexor_1_3 M13_1 (I0[1], I1[1], I2[1], I3[1], I4[1], I5[1], I6[1], I7[1], sel, out[1]);
Multiplexor_1_3 M13_2 (I0[2], I1[2], I2[2], I3[2], I4[2], I5[2], I6[2], I7[2], sel, out[2]);
Multiplexor_1_3 M13_3 (I0[3], I1[3], I2[3], I3[3], I4[3], I5[3], I6[3], I7[3], sel, out[3]);
Multiplexor_1_3 M13_4 (I0[4], I1[4], I2[4], I3[4], I4[4], I5[4], I6[4], I7[4], sel, out[4]);
Multiplexor_1_3 M13_5 (I0[5], I1[5], I2[5], I3[5], I4[5], I5[5], I6[5], I7[5], sel, out[5]);
Multiplexor_1_3 M13_6 (I0[6], I1[6], I2[6], I3[6], I4[6], I5[6], I6[6], I7[6], sel, out[6]);
Multiplexor_1_3 M13_7 (I0[7], I1[7], I2[7], I3[7], I4[7], I5[7], I6[7], I7[7], sel, out[7]);
Multiplexor_1_3 M13_8 (I0[8], I1[8], I2[8], I3[8], I4[8], I5[8], I6[8], I7[8], sel, out[8]);
Multiplexor_1_3 M13_9 (I0[9], I1[9], I2[9], I3[9], I4[9], I5[9], I6[9], I7[9], sel, out[9]);
Multiplexor_1_3 M13_10 (I0[10], I1[10], I2[10], I3[10], I4[10], I5[10], I6[10], I7[10], sel, out[10]);
Multiplexor_1_3 M13_11 (I0[11], I1[11], I2[11], I3[11], I4[11], I5[11], I6[11], I7[11], sel, out[11]);
Multiplexor_1_3 M13_12 (I0[12], I1[12], I2[12], I3[12], I4[12], I5[12], I6[12], I7[12], sel, out[12]);
Multiplexor_1_3 M13_13 (I0[13], I1[13], I2[13], I3[13], I4[13], I5[13], I6[13], I7[13], sel, out[13]);
Multiplexor_1_3 M13_14 (I0[14], I1[14], I2[14], I3[14], I4[14], I5[14], I6[14], I7[14], sel, out[14]);
Multiplexor_1_3 M13_15 (I0[15], I1[15], I2[15], I3[15], I4[15], I5[15], I6[15], I7[15], sel, out[15]);
Multiplexor_1_3 M13_16 (I0[16], I1[16], I2[16], I3[16], I4[16], I5[16], I6[16], I7[16], sel, out[16]);
Multiplexor_1_3 M13_17 (I0[17], I1[17], I2[17], I3[17], I4[17], I5[17], I6[17], I7[17], sel, out[17]);
Multiplexor_1_3 M13_18 (I0[18], I1[18], I2[18], I3[18], I4[18], I5[18], I6[18], I7[18], sel, out[18]);
Multiplexor_1_3 M13_19 (I0[19], I1[19], I2[19], I3[19], I4[19], I5[19], I6[19], I7[19], sel, out[19]);
Multiplexor_1_3 M13_20 (I0[20], I1[20], I2[20], I3[20], I4[20], I5[20], I6[20], I7[20], sel, out[20]);
Multiplexor_1_3 M13_21 (I0[21], I1[21], I2[21], I3[21], I4[21], I5[21], I6[21], I7[21], sel, out[21]);
Multiplexor_1_3 M13_22 (I0[22], I1[22], I2[22], I3[22], I4[22], I5[22], I6[22], I7[22], sel, out[22]);
Multiplexor_1_3 M13_23 (I0[23], I1[23], I2[23], I3[23], I4[23], I5[23], I6[23], I7[23], sel, out[23]);
Multiplexor_1_3 M13_24 (I0[24], I1[24], I2[24], I3[24], I4[24], I5[24], I6[24], I7[24], sel, out[24]);
Multiplexor_1_3 M13_25 (I0[25], I1[25], I2[25], I3[25], I4[25], I5[25], I6[25], I7[25], sel, out[25]);
Multiplexor_1_3 M13_26 (I0[26], I1[26], I2[26], I3[26], I4[26], I5[26], I6[26], I7[26], sel, out[26]);
Multiplexor_1_3 M13_27 (I0[27], I1[27], I2[27], I3[27], I4[27], I5[27], I6[27], I7[27], sel, out[27]);
Multiplexor_1_3 M13_28 (I0[28], I1[28], I2[28], I3[28], I4[28], I5[28], I6[28], I7[28], sel, out[28]);
Multiplexor_1_3 M13_29 (I0[29], I1[29], I2[29], I3[29], I4[29], I5[29], I6[29], I7[29], sel, out[29]);
Multiplexor_1_3 M13_30 (I0[30], I1[30], I2[30], I3[30], I4[30], I5[30], I6[30], I7[30], sel, out[30]);
Multiplexor_1_3 M13_31 (I0[31], I1[31], I2[31], I3[31], I4[31], I5[31], I6[31], I7[31], sel, out[31]);
  
endmodule
