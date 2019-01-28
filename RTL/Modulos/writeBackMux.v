//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: writeBackMux.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for the Write Back Multiplexor of 32 bits, 4 to 1.
//
//	Update History:
//	- 01/05/2019: Creation of the module.
//	- 01/14/2019: Fixed module's inputs. Added pc, alu, mem and imm as inputs of the modules.
//	- 28/01/2019: Registers are now initialized with value 0.
//
//	Variable Description:
//	- clk: Processor's main clock.
//	- muxSelector: Signal that indicates wich input should pass.
//	- writeDataOrRegHazard: Signal that contains the value that will be written on the registers and its potentially the 
//	                        register hazard signal.
//
//-------------------------------------------------------------------------//

module writeBackMux(clk, pc, alu, mem, imm, muxSelector, writeDataOrRegHazard);
	input clk;
	input [1:0] muxSelector;
	input [31:0] pc, alu, mem, imm;
	output reg [31:0] writeDataOrRegHazard;

	initial writeDataOrRegHazard = 0;

	always @ (posedge clk)
	case (muxSelector)
		0: writeDataOrRegHazard = pc;
		1: writeDataOrRegHazard = alu;
		2: writeDataOrRegHazard = mem;
		3: writeDataOrRegHazard = imm;
	endcase
endmodule