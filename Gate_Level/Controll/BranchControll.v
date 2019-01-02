//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module muliplexor1bit_2_1(inputA, inputB, sel, out);
  input inputA, inputB, sel;
  output out;
  wire aux1, aux2, selN; //señal negado
  
  not(selN, sel);
  and(aux1, inputA, sel);
  and(aux2, inputB, selN);
  or(out, aux1, aux2);
endmodule

module branchControll(instruction, blt, beq, result);
  input [31:0] instruction;
  input blt, beq;
  output result;
  wire n12, n14, aux, auxN; //auxN = aux negado
  
  not(n12, instruction[12]);
  not(n14, instruction[14]);
  
  muliplexor1bit_2_1 m1(beq, blt, n14, aux);
  not(auxN, aux);
  muliplexor1bit_2_1 m2(aux, auxN, n12, result);
endmodule
