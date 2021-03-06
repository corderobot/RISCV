//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module defaultSelector(instruction, defSelector);
  input [31:0] instruction;
  output defSelector;
  
  and(defSelector, instruction[0], instruction[1]);
endmodule

module srlSelector(instruction, srlEnable);
  input [31:0] instruction;
  output [3:0] srlEnable;
  wire n2, n5, n13, n30, aux1, aux2, aux3;
  //n2 = bit 2 negado
  
  not(n2, instruction[2]);
  not(n5, instruction[5]);
  not(n13, instruction[13]);
  not(n30, instruction[30]);
  
  and(aux1, n2, instruction[5], n30);
  or(aux2, aux1, n5);
  and(aux3, aux2, instruction[4], instruction[12], n13, instruction[14]);
  assign srlEnable = aux3*1;
endmodule

module addSelector(instruction, addEnable);
  input [31:0] instruction;
  output [3:0] addEnable;
  wire n2, n4, n5, n12, n13, n14, n25, n30, aux1, aux2, aux3, aux4;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n4, instruction[4]);
  not(n5, instruction[5]);
  not(n12, instruction[12]);
  not(n13, instruction[13]);
  not(n14, instruction[14]);
  not(n25, instruction[25]);
  not(n30, instruction[30]);
  
  and(aux1, n2, instruction[5], n25, n30);
  or(aux2, aux1, n5);
  and(aux3, aux2, instruction[4], n12, n13, n14);
  or(aux4, aux3, n4);
  
  assign addEnable = aux4*2;
endmodule

module andSelector(instruction, andEnable);
  input [31:0] instruction;
  output [3:0] andEnable;
  wire n2, n5, aux1, aux2, aux3;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n5, instruction[5]);

  and(aux1, n2, instruction[5]);
  or(aux2, aux1, n5);
  and(aux3, aux2, instruction[4], instruction[12], instruction[13], instruction[14]);
  
  assign andEnable = aux3*3;
endmodule

module orSelector(instruction, orEnable);
  input [31:0] instruction;
  output [3:0] orEnable;
  wire n2, n5, n12, n25, aux1, aux2, aux3;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n5, instruction[5]);
  not(n12, instruction[12]);
  not(n25, instruction[25]);
  
  and(aux1, n2, instruction[5], n25);
  or(aux2, aux1, n5);
  and(aux3, aux2, instruction[4], n12, instruction[13], instruction[14]);
  
  assign orEnable = aux3*4;
endmodule

module xorSelector(instruction, xorEnable);
  input [31:0] instruction;
  output [3:0] xorEnable;
  wire n2, n5, n12, n13, n25, aux1, aux2, aux3;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n5, instruction[5]);
  not(n12, instruction[12]);
  not(n13, instruction[13]);
  not(n25, instruction[25]);
  
  and(aux1, n2, instruction[5], n25);
  or(aux2, aux1, n5);
  and(aux3, aux2, instruction[4], n12, n13, instruction[14]);
  
  assign xorEnable = aux3*5;
endmodule

module sltSelector(instruction, sltEnable);
  input [31:0] instruction;
  output [3:0] sltEnable;
  wire n2, n5, n12, n14, aux1, aux2, aux3;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n5, instruction[5]);
  not(n12, instruction[12]);
  not(n14, instruction[14]);
  
  and(aux1, n2, instruction[5]);
  or(aux2, aux1, n5);
  and(aux3, aux2, instruction[4], n12, instruction[13], n14);
  
  assign sltEnable = aux3*6;
endmodule

module mulSelector(instruction, mulEnable);
  input [31:0] instruction;
  output [3:0] mulEnable;
  wire n2, n12, n13, n14, n30, aux;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n12, instruction[12]);
  not(n13, instruction[13]);
  not(n14, instruction[14]);
  not(n30, instruction[30]);
  
  and(aux, n2, instruction[5], instruction[25], n30, instruction[4], n12, n13, n14);
  
  assign mulEnable = aux*7;
endmodule

module mulhSelector(instruction, mulhEnable);
  input [31:0] instruction;
  output [3:0] mulhEnable;
  wire n2, n13, n14, aux;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n13, instruction[13]);
  not(n14, instruction[14]);
  
  and(aux, n2, instruction[5], instruction[25], instruction[4], instruction[12], n13, n14);
  
  assign mulhEnable = aux*8;
endmodule

module divSelector(instruction, divEnable);
  input [31:0] instruction;
  output [3:0] divEnable;
  wire n2, n12, n13, aux;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n12, instruction[12]);
  not(n13, instruction[13]);
  
  and(aux, n2, instruction[5], instruction[25], instruction[4], n12, n13, instruction[14]);
  
  assign divEnable = aux*9;
endmodule

module remSelector(instruction, remEnable);
  input [31:0] instruction;
  output [3:0] remEnable;
  wire n2, n12, aux;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n12, instruction[12]);
  
  and(aux, n2, instruction[5], instruction[25], instruction[4], n12, instruction[13], instruction[14]);
  
  assign remEnable = aux*10;
endmodule

module subSelector(instruction, subEnable);
  input [31:0] instruction;
  output [3:0] subEnable;
  wire n2, n12, n13, n14, n25, aux;
  
  //n2 = bit 2 negado
  not(n2, instruction[2]);
  not(n12, instruction[12]);
  not(n13, instruction[13]);
  not(n14, instruction[14]);
  not(n25, instruction[25]);
  
  and(aux, n2, instruction[5], n25, instruction[30], instruction[4], n12, n13, n14);
  
  assign subEnable = aux*11;
endmodule

module muliplexor1bit_2_1(inputA, inputB, sel, out);
  input inputA, inputB, sel;
  output out;
  wire aux1, aux2, selN; //sel negado
  
  not(selN, sel);
  and(aux1, inputA, sel);
  and(aux2, inputB, selN);
  or(out, aux1, aux2);
endmodule

module multiplexor4bits_2_1(input1M, input2M, signal, outputM);
  input [3:0] input1M, input2M;
  input signal;
  output [3:0] outputM;
  
  muliplexor1bit_2_1 m0(input1M[0], input2M[0], signal, outputM[0]);
  muliplexor1bit_2_1 m1(input1M[1], input2M[1], signal, outputM[1]);
  muliplexor1bit_2_1 m2(input1M[2], input2M[2], signal, outputM[2]);
  muliplexor1bit_2_1 m3(input1M[3], input2M[3], signal, outputM[3]);
endmodule

module aluSelector(srlEn, addEn, andEn, orEn, xorEn, sltEn, mulEn, mulhEn, divEn, remEn, subEn, defaultSignal, aluChoice);
  input [3:0] srlEn, addEn, andEn, orEn, xorEn, sltEn, mulEn, mulhEn, divEn, remEn, subEn;
  input defaultSignal;
  output [3:0] aluChoice;
  wire [3:0] sllEn, orChoice, defChoice;
  
  assign sllEn = 4'b0000;
  assign defChoice = 4'b0010;
  assign orChoice = srlEn | addEn | andEn | orEn | xorEn | sltEn | mulEn | mulhEn |  divEn | remEn | subEn;
  
  multiplexor4bits_2_1 m0(orChoice, defChoice, defaultSignal, aluChoice);
endmodule

module aluSelectorControll(instruction, aluChoice);
  input [31:0] instruction;
  output [3:0] aluChoice;
  wire [3:0] sllEn, srlEn, addEn, andEn, orEn, xorEn, sltEn, mulEn, mulhEn, divEn, remEn, subEn;
  wire defaultSignal;
  
  //Uso de modulos anteriores
  defaultSelector dS(instruction, defaultSignal); //señal para el multiplexor
  
  	assign sllEn = 4'b0000;
  	srlSelector srlS(instruction, srlEn);
	addSelector addS(instruction, addEn);
	andSelector andS(instruction, andEn);
	orSelector orS(instruction, orEn);
	xorSelector xorS(instruction, xorEn);
	sltSelector sltS(instruction, sltEn);
	mulSelector mulS(instruction, mulEn);
	mulhSelector mulhS(instruction, mulhEn);
	divSelector divS(instruction, divEn);
	remSelector remS(instruction, remEn);
	subSelector subS(instruction, subEn);
  
  aluSelector aS(srlEn, addEn, andEn, orEn, xorEn, sltEn, mulEn, mulhEn, divEn, remEn, subEn, defaultSignal, aluChoice);
  
endmodule
