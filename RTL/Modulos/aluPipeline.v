//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: aluPipeline.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behavior for Risc V's alu pipeline.
//
//
//	Update History:
//	- 01/14/2019: Creation of the module
//
//-------------------------------------------------------------------------//

module aluPipeline(clk, aluRes, luiHaz2orALUPC);
	input clk;
	input [31:0] aluRes;
	output reg [31:0] luiHaz2orALUPC;

	initial luiHaz2orALUPC = 0;
  
	always @ (posedge clk)
	luiHaz2orALUPC <= aluRes;
endmodule
