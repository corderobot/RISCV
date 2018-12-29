//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module loadEnable(opcode, lEn);
  input [6:0] opcode;
  output lEn;
  wire n2, n3, n4, n5, n6;
  
	not(n2, opcode[2]);
	not(n3, opcode[3]);
	not(n4, opcode[4]);
	not(n5, opcode[5]);
	not(n6, opcode[6]);
  
  and(lEn, opcode[0], opcode[1], n2, n3, n4, n5, n6);
endmodule
