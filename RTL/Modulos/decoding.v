//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: decoding.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for the decoder of RISC V.
//
//	Update History:
//	- 01/05/2019: Creation of the module.
//
//	Variable Description:
//	- clk: Processor's main clock.
//	- nop: Signal that indicates if the instruction should be erased from the pipeline register.
//	- instruction: Instructinon to execute.
//	- inst: Instruction to execute.
//	- rr1: Signal that represents which register's data must be consulted (for register 1);
//	- rr2: Signal that represents which register's data must be consulted (for register 2);
//	- rw: Signal that represents wich register will be allowed to save new values.
//	- imm: Signal that contains the coded immediate wich will be decoded by the Immediate Generator.
//
//-------------------------------------------------------------------------//

module decoding(clk, nop, instruction, inst, rr1, rr2, rw, imm);
	input clk, nop;
	input [31:0] instruction;
	output reg [4:0] rr1, rr2, rw;
	output reg [24:0] imm;
	output reg [31:0] inst;

	reg [31:0] pipeline;

	always @ (posedge clk)
	if(nop)
		pipeline = 0;
	else
		fork
			inst <= instruction;
			rr1 <= pipeline[19:15];
			rr2 <= pipeline[24:20];
			rw <= pipeline[11:7];
			imm <= pipeline[31:7];
		join
endmodule