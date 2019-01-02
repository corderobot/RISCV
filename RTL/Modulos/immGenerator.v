//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: immGenerator.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behavior for Risc V's ImmGenerator
//
//
//	Update History:
//	- 01/02/2019: Creation of the module.
//
//-------------------------------------------------------------------------//
	
module immGenerator(input [24:0] Inst,
                    input ILoad, S, SB, U, UJ,
                    output reg [31:0] InstMod);
  	
  always @(Inst, ILoad, S, SB, U, UJ)
    fork
      if(ILoad)
        begin
          InstMod[11:0] <= Inst[24:13];
          InstMod[31:12] <= {20{Inst[24]}};
        end
      else if(S)
        begin
          InstMod[4:0] <= Inst[4:0];
          InstMod[11:5] <= Inst[24:18];
          InstMod[31:12] <= {20{Inst[24]}};
        end
      else if(SB)
        begin
          InstMod[4:1] <= Inst[4:1];
          InstMod[10:5] <= Inst[23:18];
          InstMod[11] <= Inst[0];
          InstMod[12] <= Inst[24];
          InstMod[31:13] <= {19{Inst[24]}};
          InstMod[0] <= 1'b0;
        end
      else if(U)
        begin
          InstMod[31:12] <= Inst[24:5];
          InstMod[11:0] <= {12{1'b0}};
          InstMod = InstMod << 'h0c;
        end
      else if (UJ)
        begin
          InstMod[0] = 1'b0;
          InstMod[10:1] <= Inst[23:14];
          InstMod[11] <= Inst[13];
          InstMod[19:12] <= Inst[12:5];
          InstMod[20] <= Inst[24];
          InstMod[31:21] <= {10{Inst[24]}};
        end
    join
endmodule
