//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module multiplexorBEnable(opcode, enabledB);
  wire n2;
  //n2 = bit 2 negado y asi sucesivamente
  not(n2, opcode[2]);
  
//	Señal para indicar si se activa dicho multiplexor
  nand(enabledB, n2, opcode[4], opcode[5]);
endmodule
