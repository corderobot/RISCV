//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: registerWritePipeline.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for the register write's pipeline of RISC V.
//
//	Update History:
//	- 01/05/2019: Creation of the module.
//	- 28/01/2019: Registers are now initialized with value 0.
//
//	Variable Description:
//	- clk: Processor's main clock.
//	- rw: Signal that represents register write;
//	- pipeline3: Signal that represents register write;
//
//-------------------------------------------------------------------------//

module registerWritePipeline(clk, rw, pipeline3);
	input clk;
	input [4:0] rw;
	output [4:0] pipeline3;

	reg [4:0] pipeline, pipeline2, pipeline3;

	initial fork
		pipeline = 0;
		pipeline2 = 0;
		pipeline3 = 0;
	join

	always @ (posedge clk)
	begin
		pipeline3 = pipeline2;
		pipeline2 = pipeline;
		pipeline = rw;
	end
endmodule