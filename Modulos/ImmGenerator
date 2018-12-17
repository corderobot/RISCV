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

module RestadorCompleto(x,y,z,R,C);
  input x,y,z;
  output R,C;
  wire e,f,g,h,i,j;
  xor(e, x, y);
  xor(R, e, z);
  not(j, x);
  and(f, j, y);
  and(g,j,z);
  and(h,y,z);
  or(i,g,h);
  or(C,f,i);
endmodule
  
module ShiftLogico1BitIzquierda(Original, Nuevo);
  input [31:0] Original;
  output [31:0] Nuevo;
  and (Nuevo[0], 1'b0, 1'b1);
  and (Nuevo[1], Original[0], 1'b1);
  and (Nuevo[2], Original[1], 1'b1);
  and (Nuevo[3], Original[2], 1'b1);
  and (Nuevo[4], Original[3], 1'b1);
  and (Nuevo[5], Original[4], 1'b1);
  and (Nuevo[6], Original[5], 1'b1);
  and (Nuevo[7], Original[6], 1'b1);
  and (Nuevo[8], Original[7], 1'b1);
  and (Nuevo[9], Original[8], 1'b1);
  and (Nuevo[10], Original[9], 1'b1);
  and (Nuevo[11], Original[10], 1'b1);
  and (Nuevo[12], Original[11], 1'b1);
  and (Nuevo[13], Original[12], 1'b1);
  and (Nuevo[14], Original[13], 1'b1);
  and (Nuevo[15], Original[14], 1'b1);
  and (Nuevo[16], Original[15], 1'b1);
  and (Nuevo[17], Original[16], 1'b1);
  and (Nuevo[18], Original[17], 1'b1);
  and (Nuevo[19], Original[18], 1'b1);
  and (Nuevo[20], Original[19], 1'b1);
  and (Nuevo[21], Original[20], 1'b1);
  and (Nuevo[22], Original[21], 1'b1);
  and (Nuevo[23], Original[22], 1'b1);
  and (Nuevo[24], Original[23], 1'b1);
  and (Nuevo[25], Original[24], 1'b1);
  and (Nuevo[26], Original[25], 1'b1);
  and (Nuevo[27], Original[26], 1'b1);
  and (Nuevo[28], Original[27], 1'b1);
  and (Nuevo[29], Original[28], 1'b1);
  and (Nuevo[30], Original[29], 1'b1);
  and (Nuevo[31], Original[30], 1'b1);
endmodule

module ShiftLogico12BitIzquierda(Original, Nuevo);
  input [31:0] Original;
  output [31:0] Nuevo;
  and (Nuevo[0], 1'b0, 1'b1);
  and (Nuevo[1], 1'b0, 1'b1);
  and (Nuevo[2], 1'b0, 1'b1);
  and (Nuevo[3], 1'b0, 1'b1);
  and (Nuevo[4], 1'b0, 1'b1);
  and (Nuevo[5], 1'b0, 1'b1);
  and (Nuevo[6], 1'b0, 1'b1);
  and (Nuevo[7], 1'b0, 1'b1);
  and (Nuevo[8], 1'b0, 1'b1);
  and (Nuevo[9], 1'b0, 1'b1);
  and (Nuevo[10], 1'b0, 1'b1);
  and (Nuevo[11], 1'b0, 1'b1);
  and (Nuevo[12], Original[0], 1'b1);
  and (Nuevo[13], Original[1], 1'b1);
  and (Nuevo[14], Original[2], 1'b1);
  and (Nuevo[15], Original[3], 1'b1);
  and (Nuevo[16], Original[4], 1'b1);
  and (Nuevo[17], Original[5], 1'b1);
  and (Nuevo[18], Original[6], 1'b1);
  and (Nuevo[19], Original[7], 1'b1);
  and (Nuevo[20], Original[8], 1'b1);
  and (Nuevo[21], Original[9], 1'b1);
  and (Nuevo[22], Original[10], 1'b1);
  and (Nuevo[23], Original[11], 1'b1);
  and (Nuevo[24], Original[12], 1'b1);
  and (Nuevo[25], Original[13], 1'b1);
  and (Nuevo[26], Original[14], 1'b1);
  and (Nuevo[27], Original[15], 1'b1);
  and (Nuevo[28], Original[16], 1'b1);
  and (Nuevo[29], Original[17], 1'b1);
  and (Nuevo[30], Original[18], 1'b1);
  and (Nuevo[31], Original[19], 1'b1);
endmodule

module ImmGenerator(Inst, MI, MS, MSB, MU, MUJ, immGenOut);
  input [31:0] Inst;
  input MI, MS, MSB, MU, MUJ, C, C1, C2;
  wire [2:0] WMI, WMS, WMSB, WMU, WMUJ, SOR, RES;
  wire S01, S02, S03, S04, S05, S11, S12, S13, S14, S15, S21, S22, S23, S24, S25;
  wire [31:0] TipoI, TipoS, TipoSB, TipoU, TipoUJ, TipoSBC, TipoUC, TipoUJC;
  output [31:0] immGenOut;
  
  and (WMS[0], 1'b0 , 1'b0);
  and (WMU[0], 1'b0 , 1'b0);
  and (WMI[1], 1'b0 , 1'b0);
  and (WMU[1], 1'b0 , 1'b0);
  and (WMUJ[1], 1'b0 , 1'b0);
  and (WMI[2], 1'b0 , 1'b0);
  and (WMS[2], 1'b0 , 1'b0);
  and (WMSB[2], 1'b0 , 1'b0);
  
  and (WMI[0], MI, 1'b1);
  and (WMS[1], MS, 1'b1);
  and (WMSB[0], MSB, 1'b1);
  and (WMSB[1], MSB, 1'b1);
  and (WMU[2], MU, 1'b1);
  and (WMUJ[2], MUJ, 1'b1);
  and (WMUJ[0], MUJ, 1'b1);
  
  or (S01, WMI[0], WMS[0]);
  or (S02, WMSB[0], WMU[0]);
  or (S03, WMUJ[0], S01);
  or (SOR[0], S02, S03);
  or (S11, WMI[1], WMS[1]);
  or (S12, WMSB[1], WMU[1]);
  or (S13, WMUJ[1], S11);
  or (SOR[1], S12, S13);
  or (S21, WMI[2], WMS[2]);
  or (S22, WMSB[2], WMU[2]);
  or (S23, WMUJ[2], S21);
  or (SOR[2], S22, S23);
  
  RestadorCompleto RC1 (SOR[0], 1'b1, 1'b0, RES[0], C);
  RestadorCompleto RC2 (SOR[1], 1'b0, C, RES[1], C1);
  RestadorCompleto RC3 (SOR[2], 1'b0, C1, RES[2], C2);
  
  // Preparar instrucción tipo I
  
  PrepararTipoI PTI (Inst, TipoI);
  
  // Preparar instrucción tipo S
  
  PrepararTipoS PTS (Inst, TipoS);
  
  // Preparar instrucción tipo SB
  
  PrepararTipoSB PTSB (Inst, TipoSBC);
  
  // Preparar instrucción tipo U
  
  PrepararTipoU PTU (Inst, TipoUC);
  
  // Preparar instrucción tipo UJ
  
  PrepararTipoUJ PTUJ (Inst, TipoUJC);
  
  Multiplexor_32_3 m323_1(TipoI, TipoS, TipoSBC, TipoUC, TipoUJC, 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000, RES, immGenOut);
  
endmodule 

module PrepararTipoI(Inst, TipoI);
  input [31:0] Inst;
  output [31:0] TipoI;
  and (TipoI[0], Inst[13], 1'b1);
  and (TipoI[1], Inst[14], 1'b1);
  and (TipoI[2], Inst[15], 1'b1);
  and (TipoI[3], Inst[16], 1'b1);
  and (TipoI[4], Inst[17], 1'b1);
  and (TipoI[5], Inst[18], 1'b1);
  and (TipoI[6], Inst[19], 1'b1);
  and (TipoI[7], Inst[20], 1'b1);
  and (TipoI[8], Inst[21], 1'b1);
  and (TipoI[9], Inst[22], 1'b1);
  and (TipoI[10], Inst[23], 1'b1);
  and (TipoI[11], Inst[24], 1'b1);
  and (TipoI[12], 1'b0, 1'b1);
  and (TipoI[13], 1'b0, 1'b1);
  and (TipoI[14], 1'b0, 1'b1);
  and (TipoI[15], 1'b0, 1'b1);
  and (TipoI[16], 1'b0, 1'b1);
  and (TipoI[17], 1'b0, 1'b1);
  and (TipoI[18], 1'b0, 1'b1);
  and (TipoI[19], 1'b0, 1'b1);
  and (TipoI[20], 1'b0, 1'b1);
  and (TipoI[21], 1'b0, 1'b1);
  and (TipoI[22], 1'b0, 1'b1);
  and (TipoI[23], 1'b0, 1'b1);
  and (TipoI[24], 1'b0, 1'b1);
  and (TipoI[25], 1'b0, 1'b1);
  and (TipoI[26], 1'b0, 1'b1);
  and (TipoI[27], 1'b0, 1'b1);
  and (TipoI[28], 1'b0, 1'b1);
  and (TipoI[29], 1'b0, 1'b1);
  and (TipoI[30], 1'b0, 1'b1);
  and (TipoI[31], 1'b0, 1'b1);
endmodule

module PrepararTipoS(Inst, TipoS);
  input [31:0] Inst;
  output [31:0] TipoS;
  and (TipoS[0], Inst[0], 1'b1);
  and (TipoS[1], Inst[1], 1'b1);
  and (TipoS[2], Inst[2], 1'b1);
  and (TipoS[3], Inst[3], 1'b1);
  and (TipoS[4], Inst[4], 1'b1);
  and (TipoS[5], Inst[18], 1'b1);
  and (TipoS[6], Inst[19], 1'b1);
  and (TipoS[7], Inst[20], 1'b1);
  and (TipoS[8], Inst[21], 1'b1);
  and (TipoS[9], Inst[22], 1'b1);
  and (TipoS[10], Inst[23], 1'b1);
  and (TipoS[11], Inst[24], 1'b1);
  and (TipoS[12], 1'b0, 1'b1);
  and (TipoS[13], 1'b0, 1'b1);
  and (TipoS[14], 1'b0, 1'b1);
  and (TipoS[15], 1'b0, 1'b1);
  and (TipoS[16], 1'b0, 1'b1);
  and (TipoS[17], 1'b0, 1'b1);
  and (TipoS[18], 1'b0, 1'b1);
  and (TipoS[19], 1'b0, 1'b1);
  and (TipoS[20], 1'b0, 1'b1);
  and (TipoS[21], 1'b0, 1'b1);
  and (TipoS[22], 1'b0, 1'b1);
  and (TipoS[23], 1'b0, 1'b1);
  and (TipoS[24], 1'b0, 1'b1);
  and (TipoS[25], 1'b0, 1'b1);
  and (TipoS[26], 1'b0, 1'b1);
  and (TipoS[27], 1'b0, 1'b1);
  and (TipoS[28], 1'b0, 1'b1);
  and (TipoS[29], 1'b0, 1'b1);
  and (TipoS[30], 1'b0, 1'b1);
  and (TipoS[31], 1'b0, 1'b1);
endmodule

module PrepararTipoSB(Inst, TipoSBC);
  input [31:0] Inst;
  output [31:0] TipoSBC;
  wire [31:0] TipoSB;
  and (TipoSB[0], Inst[1], 1'b1);
  and (TipoSB[1], Inst[2], 1'b1);
  and (TipoSB[2], Inst[3], 1'b1);
  and (TipoSB[3], Inst[4], 1'b1);
  and (TipoSB[4], Inst[18], 1'b1);
  and (TipoSB[5], Inst[19], 1'b1);
  and (TipoSB[6], Inst[20], 1'b1);
  and (TipoSB[7], Inst[21], 1'b1);
  and (TipoSB[8], Inst[22], 1'b1);
  and (TipoSB[9], Inst[23], 1'b1);
  and (TipoSB[10], Inst[0], 1'b1);
  and (TipoSB[11], Inst[24], 1'b1);
  and (TipoSB[12], 1'b0, 1'b1);
  and (TipoSB[13], 1'b0, 1'b1);
  and (TipoSB[14], 1'b0, 1'b1);
  and (TipoSB[15], 1'b0, 1'b1);
  and (TipoSB[16], 1'b0, 1'b1);
  and (TipoSB[17], 1'b0, 1'b1);
  and (TipoSB[18], 1'b0, 1'b1);
  and (TipoSB[19], 1'b0, 1'b1);
  and (TipoSB[20], 1'b0, 1'b1);
  and (TipoSB[21], 1'b0, 1'b1);
  and (TipoSB[22], 1'b0, 1'b1);
  and (TipoSB[23], 1'b0, 1'b1);
  and (TipoSB[24], 1'b0, 1'b1);
  and (TipoSB[25], 1'b0, 1'b1);
  and (TipoSB[26], 1'b0, 1'b1);
  and (TipoSB[27], 1'b0, 1'b1);
  and (TipoSB[28], 1'b0, 1'b1);
  and (TipoSB[29], 1'b0, 1'b1);
  and (TipoSB[30], 1'b0, 1'b1);
  and (TipoSB[31], 1'b0, 1'b1);
  // Shift 1 bit
  ShiftLogico1BitIzquierda SL1B1 (TipoSB, TipoSBC);
endmodule

module PrepararTipoU(Inst, TipoUC);
  input [31:0] Inst;
  output [31:0] TipoUC;
  wire [31:0] TipoU;
  and (TipoU[0], Inst[5], 1'b1);
  and (TipoU[1], Inst[6], 1'b1);
  and (TipoU[2], Inst[7], 1'b1);
  and (TipoU[3], Inst[8], 1'b1);
  and (TipoU[4], Inst[9], 1'b1);
  and (TipoU[5], Inst[10], 1'b1);
  and (TipoU[6], Inst[11], 1'b1);
  and (TipoU[7], Inst[12], 1'b1);
  and (TipoU[8], Inst[13], 1'b1);
  and (TipoU[9], Inst[14], 1'b1);
  and (TipoU[10], Inst[15], 1'b1);
  and (TipoU[11], Inst[16], 1'b1);
  and (TipoU[12], Inst[17], 1'b1);
  and (TipoU[13], Inst[18], 1'b1);
  and (TipoU[14], Inst[19], 1'b1);
  and (TipoU[15], Inst[20], 1'b1);
  and (TipoU[16], Inst[21], 1'b1);
  and (TipoU[17], Inst[22], 1'b1);
  and (TipoU[18], Inst[23], 1'b1);
  and (TipoU[19], Inst[24], 1'b1);
  and (TipoU[20], Inst[25], 1'b1);
  and (TipoU[21], 1'b0, 1'b1);
  and (TipoU[22], 1'b0, 1'b1);
  and (TipoU[23], 1'b0, 1'b1);
  and (TipoU[24], 1'b0, 1'b1);
  and (TipoU[25], 1'b0, 1'b1);
  and (TipoU[26], 1'b0, 1'b1);
  and (TipoU[27], 1'b0, 1'b1);
  and (TipoU[28], 1'b0, 1'b1);
  and (TipoU[29], 1'b0, 1'b1);
  and (TipoU[30], 1'b0, 1'b1);
  and (TipoU[31], 1'b0, 1'b1);
  //Shift 12 bits
  ShiftLogico12BitIzquierda SL12BI (TipoU, TipoUC);
endmodule

module PrepararTipoUJ(Inst, TipoUJC);
  input [31:0] Inst;
  output [31:0] TipoUJC;
  wire [31:0] TipoUJ;
  and (TipoUJ[0], Inst[14], 1'b1);
  and (TipoUJ[1], Inst[15], 1'b1);
  and (TipoUJ[2], Inst[16], 1'b1);
  and (TipoUJ[3], Inst[17], 1'b1);
  and (TipoUJ[4], Inst[18], 1'b1);
  and (TipoUJ[5], Inst[19], 1'b1);
  and (TipoUJ[6], Inst[20], 1'b1);
  and (TipoUJ[7], Inst[21], 1'b1);
  and (TipoUJ[8], Inst[22], 1'b1);
  and (TipoUJ[9], Inst[23], 1'b1);
  and (TipoUJ[10], Inst[13], 1'b1);
  and (TipoUJ[11], Inst[5], 1'b1);
  and (TipoUJ[12], Inst[6], 1'b1);
  and (TipoUJ[13], Inst[7], 1'b1);
  and (TipoUJ[14], Inst[8], 1'b1);
  and (TipoUJ[15], Inst[9], 1'b1);
  and (TipoUJ[16], Inst[10], 1'b1);
  and (TipoUJ[17], Inst[11], 1'b1);
  and (TipoUJ[18], Inst[12], 1'b1);
  and (TipoUJ[19], Inst[24], 1'b1);
  and (TipoUJ[20], 1'b0, 1'b1);
  and (TipoUJ[21], 1'b0, 1'b1);
  and (TipoUJ[22], 1'b0, 1'b1);
  and (TipoUJ[23], 1'b0, 1'b1);
  and (TipoUJ[24], 1'b0, 1'b1);
  and (TipoUJ[25], 1'b0, 1'b1);
  and (TipoUJ[26], 1'b0, 1'b1);
  and (TipoUJ[27], 1'b0, 1'b1);
  and (TipoUJ[28], 1'b0, 1'b1);
  and (TipoUJ[29], 1'b0, 1'b1);
  and (TipoUJ[30], 1'b0, 1'b1);
  and (TipoUJ[31], 1'b0, 1'b1);
  // Shift 1 bit
  ShiftLogico1BitIzquierda SL1B2 (TipoUJ, TipoUJC);
endmodule
