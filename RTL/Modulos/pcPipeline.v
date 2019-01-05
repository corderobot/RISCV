//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: pcPipeline.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for the program counter's pipeline of RISC V.
//
//	Update History:
//	- 01/05/2019: Creation of the module.
//
//	Variable Description:
//	- clk: Processor's main clock.
//	- nop: Signal that indicates if the program counter should be erased from the pipeline register.
//	- pc: Signal that represents the program counter;
//	- pipeline: Signal that represents register write;
//	- pipeline2: Signal that represents register write;
//	- pipeline3: Signal that represents register write;
//
//-------------------------------------------------------------------------//

module registerWritePipeline(clk, nop, pc, pipeline2, pipeline3);
	input clk, nop;
	input [31:0] pc;
	output [31:0] pipeline2, pipeline3;

	reg [31:0] pipeline, pipeline2, pipeline3;

	always @ (posedge clk)
	fork
		if(nop)
			begin
				pipeline3 = pipeline2 + 4;
				fork
					pipeline3 = 0;
					pipeline2 = 0;
				join
			end
		else
			begin
				pipeline3 = pipeline2 + 4;
				pipeline2 = pipeline;
				pipeline = pc;
			end
	join
endmodule