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

