module muliplexor1bit_2_1(inputA, inputB, sel, out);
  input inputA, inputB, sel;
  output out;
  wire aux1, aux2, selN; //sel negado
  
  not(selN, sel);
  and(aux1, inputA, sel);
  and(aux2, inputB, selN);
  or(out, aux1, aux2);
endmodule

module multiplexor4bits_2_1(input1M, input2M, signal, outputM);
  input [3:0] input1M, input2M;
  input selector;
  output [3:0] outputM;
  
  muliplexor1bit_2_1 m0(input1M[0], input2M[0], signal, outputM[0]);
  muliplexor1bit_2_1 m1(input1M[1], input2M[1], signal, outputM[1]);
  muliplexor1bit_2_1 m2(input1M[2], input2M[2], signal, outputM[2]);
  muliplexor1bit_2_1 m3(input1M[3], input2M[3], signal, outputM[3]);
endmodule
