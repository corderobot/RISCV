module ALU(X, Y, S, Result, Equal);
  input [31:0] X, Y;
  input [3:0] S;
  output [31:0] Result;
  output Equal;
  wire [31:0] wSll, wSrl, wAdd, wSub, wAnd, wOr, wMul, wMulh, wSlt, wDiv, wXor, wRem, zero;
  assign zero = 32'b00000000000000000000000000000000;
  wire [4:0] Y32_5;
  wire CS, CR, wSlt0;
  moduleSll msll(X, Y32_5, wSll);
  moduleSrl mSrl(X, Y32_5, wSrl);
  sumador32bits s32bS(X, Y, 1'b0, wAdd, CS);
  sumador32bits s32bR(X, Y, 1'b1, wSub, CR);
  and32bits and32(X, Y, wAnd);
  or32bits or32(X, Y, wOr);
  moduleMult mMul(X, Y, wMul, wMulh);
  BranchEqual BE(X, Y, Equal);
  BranchLessThan BLT (X, Y, wSlt0);
  BitExtender_1_32 B1_32(wSlt0, wSlt, 1'b0);
  moduleDiv mDiv(X, Y, wDiv, wRem);
  xor32bits x32 (X,Y, wXor);
  Multiplexor_32_4 m32_4(zero, zero, wAdd, wAnd, wOr, wXor, wSlt, zero, zero, zero, zero , wSub, zero, zero, zero, zero, S, Result);
endmodule

module moduleDiv(X, Y, wDiv, wRem);
  input [31:0] X,Y;
  output[31:0] wDiv, wRem;
endmodule

module moduleMult(X, Y, wMul, wMulh);
  input [31:0] X,Y;
  output[31:0] wMul, wMulh;
endmodule

module moduleSll(X, Y32_5, wSll);
  input [31:0] X;
  input [4:0] Y32_5;
  output[31:0] wSll;
endmodule

module moduleSrl(X, Y32_5, wSrl);
  input [31:0] X;
  input [4:0] Y32_5;
  output[31:0] wSrl;
endmodule

module xor32bits(A,B,C);
  input [31:0] A,B;
  output [31:0] C;
    //Spam de XORs
  xor(C[0], A[0], B[0]);
  xor(C[1], A[1], B[1]);
  xor(C[2], A[2], B[2]);
  xor(C[3], A[3], B[3]);
  xor(C[4], A[4], B[4]);
  xor(C[5], A[5], B[5]);
  xor(C[6], A[6], B[6]);
  xor(C[7], A[7], B[7]);
  xor(C[8], A[8], B[8]);
  xor(C[9], A[9], B[9]);
  xor(C[10], A[10], B[10]);
  xor(C[11], A[11], B[11]);
  xor(C[12], A[12], B[12]);
  xor(C[13], A[13], B[13]);
  xor(C[14], A[14], B[14]);
  xor(C[15], A[15], B[15]);
  xor(C[16], A[16], B[16]);
  xor(C[17], A[17], B[17]);
  xor(C[18], A[18], B[18]);
  xor(C[19], A[19], B[19]);
  xor(C[20], A[20], B[20]);
  xor(C[21], A[21], B[21]);
  xor(C[22], A[22], B[22]);
  xor(C[23], A[23], B[23]);
  xor(C[24], A[24], B[24]);
  xor(C[25], A[25], B[25]);
  xor(C[26], A[26], B[26]);
  xor(C[27], A[27], B[27]);
  xor(C[28], A[28], B[28]);
  xor(C[29], A[29], B[29]);
  xor(C[30], A[30], B[30]);
  xor(C[31], A[31], B[31]);
endmodule

module or32bits(A,B,C);
  input [31:0] A,B;
  output [31:0] C;
    //Spam de ORs
  or(C[0], A[0], B[0]);
  or(C[1], A[1], B[1]);
  or(C[2], A[2], B[2]);
  or(C[3], A[3], B[3]);
  or(C[4], A[4], B[4]);
  or(C[5], A[5], B[5]);
  or(C[6], A[6], B[6]);
  or(C[7], A[7], B[7]);
  or(C[8], A[8], B[8]);
  or(C[9], A[9], B[9]);
  or(C[10], A[10], B[10]);
  or(C[11], A[11], B[11]);
  or(C[12], A[12], B[12]);
  or(C[13], A[13], B[13]);
  or(C[14], A[14], B[14]);
  or(C[15], A[15], B[15]);
  or(C[16], A[16], B[16]);
  or(C[17], A[17], B[17]);
  or(C[18], A[18], B[18]);
  or(C[19], A[19], B[19]);
  or(C[20], A[20], B[20]);
  or(C[21], A[21], B[21]);
  or(C[22], A[22], B[22]);
  or(C[23], A[23], B[23]);
  or(C[24], A[24], B[24]);
  or(C[25], A[25], B[25]);
  or(C[26], A[26], B[26]);
  or(C[27], A[27], B[27]);
  or(C[28], A[28], B[28]);
  or(C[29], A[29], B[29]);
  or(C[30], A[30], B[30]);
  or(C[31], A[31], B[31]);
endmodule

module and32bits(A,B,C);
  input [31:0] A,B;
  output [31:0] C;
    //Spam de ANDs
  and(C[0], A[0], B[0]);
  and(C[1], A[1], B[1]);
  and(C[2], A[2], B[2]);
  and(C[3], A[3], B[3]);
  and(C[4], A[4], B[4]);
  and(C[5], A[5], B[5]);
  and(C[6], A[6], B[6]);
  and(C[7], A[7], B[7]);
  and(C[8], A[8], B[8]);
  and(C[9], A[9], B[9]);
  and(C[10], A[10], B[10]);
  and(C[11], A[11], B[11]);
  and(C[12], A[12], B[12]);
  and(C[13], A[13], B[13]);
  and(C[14], A[14], B[14]);
  and(C[15], A[15], B[15]);
  and(C[16], A[16], B[16]);
  and(C[17], A[17], B[17]);
  and(C[18], A[18], B[18]);
  and(C[19], A[19], B[19]);
  and(C[20], A[20], B[20]);
  and(C[21], A[21], B[21]);
  and(C[22], A[22], B[22]);
  and(C[23], A[23], B[23]);
  and(C[24], A[24], B[24]);
  and(C[25], A[25], B[25]);
  and(C[26], A[26], B[26]);
  and(C[27], A[27], B[27]);
  and(C[28], A[28], B[28]);
  and(C[29], A[29], B[29]);
  and(C[30], A[30], B[30]);
  and(C[31], A[31], B[31]);
endmodule

module Multiplexor_32_4(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, sel, out);
  
  input [31:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
  input [3:0] sel;
  output [31:0] out;
  Multiplexor_1_4 M1_5_0 (I0[0], I1[0], I2[0], I3[0], I4[0], I5[0], I6[0], I7[0], I8[0], I9[0], I10[0], I11[0], I12[0], I13[0], I14[0], I15[0], sel, out[0]);
  Multiplexor_1_4 M1_5_1 (I0[1], I1[1], I2[1], I3[1], I4[1], I5[1], I6[1], I7[1], I8[1], I9[1], I10[1], I11[1], I12[1], I13[1], I14[1], I15[1], sel, out[1]);
Multiplexor_1_4 M1_5_2 (I0[2], I1[2], I2[2], I3[2], I4[2], I5[2], I6[2], I7[2], I8[2], I9[2], I10[2], I11[2], I12[2], I13[2], I14[2], I15[2], sel, out[2]);
Multiplexor_1_4 M1_5_3 (I0[3], I1[3], I2[3], I3[3], I4[3], I5[3], I6[3], I7[3], I8[3], I9[3], I10[3], I11[3], I12[3], I13[3], I14[3], I15[3], sel, out[3]);
Multiplexor_1_4 M1_5_4 (I0[4], I1[4], I2[4], I3[4], I4[4], I5[4], I6[4], I7[4], I8[4], I9[4], I10[4], I11[4], I12[4], I13[4], I14[4], I15[4], sel, out[4]);
Multiplexor_1_4 M1_5_5 (I0[5], I1[5], I2[5], I3[5], I4[5], I5[5], I6[5], I7[5], I8[5], I9[5], I10[5], I11[5], I12[5], I13[5], I14[5], I15[5], sel, out[5]);
Multiplexor_1_4 M1_5_6 (I0[6], I1[6], I2[6], I3[6], I4[6], I5[6], I6[6], I7[6], I8[6], I9[6], I10[6], I11[6], I12[6], I13[6], I14[6], I15[6], sel, out[6]);
Multiplexor_1_4 M1_5_7 (I0[7], I1[7], I2[7], I3[7], I4[7], I5[7], I6[7], I7[7], I8[7], I9[7], I10[7], I11[7], I12[7], I13[7], I14[7], I15[7], sel, out[7]);
Multiplexor_1_4 M1_5_8 (I0[8], I1[8], I2[8], I3[8], I4[8], I5[8], I6[8], I7[8], I8[8], I9[8], I10[8], I11[8], I12[8], I13[8], I14[8], I15[8], sel, out[8]);
Multiplexor_1_4 M1_5_9 (I0[9], I1[9], I2[9], I3[9], I4[9], I5[9], I6[9], I7[9], I8[9], I9[9], I10[9], I11[9], I12[9], I13[9], I14[9], I15[9], sel, out[9]);
Multiplexor_1_4 M1_5_10 (I0[10], I1[10], I2[10], I3[10], I4[10], I5[10], I6[10], I7[10], I8[10], I9[10], I10[10], I11[10], I12[10], I13[10], I14[10], I15[10], sel, out[10]);
Multiplexor_1_4 M1_5_11 (I0[11], I1[11], I2[11], I3[11], I4[11], I5[11], I6[11], I7[11], I8[11], I9[11], I10[11], I11[11], I12[11], I13[11], I14[11], I15[11], sel, out[11]);
Multiplexor_1_4 M1_5_12 (I0[12], I1[12], I2[12], I3[12], I4[12], I5[12], I6[12], I7[12], I8[12], I9[12], I10[12], I11[12], I12[12], I13[12], I14[12], I15[12], sel, out[12]);
Multiplexor_1_4 M1_5_13 (I0[13], I1[13], I2[13], I3[13], I4[13], I5[13], I6[13], I7[13], I8[13], I9[13], I10[13], I11[13], I12[13], I13[13], I14[13], I15[13], sel, out[13]);
Multiplexor_1_4 M1_5_14 (I0[14], I1[14], I2[14], I3[14], I4[14], I5[14], I6[14], I7[14], I8[14], I9[14], I10[14], I11[14], I12[14], I13[14], I14[14], I15[14], sel, out[14]);
Multiplexor_1_4 M1_5_15 (I0[15], I1[15], I2[15], I3[15], I4[15], I5[15], I6[15], I7[15], I8[15], I9[15], I10[15], I11[15], I12[15], I13[15], I14[15], I15[15], sel, out[15]);
Multiplexor_1_4 M1_5_16 (I0[16], I1[16], I2[16], I3[16], I4[16], I5[16], I6[16], I7[16], I8[16], I9[16], I10[16], I11[16], I12[16], I13[16], I14[16], I15[16], sel, out[16]);
Multiplexor_1_4 M1_5_17 (I0[17], I1[17], I2[17], I3[17], I4[17], I5[17], I6[17], I7[17], I8[17], I9[17], I10[17], I11[17], I12[17], I13[17], I14[17], I15[17], sel, out[17]);
Multiplexor_1_4 M1_5_18 (I0[18], I1[18], I2[18], I3[18], I4[18], I5[18], I6[18], I7[18], I8[18], I9[18], I10[18], I11[18], I12[18], I13[18], I14[18], I15[18], sel, out[18]);
Multiplexor_1_4 M1_5_19 (I0[19], I1[19], I2[19], I3[19], I4[19], I5[19], I6[19], I7[19], I8[19], I9[19], I10[19], I11[19], I12[19], I13[19], I14[19], I15[19], sel, out[19]);
Multiplexor_1_4 M1_5_20 (I0[20], I1[20], I2[20], I3[20], I4[20], I5[20], I6[20], I7[20], I8[20], I9[20], I10[20], I11[20], I12[20], I13[20], I14[20], I15[20], sel, out[20]);
Multiplexor_1_4 M1_5_21 (I0[21], I1[21], I2[21], I3[21], I4[21], I5[21], I6[21], I7[21], I8[21], I9[21], I10[21], I11[21], I12[21], I13[21], I14[21], I15[21], sel, out[21]);
Multiplexor_1_4 M1_5_22 (I0[22], I1[22], I2[22], I3[22], I4[22], I5[22], I6[22], I7[22], I8[22], I9[22], I10[22], I11[22], I12[22], I13[22], I14[22], I15[22], sel, out[22]);
Multiplexor_1_4 M1_5_23 (I0[23], I1[23], I2[23], I3[23], I4[23], I5[23], I6[23], I7[23], I8[23], I9[23], I10[23], I11[23], I12[23], I13[23], I14[23], I15[23], sel, out[23]);
Multiplexor_1_4 M1_5_24 (I0[24], I1[24], I2[24], I3[24], I4[24], I5[24], I6[24], I7[24], I8[24], I9[24], I10[24], I11[24], I12[24], I13[24], I14[24], I15[24], sel, out[24]);
Multiplexor_1_4 M1_5_25 (I0[25], I1[25], I2[25], I3[25], I4[25], I5[25], I6[25], I7[25], I8[25], I9[25], I10[25], I11[25], I12[25], I13[25], I14[25], I15[25], sel, out[25]);
Multiplexor_1_4 M1_5_26 (I0[26], I1[26], I2[26], I3[26], I4[26], I5[26], I6[26], I7[26], I8[26], I9[26], I10[26], I11[26], I12[26], I13[26], I14[26], I15[26], sel, out[26]);
Multiplexor_1_4 M1_5_27 (I0[27], I1[27], I2[27], I3[27], I4[27], I5[27], I6[27], I7[27], I8[27], I9[27], I10[27], I11[27], I12[27], I13[27], I14[27], I15[27], sel, out[27]);
Multiplexor_1_4 M1_5_28 (I0[28], I1[28], I2[28], I3[28], I4[28], I5[28], I6[28], I7[28], I8[28], I9[28], I10[28], I11[28], I12[28], I13[28], I14[28], I15[28], sel, out[28]);
Multiplexor_1_4 M1_5_29 (I0[29], I1[29], I2[29], I3[29], I4[29], I5[29], I6[29], I7[29], I8[29], I9[29], I10[29], I11[29], I12[29], I13[29], I14[29], I15[29], sel, out[29]);
Multiplexor_1_4 M1_5_30 (I0[30], I1[30], I2[30], I3[30], I4[30], I5[30], I6[30], I7[30], I8[30], I9[30], I10[30], I11[30], I12[30], I13[30], I14[30], I15[30], sel, out[30]);
Multiplexor_1_4 M1_5_31 (I0[31], I1[31], I2[31], I3[31], I4[31], I5[31], I6[31], I7[31], I8[31], I9[31], I10[31], I11[31], I12[31], I13[31], I14[31], I15[31], sel, out[31]);
  
endmodule


module Multiplexor_1_4(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, sel, out);
  input I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
  input [3:0] sel;
  output out;
  wire C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, S0, S1, S2, S3, P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15;
  
  // Negaciones
  
  not (S0, sel[0]);
  not (S1, sel[1]);
  not (S2, sel[2]);
  not (S3, sel[3]);
  
  // ¿Es 0?
  and (C0, S0, S1, S2, S3);
  
  // ¿Es 1?
  and (C1, sel[0], S1, S2, S3);
  
  // ¿Es 2?
  and (C2, S0, sel[1], S2, S3);
  
  // ¿Es 3?
  and (C3, sel[0], sel[1], S2, S3);
  
  // ¿Es 4?
  and (C4, S0, S1, sel[2], S3);
  
  // ¿Es 5?
  and (C5, sel[0], S1, sel[2], S3);
  
  // ¿Es 6?
  and (C6, S0, sel[1], sel[2], S3);
  
  // ¿Es 7?
  and (C7, sel[0], sel[1], sel[2], S3);
  
  // ¿Es 8?
  and (C8, S0, S1, S2, sel[3]);
  
  // ¿Es 9?
  and (C9, sel[0], S1, S2, sel[3]);
  
  // ¿Es 10?
  and (C10, S0, sel[1], S2, sel[3]);
  
  // ¿Es 11?
  and (C11, sel[0], sel[1], S2, sel[3]);
  
  // ¿Es 12?
  and (C12, S0, S1, sel[2], sel[3]);
  
  // ¿Es 13?
  and (C13, sel[0], S1, sel[2], sel[3]);
  
  // ¿Es 14?
  and (C14, S0, sel[1], sel[2], sel[3]);
  
  // ¿Es 15?
  and (C15, sel[0], sel[1], sel[2], sel[3]);
  
  
  
  // Buscar Bit
  
  and (P0, C0, I0);
  and (P1, C1, I1);
  and (P2, C2, I2);
  and (P3, C3, I3);
  and (P4, C4, I4);
  and (P5, C5, I5);
  and (P6, C6, I6);
  and (P7, C7, I7);
  and (P8, C8, I8);
  and (P9, C9, I9);
  and (P10, C10, I10);
  and (P11, C11, I11);
  and (P12, C12, I12);
  and (P13, C13, I13);
  and (P14, C14, I14);
  and (P15, C15, I15);
  
  or(out, P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15);
endmodule

module BranchLessThan(A,B,Co);
  input [31:0] A,B;
  
  wire [31:0] S;
  output Co;
  wire C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32;
  wire B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23, B24, B25, B26, B27, B28, B29, B30, B31;
  
  xor(B0, B[0], 1);
  xor(B1, B[1], 1);
  xor(B2, B[2], 1);
  xor(B3, B[3], 1);
  xor(B4, B[4], 1);
  xor(B5, B[5], 1);
  xor(B6, B[6], 1);
  xor(B7, B[7], 1);
  xor(B8, B[8], 1);
  xor(B9, B[9], 1);
  xor(B10, B[10], 1);
  xor(B11, B[11], 1);
  xor(B12, B[12], 1);
  xor(B13, B[13], 1);
  xor(B14, B[14], 1);
  xor(B15, B[15], 1);
  xor(B16, B[16], 1);
  xor(B17, B[17], 1);
  xor(B18, B[18], 1);
  xor(B19, B[19], 1);
  xor(B20, B[20], 1);
  xor(B21, B[21], 1);
  xor(B22, B[22], 1);
  xor(B23, B[23], 1);
  xor(B24, B[24], 1);
  xor(B25, B[25], 1);
  xor(B26, B[26], 1);
  xor(B27, B[27], 1);
  xor(B28, B[28], 1);
  xor(B29, B[29], 1);
  xor(B30, B[30], 1);
  xor(B31, B[31], 1);
    
  sumador_completo sc0(A[0],B0,1'b1,S[0],C1);
  sumador_completo sc1(A[1],B1,C1,S[1],C2);
  sumador_completo sc2(A[2],B2,C2,S[2],C3);
  sumador_completo sc3(A[3],B3,C3,S[3],C4);
  sumador_completo sc4(A[4],B4,C4,S[4],C5);
  sumador_completo sc5(A[5],B5,C5,S[5],C6);
  sumador_completo sc6(A[6],B6,C6,S[6],C7);
  sumador_completo sc7(A[7],B7,C7,S[7],C8);
  sumador_completo sc8(A[8],B8,C8,S[8],C9);
  sumador_completo sc9(A[9],B9,C9,S[9],C10);
  sumador_completo sc10(A[10],B10,C10,S[10],C11);
  sumador_completo sc11(A[11],B11,C11,S[11],C12);
  sumador_completo sc12(A[12],B12,C12,S[12],C13);
  sumador_completo sc13(A[13],B13,C13,S[13],C14);
  sumador_completo sc14(A[14],B14,C14,S[14],C15);
  sumador_completo sc15(A[15],B15,C15,S[15],C16);
  sumador_completo sc16(A[16],B16,C16,S[16],C17);
  sumador_completo sc17(A[17],B17,C17,S[17],C18);
  sumador_completo sc18(A[18],B18,C18,S[18],C19);
  sumador_completo sc19(A[19],B19,C19,S[19],C20);
  sumador_completo sc20(A[20],B20,C20,S[20],C21);
  sumador_completo sc21(A[21],B21,C21,S[21],C22);
  sumador_completo sc22(A[22],B22,C22,S[22],C23);
  sumador_completo sc23(A[23],B23,C23,S[23],C24);
  sumador_completo sc24(A[24],B24,C24,S[24],C25);
  sumador_completo sc25(A[25],B25,C25,S[25],C26);
  sumador_completo sc26(A[26],B26,C26,S[26],C27);
  sumador_completo sc27(A[27],B27,C27,S[27],C28);
  sumador_completo sc28(A[28],B28,C28,S[28],C29);
  sumador_completo sc29(A[29],B29,C29,S[29],C30);
  sumador_completo sc30(A[30],B30,C30,S[30],C31);
  sumador_completo sc31(A[31],B31,C31,S[31],C32);
  not (Co, C32);
endmodule

module BitExtender_1_32(A,B, sign);
  // sign = 1'b0 Unsigned; sign = bit[31] Signed
  input A, sign;
  wire [31:0] C = {sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,sign,A};
  output [31:0] B;
  assign B = C;
endmodule

module BranchEqual(A,B,E);
  input [31:0] A,B;
  output E;
  wire C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31;


  xnor (C0, A[0], B[0]);
  xnor (C1, A[1], B[1]);
  xnor (C2, A[2], B[2]);
  xnor (C3, A[3], B[3]);
  xnor (C4, A[4], B[4]);
  xnor (C5, A[5], B[5]);
  xnor (C6, A[6], B[6]);
  xnor (C7, A[7], B[7]);
  xnor (C8, A[8], B[8]);
  xnor (C9, A[9], B[9]);
  xnor (C10, A[10], B[10]);
  xnor (C11, A[11], B[11]);
  xnor (C12, A[12], B[12]);
  xnor (C13, A[13], B[13]);
  xnor (C14, A[14], B[14]);
  xnor (C15, A[15], B[15]);
  xnor (C16, A[16], B[16]);
  xnor (C17, A[17], B[17]);
  xnor (C18, A[18], B[18]);
  xnor (C19, A[19], B[19]);
  xnor (C20, A[20], B[20]);
  xnor (C21, A[21], B[21]);
  xnor (C22, A[22], B[22]);
  xnor (C23, A[23], B[23]);
  xnor (C24, A[24], B[24]);
  xnor (C25, A[25], B[25]);
  xnor (C26, A[26], B[26]);
  xnor (C27, A[27], B[27]);
  xnor (C28, A[28], B[28]);
  xnor (C29, A[29], B[29]);
  xnor (C30, A[30], B[30]);
  xnor (C31, A[31], B[31]);
  and (E, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31);
endmodule

module medioSumador(x,y,S,C);
  input x,y;
  output S,C;
  xor(S,x,y);
  and(C,x,y);
endmodule

module sumador_completo(A,B,Ci,S,Co);
  input A,B, Ci;
  output S,Co;
  wire P,G,H;
  medioSumador ms1(A,B,P,G);
  medioSumador ms2(P,Ci,S,H);
  or(Co,G,H);
endmodule

module sumador32bits(A,B,mode,S,Co);
  input [31:0] A,B;
  input mode;
  //mode = 1 es resta, mode = 0 es suma
  
  output [31:0] S;
  output Co;
  wire C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31;
  wire B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23, B24, B25, B26, B27, B28, B29, B30, B31;
  //Empieza el spam de XORs por si hay que hacer una resta
    xor(B0, B[0], mode);
  xor(B1, B[1], mode);
  xor(B2, B[2], mode);
  xor(B3, B[3], mode);
  xor(B4, B[4], mode);
  xor(B5, B[5], mode);
  xor(B6, B[6], mode);
  xor(B7, B[7], mode);
  xor(B8, B[8], mode);
  xor(B9, B[9], mode);
  xor(B10, B[10], mode);
  xor(B11, B[11], mode);
  xor(B12, B[12], mode);
  xor(B13, B[13], mode);
  xor(B14, B[14], mode);
  xor(B15, B[15], mode);
  xor(B16, B[16], mode);
  xor(B17, B[17], mode);
  xor(B18, B[18], mode);
  xor(B19, B[19], mode);
  xor(B20, B[20], mode);
  xor(B21, B[21], mode);
  xor(B22, B[22], mode);
  xor(B23, B[23], mode);
  xor(B24, B[24], mode);
  xor(B25, B[25], mode);
  xor(B26, B[26], mode);
  xor(B27, B[27], mode);
  xor(B28, B[28], mode);
  xor(B29, B[29], mode);
  xor(B30, B[30], mode);
  xor(B31, B[31], mode);
    
  
    //Sumador?
    sumador_completo sc0(A[0],B0,mode,S[0],C1);
  sumador_completo sc1(A[1],B1,C1,S[1],C2);
  sumador_completo sc2(A[2],B2,C2,S[2],C3);
  sumador_completo sc3(A[3],B3,C3,S[3],C4);
  sumador_completo sc4(A[4],B4,C4,S[4],C5);
  sumador_completo sc5(A[5],B5,C5,S[5],C6);
  sumador_completo sc6(A[6],B6,C6,S[6],C7);
  sumador_completo sc7(A[7],B7,C7,S[7],C8);
  sumador_completo sc8(A[8],B8,C8,S[8],C9);
  sumador_completo sc9(A[9],B9,C9,S[9],C10);
  sumador_completo sc10(A[10],B10,C10,S[10],C11);
  sumador_completo sc11(A[11],B11,C11,S[11],C12);
  sumador_completo sc12(A[12],B12,C12,S[12],C13);
  sumador_completo sc13(A[13],B13,C13,S[13],C14);
  sumador_completo sc14(A[14],B14,C14,S[14],C15);
  sumador_completo sc15(A[15],B15,C15,S[15],C16);
  sumador_completo sc16(A[16],B16,C16,S[16],C17);
  sumador_completo sc17(A[17],B17,C17,S[17],C18);
  sumador_completo sc18(A[18],B18,C18,S[18],C19);
  sumador_completo sc19(A[19],B19,C19,S[19],C20);
  sumador_completo sc20(A[20],B20,C20,S[20],C21);
  sumador_completo sc21(A[21],B21,C21,S[21],C22);
  sumador_completo sc22(A[22],B22,C22,S[22],C23);
  sumador_completo sc23(A[23],B23,C23,S[23],C24);
  sumador_completo sc24(A[24],B24,C24,S[24],C25);
  sumador_completo sc25(A[25],B25,C25,S[25],C26);
  sumador_completo sc26(A[26],B26,C26,S[26],C27);
  sumador_completo sc27(A[27],B27,C27,S[27],C28);
  sumador_completo sc28(A[28],B28,C28,S[28],C29);
  sumador_completo sc29(A[29],B29,C29,S[29],C30);
  sumador_completo sc30(A[30],B30,C30,S[30],C31);
    sumador_completo sc31(A[31],B31,C31,S[31],Co);
endmodule
  
