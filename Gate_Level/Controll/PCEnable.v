//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module pcEnable(opcode, branchResult, pcEn);
  input [6:0] opcode;
  input branchResult;
  output pcEn;
  wire aux;
  
  or(aux, branchResult, opcode[2]);
  and(pcEn, aux, opcode[6]);
endmodule
