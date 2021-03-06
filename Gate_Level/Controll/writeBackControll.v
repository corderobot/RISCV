//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module writeBackMultipleEnable(opcode, pc, alu, mem, imm);
  input [6:0] opcode;
  output pc, alu, mem, imm;
  //pc = program counter, mem = memory, imm = immediate
  wire n2, n4, n5, n6;
  //n5 = bit 5 negado y asi sucesivamente
  
  not(n2, opcode[2]);
  not(n4, opcode[4]);
  not(n5, opcode[5]);
  not(n6, opcode[6]);
  
  and(pc, opcode[2], n4);
  and(alu, n2, opcode[4]);
  and(mem, n4, n5);
  and(imm, opcode[2], n6);
endmodule

module writeBackControll(pc, alu, mem, imm, wbe);
  input pc, alu, mem, imm;
  output [1:0] wbe;
  wire [1:0] a, b, c, d;
  assign a = 2'b00;
  assign b = alu*1;
  assign c = mem*2;
  assign d = imm*3;
  
  assign wbe = a | b | c | d;
endmodule
