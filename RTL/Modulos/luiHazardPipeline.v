//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: luiHazardPipeline.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behavior for Risc V's Lui Hazard.
//
//
//	Update History:
//	- 01/14/2019: Creation of the module
//
//	Variable Description:
//	- clk: Processor's secondary clock.
//	- luiHaz1: Input signal that says if the hazard is active.
//	- luiHaz2: Output signal that says if the hazard is active.
//
//-------------------------------------------------------------------------//

module luiHazardPipeline(clk, luiHaz1, luiHaz2);
	input clk;
	input [31:0] luiHaz1;
	output reg [31:0] luiHaz2;

	always @ (posedge clk)
	luiHaz2 <= luiHaz1;
endmodule