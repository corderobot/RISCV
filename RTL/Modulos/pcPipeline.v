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
//	- 01/11/2019: Fixed module's name and the nop's cycle. It takes now an extra cycle to accept a new value.
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

module pcPipeline(clk, nop, pc, pipeline2, pipeline3);
	input clk, nop;
	input [31:0] pc;
	output [31:0] pipeline2, pipeline3;

	reg [31:0] pipeline, pipeline2, pipeline3;

	reg flag;

	initial flag = 0;

	always @ (posedge clk)
	if(flag)
		flag <= 0;
	else
		if(nop)
			begin
				pipeline3 = pipeline2 + 4;

				fork
					pipeline2 = 0;
					pipeline = 0;
					flag = 1;
				join
			end
		else
			begin
				pipeline3 = pipeline2 + 4;
				pipeline2 = pipeline;
				pipeline = pc;
			end
endmodule