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

module registro4_bits(clk, enable, data, clear, out);
  input clk, enable, clear;
  input [3:0] data;
  output [3:0] out;
  
  flip_flop_RS ffrs0(clk, enable, data[0], clear, out[0]);
  flip_flop_RS ffrs1(clk, enable, data[1], clear, out[1]);
  flip_flop_RS ffrs2(clk, enable, data[2], clear, out[2]);
  flip_flop_RS ffrs3(clk, enable, data[3], clear, out[3]);
endmodule
