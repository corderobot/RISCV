//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module branchUnsignedControll(instruction, brUnEn);
  input [31:0] instruction;
  output brUnEn;
  assign brUnEn = instruction[13];
endmodule
