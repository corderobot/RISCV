//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez
//Terminado

module demultiplexor1bit_1_32(in, signal, out);
  input in;
  input [4:0] signal;
  output [31:0] out;
  wire s0, s1, s2, s3, s4; //Señales de signal negadas
  
  not(s0, signal[0]);
  not(s1, signal[1]);
  not(s2, signal[2]);
  not(s3, signal[3]);
  not(s4, signal[4]);
  
  //-----------------------
  
  and(out[0], s4, s3, s2, s1, s0);
  and(out[1], s4, s3, s2, s1, signal[0]);
  and(out[2], s4, s3, s2, signal[1], s0);
  and(out[3], s4, s3, s2, signal[1], signal[0]);
  
  and(out[4], s4, s3, signal[2], s1, s0);
  and(out[5], s4, s3, signal[2], s1, signal[0]);
  and(out[6], s4, s3, signal[2], signal[1], s0);
  and(out[7], s4, s3, signal[2], signal[1], signal[0]);
  
  and(out[8], s4, signal[3], s2, s1, s0);
  and(out[9], s4, signal[3], s2, s1, signal[0]);
  and(out[10], s4, signal[3], s2, signal[1], s0);
  and(out[11], s4, signal[3], s2, signal[1], signal[0]);
  and(out[12], s4, signal[3], signal[2], s1, s0);
  and(out[13], s4, signal[3], signal[2], s1, signal[0]);
  and(out[14], s4, signal[3], signal[2], signal[1], s0);
  and(out[15], s4, signal[3], signal[2], signal[1], signal[0]);
  
  and(out[16], signal[4], s3, s2, s1, s0);
  and(out[17], signal[4], s3, s2, s1, signal[0]);
  and(out[18], signal[4], s3, s2, signal[1], s0);
  and(out[19], signal[4], s3, s2, signal[1], signal[0]);
  and(out[20], signal[4], s3, signal[2], s1, s0);
  and(out[21], signal[4], s3, signal[2], s1, signal[0]);
  and(out[22], signal[4], s3, signal[2], signal[1], s0);
  and(out[23], signal[4], s3, signal[2], signal[1], signal[0]);
  and(out[24], signal[4], signal[3], s2, s1, s0);
  and(out[25], signal[4], signal[3], s2, s1, signal[0]);
  and(out[26], signal[4], signal[3], s2, signal[1], s0);
  and(out[27], signal[4], signal[3], s2, signal[1], signal[0]);
  and(out[28], signal[4], signal[3], signal[2], s1, s0);
  and(out[29], signal[4], signal[3], signal[2], s1, signal[0]);
  and(out[30], signal[4], signal[3], signal[2], signal[1], s0);
  and(out[31], signal[4], signal[3], signal[2], signal[1], signal[0]);
  
endmodule



module registerWriteEnables(writeEnable, wreg, enables);
  input writeEnable;
  input [4:0] wreg;
  output [31:0] enables;
  
  demultiplexor1bit_1_32 dm0(writeEnable, wreg, enables);
  
endmodule

module registerWriteData(in, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31);
  input [31:0] in;
  output [31:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;
  
  assign x0 = in;
  assign x1 = in;
  assign x2 = in;
  assign x3 = in;
  assign x4 = in;
  assign x5 = in;
  assign x6 = in;
  assign x7 = in;
  assign x8 = in;
  assign x9 = in;
  assign x10 = in;
  assign x11 = in;
  assign x12 = in;
  assign x13 = in;
  assign x14 = in;
  assign x15 = in;
  assign x16 = in;
  assign x17 = in;
  assign x18 = in;
  assign x19 = in;
  assign x20 = in;
  assign x21 = in;
  assign x22 = in;
  assign x23 = in;
  assign x24 = in;
  assign x25 = in;
  assign x26 = in;
  assign x27 = in;
  assign x28 = in;
  assign x29 = in;
  assign x30 = in;
  assign x31 = in;
  
endmodule

module registerWrite(writeData, writeRegister, writeEnable, registerEnable, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31);
  input [31:0] writeData;
  input [4:0] writeRegister;
  input writeEnable;
  output [31:0] registerEnable, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;
  
  registerWriteEnables rwe(writeEnable, writeRegister, registerEnable);
  registerWriteData rwd(writeData, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31);
  
endmodule
