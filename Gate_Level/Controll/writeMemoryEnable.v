//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module writeMemoryEnable(opcode, wme);
  input [6:0] opcode;
  output wme;
  wire n4, n6;
  //n5 = bit 5 negado y asi sucesivamente
  not(n4, opcode[4]);
  not(n6, opcode[6]);
  
  and(wme, n4, opcode[5], n6);
endmodule
