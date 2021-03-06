module BranchComparator(rs1, rs2, blt, beq, u);
  input [31:0] rs1, rs2;
  output blt, beq;
  input u;
  wire [30:0] subs1, subs2;
  wire blt1, signo, pos, bltp, bltn, nblt1, blt2p, blt2p2, blt1p, neg, nrs1, nrs2, ver1, wbls, wblu;
  or (subs1[0], rs1[0], 1'b0);
  or (subs1[1], rs1[1], 1'b0);
  or (subs1[2], rs1[2], 1'b0);
  or (subs1[3], rs1[3], 1'b0);
  or (subs1[4], rs1[4], 1'b0);
  or (subs1[5], rs1[5], 1'b0);
  or (subs1[6], rs1[6], 1'b0);
  or (subs1[7], rs1[7], 1'b0);
  or (subs1[8], rs1[8], 1'b0);
  or (subs1[9], rs1[9], 1'b0);
  or (subs1[10], rs1[10], 1'b0);
  or (subs1[11], rs1[11], 1'b0);
  or (subs1[12], rs1[12], 1'b0);
  or (subs1[13], rs1[13], 1'b0);
  or (subs1[14], rs1[14], 1'b0);
  or (subs1[15], rs1[15], 1'b0);
  or (subs1[16], rs1[16], 1'b0);
  or (subs1[17], rs1[17], 1'b0);
  or (subs1[18], rs1[18], 1'b0);
  or (subs1[19], rs1[19], 1'b0);
  or (subs1[20], rs1[20], 1'b0);
  or (subs1[21], rs1[21], 1'b0);
  or (subs1[22], rs1[22], 1'b0);
  or (subs1[23], rs1[23], 1'b0);
  or (subs1[24], rs1[24], 1'b0);
  or (subs1[25], rs1[25], 1'b0);
  or (subs1[26], rs1[26], 1'b0);
  or (subs1[27], rs1[27], 1'b0);
  or (subs1[28], rs1[28], 1'b0);
  or (subs1[29], rs1[29], 1'b0);
  or (subs1[30], rs1[30], 1'b0);
  or (subs2[0], rs2[0], 1'b0);
  or (subs2[1], rs2[1], 1'b0);
  or (subs2[2], rs2[2], 1'b0);
  or (subs2[3], rs2[3], 1'b0);
  or (subs2[4], rs2[4], 1'b0);
  or (subs2[5], rs2[5], 1'b0);
  or (subs2[6], rs2[6], 1'b0);
  or (subs2[7], rs2[7], 1'b0);
  or (subs2[8], rs2[8], 1'b0);
  or (subs2[9], rs2[9], 1'b0);
  or (subs2[10], rs2[10], 1'b0);
  or (subs2[11], rs2[11], 1'b0);
  or (subs2[12], rs2[12], 1'b0);
  or (subs2[13], rs2[13], 1'b0);
  or (subs2[14], rs2[14], 1'b0);
  or (subs2[15], rs2[15], 1'b0);
  or (subs2[16], rs2[16], 1'b0);
  or (subs2[17], rs2[17], 1'b0);
  or (subs2[18], rs2[18], 1'b0);
  or (subs2[19], rs2[19], 1'b0);
  or (subs2[20], rs2[20], 1'b0);
  or (subs2[21], rs2[21], 1'b0);
  or (subs2[22], rs2[22], 1'b0);
  or (subs2[23], rs2[23], 1'b0);
  or (subs2[24], rs2[24], 1'b0);
  or (subs2[25], rs2[25], 1'b0);
  or (subs2[26], rs2[26], 1'b0);
  or (subs2[27], rs2[27], 1'b0);
  or (subs2[28], rs2[28], 1'b0);
  or (subs2[29], rs2[29], 1'b0);
  or (subs2[30], rs2[30], 1'b0);
  BranchLessThan31Bits blt31bits_1(subs1, subs2, blt1);
  BranchEqual BE (rs1, rs2, beq);
  BranchLessThan blt32_1 (rs1, rs2, wblu);
  
  // Signos Distintos?
  xor (signo, rs1[31], rs2[31]);
  
  // Signos iguales
  	//Signos Positivos
  nor (pos, rs1[31], rs2[31]);
  and (bltp, pos, blt1);
  	// Signos Negativos
  and (neg, rs1[31], rs2[31]);
  not (nblt1, blt1);
  and (bltn, nblt1, neg);
  
  // Signos Distintos
  	// rs2 positivo, rs1 negativo
  not (blt2p, rs2[31]);
  and (blt2p2, blt2p, rs1[31]);
  
  or(ver1, bltp, bltn);
  or(wbls, ver1, blt2p2);
  
  Mux_2_1 M21 (wbls, wblu, u, blt);
  
endmodule

module medioSumador(x,y,S,C);
  input x,y;
  output S,C;
  xor(S,x,y);
  and(C,x,y);
endmodule

module Mux_2_1(I0, I1, A, Y);
	input I0, I1, A;
	output Y;
	wire I0A, AN, ANI1;
	nand (I0A, I0, A);
	nand (AN, A, A);
	nand (ANI1, AN, I1);
	nand (Y, I0A, ANI1);
endmodule



module sumador_completo(A,B,Ci,S,Co);
  input A,B, Ci;
  output S,Co;
  wire P,G,H;
  medioSumador ms1(A,B,P,G);
  medioSumador ms2(P,Ci,S,H);
  or(Co,G,H);
endmodule

module BranchLessThan(A,B,Co);
  input [31:0] A,B;
  output Co;
  wire C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32;
  wire B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23, B24, B25, B26, B27, B28, B29, B30, B31;
  wire [31: 0] S;
  
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

module BranchLessThan31Bits(A,B,Co);
  input [30:0] A,B;
  output Co;
  wire C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31;
  wire B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23, B24, B25, B26, B27, B28, B29, B30;
  wire [31: 0] S;
  
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
  not (Co, C31);
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

module BranchEqual(A,B,E);
  input [31:0] A,B;
  output E;
  wire C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58, C59, C60, C61;

  
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
  and (C32, C0, C1);
  and (C33, C2, C3);
  and (C34, C4, C5);
  and (C35, C6, C7);
  and (C36, C8, C9);
  and (C37, C10, C11);
  and (C38, C12, C13);
  and (C39, C14, C15);
  and (C40, C16, C17);
  and (C41, C18, C19);
  and (C42, C20, C21);
  and (C43, C22, C23);
  and (C44, C24, C25);
  and (C45, C26, C27);
  and (C46, C28, C29);
  and (C47, C30, C31);
  and (C48, C32, C33);
  and (C49, C34, C35);
  and (C50, C36, C37);
  and (C51, C38, C39);
  and (C52, C40, C41);
  and (C53, C42, C43);
  and (C54, C44, C45);
  and (C55, C46, C47);
  and (C56, C48, C49);
  and (C57, C50, C51);
  and (C58, C52, C53);
  and (C59, C54, C55);
  and (C60, C56, C57);
  and (C61, C58, C59);
  and (E, C60, C61);
endmodule
