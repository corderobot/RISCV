//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: programCounter.v
//	Project: FPGA RISC V
//	Description: Verilog module wich describes the behaviour for Risc V's Program Counter.
//
//	Variables Description:
//	- clk: Main processor's clock.
//	- reset: Signal that resets the Program Counter.
//	- fetch_addr: Current instruction address.
//	- ALUPC: Program Counter returned from the ALU.
//	- PCMux: Signal that indicates wich Program Counter will be saved on the register.
//
//	Update History:
//	- 01/01/2019: Creation of the module.
//	- 01/05/2019: Added extra features and variable Description.
//
//------------------------------------------------------------------------//

module programCounter(clk, reset, ALUPC, PCMux, fetch_addr);

	input clk, PCMux, reset;
	input [31:0] ALUPC;
	output reg [31:0] fetch_addr;
	
	initial fetch_addr <= 0;

	always @ (reset)
	fetch_addr <= 0;

	always @ (posedge clk)
	fork
		if(PCMux)
			fetch_addr = ALUPC;
		else
			fetch_addr <= fetch_addr + 4;
	join
endmodule