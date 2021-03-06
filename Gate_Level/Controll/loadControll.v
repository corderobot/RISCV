//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module loadHalfEnable(instruction, lhEn);
  input [31:0] instruction;
  output [1:0] lhEn;
  wire n13, n14, aux;
  
  not(n13, instruction[13]);
  not(n14, instruction[14]);
  and(aux, instruction[12], n13, n14);
  
  assign lhEn = aux;
endmodule

module loadWordEnable(instruction, lwEn);
  input [31:0] instruction;
  output [1:0] lwEn;
  wire n12, n14, aux;
  
  not(n12, instruction[12]);
  not(n14, instruction[14]);
  and(aux, n12, instruction[13], n14);
  
  assign lwEn = aux*2;
endmodule

module loadControll(instruction, loadOption);
  input [31:0] instruction;
  output [1:0] loadOption;
  wire [1:0] lb, lh, lw;
  
  assign lb = 2'b00;
  loadHalfEnable lhe(instruction, lh);
  loadWordEnable lwe(instruction, lw);
  
  assign loadOption = lb | lh | lw;
endmodule
