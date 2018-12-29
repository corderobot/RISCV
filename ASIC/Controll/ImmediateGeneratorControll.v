//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module immGeneratorControll(opcode, immI, immS, immSB, immU, immUJ);
  input [6:0] opcode;
  output immI, immS, immSB, immU, immUJ;
  wire n2, n3, n4, n5, n6;
  //n5 = bit 5 negado
  not(n2, opcode[2]);
  not(n3, opcode[3]);
  not(n4, opcode[4]);
  not(n5, opcode[5]);
  not(n6, opcode[6]);
  
//	Señal si se debe construir inmediato tipo I:
  wire auxI;
  and(auxI, opcode[2], n3, n4);
  or(immI, auxI, n5);
  
//	Señal si se debe construir inmediato tipo S:
  and(immS, n6, opcode[5], n4);
  
//	Señal si se debe construir inmediato tipo SB:
  and(immSB, n2, opcode[6]);
  
//	Señal si se debe construir inmediato tipo U:
  and(immU, opcode[2], n6);
  
//	Señal si se debe construir inmediato tipo UJ:
  assign immUJ = opcode[3];
endmodule
