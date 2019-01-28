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
//	- 28/01/2019: Inicialización de los registros con valor 0.
//
//	Variable Description:
//	- clk: Processor's secondary clock.
//	- luiHaz1: Input signal that says if the hazard is active.
//	- luiHaz2: Output signal that says if the hazard is active.
//
//-------------------------------------------------------------------------//

module luiHazardPipeline(clk, luiHaz1, luiHaz2);
	input clk;
	input luiHaz1;
	output reg luiHaz2;

	initial luiHaz2 = 0;

	always @ (posedge clk)
	luiHaz2 <= luiHaz1;
endmodule