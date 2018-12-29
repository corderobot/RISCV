module ProgramCounter(Mux, fetch_addr, clk, pc_4);
  input [31:0] Mux;
  input clk;
  output [31:0] fetch_addr, pc_4;
  wire [31:0] wPC, w4;
  wire wC;
  assign w4 = 32'b00000000000000000000000000000100;
  registro32_bits r32b(clk, 1'b1, Mux, 1'b0, wPC);
  assign fetch_addr = wPC;
  sumador32bits s32b (wPC, w4, 1'b0, pc_4, wC);
endmodule

module flip_flop_RS(clk, enable, set, clear, dataQ);
  input clk, set, clear, enable;
  output dataQ;
  wire aux1, aux2, aux3, aux4, trueSignal, allowWrite, tsn, clearN; //tsn = true signal negado, clearN = clear negado
  
  not(tsn, trueSignal);
  not(clearN, clear);
  
  and(allowWrite, clk, enable);
  and(trueSignal, set, clearN);
  
  nand(aux1, allowWrite, trueSignal);
  nand(aux2, allowWrite, tsn);
  nand(aux3, aux1, aux4);
  nand(aux4, aux2, aux3);
  assign dataQ = aux3;
endmodule

module registro32_bits(clk, enable, in, clear, out);
  input clk, enable, clear;
  input [31:0] in;
  output [31:0] out;
  
  flip_flop_RS ffrs0(clk, enable, in[0], clear, out[0]);
  flip_flop_RS ffrs1(clk, enable, in[1], clear, out[1]);
  flip_flop_RS ffrs2(clk, enable, in[2], clear, out[2]);
  flip_flop_RS ffrs3(clk, enable, in[3], clear, out[3]);
  flip_flop_RS ffrs4(clk, enable, in[4], clear, out[4]);
  flip_flop_RS ffrs5(clk, enable, in[5], clear, out[5]);
  flip_flop_RS ffrs6(clk, enable, in[6], clear, out[6]);
  flip_flop_RS ffrs7(clk, enable, in[7], clear, out[7]);
  flip_flop_RS ffrs8(clk, enable, in[8], clear, out[8]);
  flip_flop_RS ffrs9(clk, enable, in[9], clear, out[9]);
  flip_flop_RS ffrs10(clk, enable, in[10], clear, out[10]);
  flip_flop_RS ffrs11(clk, enable, in[11], clear, out[11]);
  flip_flop_RS ffrs12(clk, enable, in[12], clear, out[12]);
  flip_flop_RS ffrs13(clk, enable, in[13], clear, out[13]);
  flip_flop_RS ffrs14(clk, enable, in[14], clear, out[14]);
  flip_flop_RS ffrs15(clk, enable, in[15], clear, out[15]);
  flip_flop_RS ffrs16(clk, enable, in[16], clear, out[16]);
  flip_flop_RS ffrs17(clk, enable, in[17], clear, out[17]);
  flip_flop_RS ffrs18(clk, enable, in[18], clear, out[18]);
  flip_flop_RS ffrs19(clk, enable, in[19], clear, out[19]);
  flip_flop_RS ffrs20(clk, enable, in[20], clear, out[20]);
  flip_flop_RS ffrs21(clk, enable, in[21], clear, out[21]);
  flip_flop_RS ffrs22(clk, enable, in[22], clear, out[22]);
  flip_flop_RS ffrs23(clk, enable, in[23], clear, out[23]);
  flip_flop_RS ffrs24(clk, enable, in[24], clear, out[24]);
  flip_flop_RS ffrs25(clk, enable, in[25], clear, out[25]);
  flip_flop_RS ffrs26(clk, enable, in[26], clear, out[26]);
  flip_flop_RS ffrs27(clk, enable, in[27], clear, out[27]);
  flip_flop_RS ffrs28(clk, enable, in[28], clear, out[28]);
  flip_flop_RS ffrs29(clk, enable, in[29], clear, out[29]);
  flip_flop_RS ffrs30(clk, enable, in[30], clear, out[30]);
  flip_flop_RS ffrs31(clk, enable, in[31], clear, out[31]);
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
