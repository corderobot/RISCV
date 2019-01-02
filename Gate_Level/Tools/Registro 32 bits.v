//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez

//Semi flip flop tipo RS, modificado y ajustado para este procesador
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
