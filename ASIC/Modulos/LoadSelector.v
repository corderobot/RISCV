module LoadSelector(MemData, Data, lsel);
  input [31:0] MemData;
  input[1:0] lsel;
  output [31:0] Data;
  wire [31:0] w8, w16;
  assign w8[0] = MemData[0];
  assign w8[1] = MemData[1];
  assign w8[2] = MemData[2];
  assign w8[3] = MemData[3];
  assign w8[4] = MemData[4];
  assign w8[5] = MemData[5];
  assign w8[6] = MemData[6];
  assign w8[7] = MemData[7];
  assign w8[8] = MemData[7];
  assign w8[9] = MemData[7];
  assign w8[10] = MemData[7];
  assign w8[11] = MemData[7];
  assign w8[12] = MemData[7];
  assign w8[13] = MemData[7];
  assign w8[14] = MemData[7];
  assign w8[15] = MemData[7];
  assign w8[16] = MemData[7];
  assign w8[17] = MemData[7];
  assign w8[18] = MemData[7];
  assign w8[19] = MemData[7];
  assign w8[20] = MemData[7];
  assign w8[21] = MemData[7];
  assign w8[22] = MemData[7];
  assign w8[23] = MemData[7];
  assign w8[24] = MemData[7];
  assign w8[25] = MemData[7];
  assign w8[26] = MemData[7];
  assign w8[27] = MemData[7];
  assign w8[28] = MemData[7];
  assign w8[29] = MemData[7];
  assign w8[30] = MemData[7];
  assign w8[31] = MemData[7];
  assign w16[0] = MemData[0];
  assign w16[1] = MemData[1];
  assign w16[2] = MemData[2];
  assign w16[3] = MemData[3];
  assign w16[4] = MemData[4];
  assign w16[5] = MemData[5];
  assign w16[6] = MemData[6];
  assign w16[7] = MemData[7];
  assign w16[8] = MemData[8];
  assign w16[9] = MemData[9];
  assign w16[10] = MemData[10];
  assign w16[11] = MemData[11];
  assign w16[12] = MemData[12];
  assign w16[13] = MemData[13];
  assign w16[14] = MemData[14];
  assign w16[15] = MemData[15];
  assign w16[16] = MemData[15];
  assign w16[17] = MemData[15];
  assign w16[18] = MemData[15];
  assign w16[19] = MemData[15];
  assign w16[20] = MemData[15];
  assign w16[21] = MemData[15];
  assign w16[22] = MemData[15];
  assign w16[23] = MemData[15];
  assign w16[24] = MemData[15];
  assign w16[25] = MemData[15];
  assign w16[26] = MemData[15];
  assign w16[27] = MemData[15];
  assign w16[28] = MemData[15];
  assign w16[29] = MemData[15];
  assign w16[30] = MemData[15];
  assign w16[31] = MemData[15];
  
  Multiplexor_32_2 M322_1 (w8,w16,MemData,32'b00000000000000000000000000000000,lsel,Data);
  
endmodule

module Multiplexor_1_2(I0, I1, I2, I3, sel, out);
  input I0, I1, I2, I3;
  input [1:0] sel;
  output out;
  wire [0:0] C0, C1, C1_1, C2, C2_1, C3, OP0, OP1, OP2, OP3,POS0, POS1, POS2, POS3;
  
  // ¿Es 0?
  nor (C0, sel[0], sel[1]);
  
  // ¿Es 1?
  not (C1_1, sel[1]);
  and (C1, C1_1, sel[0]);
  
  // ¿Es 2?
  not (C2_1, sel[0]);
  and (C2, C2_1, sel[1]);
  
  // ¿Es 3?
  and (C3, sel[0], sel[1]);
  // Elegir el bit correcto 
  
  and (OP0, C0, I0);
  and (OP1, C1, I1);
  and (OP2, C2, I2);
  and (OP3, C3, I3);
  
  // Dejar pasar bit seleccionado
  
  or (POS1, OP0, OP1);
  or (POS2, OP2, OP3);
  or (POS3, POS1, POS2);
  or (out, POS3, 1'b0);
endmodule

module Multiplexor_32_2(I0,I1,I2,I3,sel,out);
  input [31:0] I0, I1, I2, I3;
  input [1:0] sel;
  output [31:0] out;
  Multiplexor_1_2 M12_0 (I0[0], I1[0], I2[0], I3[0], sel, out[0]);
  Multiplexor_1_2 M12_1 (I0[1], I1[1], I2[1], I3[1], sel, out[1]);
  Multiplexor_1_2 M12_2 (I0[2], I1[2], I2[2], I3[2], sel, out[2]);
  Multiplexor_1_2 M12_3 (I0[3], I1[3], I2[3], I3[3], sel, out[3]);
  Multiplexor_1_2 M12_4 (I0[4], I1[4], I2[4], I3[4], sel, out[4]);
  Multiplexor_1_2 M12_5 (I0[5], I1[5], I2[5], I3[5], sel, out[5]);
  Multiplexor_1_2 M12_6 (I0[6], I1[6], I2[6], I3[6], sel, out[6]);
  Multiplexor_1_2 M12_7 (I0[7], I1[7], I2[7], I3[7], sel, out[7]);
  Multiplexor_1_2 M12_8 (I0[8], I1[8], I2[8], I3[8], sel, out[8]);
  Multiplexor_1_2 M12_9 (I0[9], I1[9], I2[9], I3[9], sel, out[9]);
  Multiplexor_1_2 M12_10 (I0[10], I1[10], I2[10], I3[10], sel, out[10]);
  Multiplexor_1_2 M12_11 (I0[11], I1[11], I2[11], I3[11], sel, out[11]);
  Multiplexor_1_2 M12_12 (I0[12], I1[12], I2[12], I3[12], sel, out[12]);
  Multiplexor_1_2 M12_13 (I0[13], I1[13], I2[13], I3[13], sel, out[13]);
  Multiplexor_1_2 M12_14 (I0[14], I1[14], I2[14], I3[14], sel, out[14]);
  Multiplexor_1_2 M12_15 (I0[15], I1[15], I2[15], I3[15], sel, out[15]);
  Multiplexor_1_2 M12_16 (I0[16], I1[16], I2[16], I3[16], sel, out[16]);
  Multiplexor_1_2 M12_17 (I0[17], I1[17], I2[17], I3[17], sel, out[17]);
  Multiplexor_1_2 M12_18 (I0[18], I1[18], I2[18], I3[18], sel, out[18]);
  Multiplexor_1_2 M12_19 (I0[19], I1[19], I2[19], I3[19], sel, out[19]);
  Multiplexor_1_2 M12_20 (I0[20], I1[20], I2[20], I3[20], sel, out[20]);
  Multiplexor_1_2 M12_21 (I0[21], I1[21], I2[21], I3[21], sel, out[21]);
  Multiplexor_1_2 M12_22 (I0[22], I1[22], I2[22], I3[22], sel, out[22]);
  Multiplexor_1_2 M12_23 (I0[23], I1[23], I2[23], I3[23], sel, out[23]);
  Multiplexor_1_2 M12_24 (I0[24], I1[24], I2[24], I3[24], sel, out[24]);
  Multiplexor_1_2 M12_25 (I0[25], I1[25], I2[25], I3[25], sel, out[25]);
  Multiplexor_1_2 M12_26 (I0[26], I1[26], I2[26], I3[26], sel, out[26]);
  Multiplexor_1_2 M12_27 (I0[27], I1[27], I2[27], I3[27], sel, out[27]);
  Multiplexor_1_2 M12_28 (I0[28], I1[28], I2[28], I3[28], sel, out[28]);
  Multiplexor_1_2 M12_29 (I0[29], I1[29], I2[29], I3[29], sel, out[29]);
  Multiplexor_1_2 M12_30 (I0[30], I1[30], I2[30], I3[30], sel, out[30]);
  Multiplexor_1_2 M12_31 (I0[31], I1[31], I2[31], I3[31], sel, out[31]);
endmodule
