//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module nopControll(instruction, branchResult, nopEnable);
  input [31:0] instruction;
  input branchResult;
  output nopEnable;
  
  wire n2, n6, aux1, aux2;
  //n2 = bit 2 negado
  
  not(n2, instruction[2]);
  not(n6, instruction[6]);
  
  and(aux1, instruction[2], instruction[6]);
  and(aux2, n2, instruction[6], branchResult);
  or(nopEnable, aux1, aux2);
endmodule
