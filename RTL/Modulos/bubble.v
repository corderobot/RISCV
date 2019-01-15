//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: bubble.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behavior for Risc V's bubble.
//
//
//	Update History:
//	- 01/14/2019: Creation of the module
//
//-------------------------------------------------------------------------//

module bubble(rs1, rw, loadEn, clk, clock);
  input [4:0] rs1, rw;
  input loadEn, clk;
  output reg clock;
  always @(rs1, rw, loadEn, clk)
    if((rs1 == rw) & loadEn)
      clock = 0;
    else 
      clock = clk;
endmodule