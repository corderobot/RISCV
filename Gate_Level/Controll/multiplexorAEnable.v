//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module multiplexorAEnable(opcode, enabledA);
  wire n2, n3, n4, n6, aux1, aux2;
  //n5 = bit 5 negado y asi sucesivamente
  not(n2, opcode[2]);
  not(n3, opcode[3]);
  not(n4, opcode[4]);
  not(n6, opcode[6]);
  
//	Señal para indicar si se activa dicho multiplexor
  and(aux1, n2, n6);
  and(aux2, opcode[2], n3, n4);
  nor(enabledA, aux1, aux2);
endmodule
