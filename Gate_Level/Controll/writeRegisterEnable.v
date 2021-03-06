//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module writeRegisterEnable(opcode, wre);
  input [6:0] opcode;
  output wre, aux;
  wire n5;
  //n5 = bit 5 negado y asi sucesivamente
  not(n5, opcode[5]);
  
  or(aux, opcode[2], opcode[4], n5);
  and(wre, opcode[0], opcode[1], aux);
endmodule
