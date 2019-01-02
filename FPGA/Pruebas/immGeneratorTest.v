module testImmGenerator;
  reg [24:0] Inst;
  reg ILoad, S, SB, U, UJ;
  wire [31:0] InstMod;
  
  immGenerator iG(Inst, ILoad, S, SB, U, UJ, InstMod);
  
  initial 
  	begin
      $dumpfile("out.vcd");
      $dumpvars(1, testImmGenerator);
      Inst = 25'b1111000000000011101011111;
      ILoad = 0;
      S = 0;
      SB = 0;
      U = 0;
      UJ = 1;
    end
  initial 
    #250 $finish;
endmodule
