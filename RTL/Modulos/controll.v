//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: controll.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for Risc V's Controll section.
//
//
//	Update History:
//	- 02/01/2019: Creation of the module and the following submodules: immGenSelector, muxABSelector,
//								writeRegEnable, loadEnable, writeBack and pcEnable
//	- 03/01/2019: Added a submodule description and the following submodules: unsignedOperations
//
//	Submodule Description:
//	- immGenSelector:	The purpose of this submodule is to send a signal to the Immediate Generator 
//
//-------------------------------------------------------------------------//

module controll(clk, instruction, );
	input clk;
	input [31:0] instruction;

	reg pipelines [0:7];
	always @ (posedge clk)
	fork
		//-----Immediate Generator Selector-----//
		begin


		end


	join
endmodule

module immGenSelector(clk, nop, opcode, pipeline);
	//-----Immediate Generator Selector-----//
	input clk, nop;
	input [6:0] opcode;
	output [4:0] pipeline;

	reg [4:0] pipeline;

	always @ (posedge clk)
		if(nop)
			fork
				pipeline[0] = 0;																		//Type I
				pipeline[1] = 0;																		//Type S
				pipeline[2] = 0;																		//Type U
				pipeline[3] = 0;																		//Type SB
				pipeline[4] = 0;																		//Type UJ
			join
		else
			fork
				pipeline[0] = (~opcode[5] & ~opcode[2]) | (~opcode[4] & ~opcode[3] & opcode[2]);							//Type I
				pipeline[1] = ~opcode[6] & opcode[5] & ~opcode[4];	//Type S
				pipeline[2] = ~opcode[6] & opcode[2];								//Type U
				pipeline[3] = opcode[6] & ~opcode[3] & ~opcode[2];	//Type SB
				pipeline[4] = opcode[3];														//Type UJ
			join
endmodule

module muxABSelector(clk, nop, opcode, pipeline);
	//-----Selector for multiplexor A and B-----//
	input clk, nop;
	input [6:0] opcode;
	output [1:0] pipeline;

	reg [1:0] pipeline;

	always @ (posedge clk)
		if(nop)
			fork
				pipeline[0] = 0;																																				//Multiplexor A
				pipeline[1] = 0;																																				//Multiplexor B
			join
		else
			fork
				pipeline[0] = ~((~opcode[6] & ~opcode[2]) | (~opcode[4] & ~opcode[3] & opcode[2]));			//Multiplexor A
				pipeline[1] = ~(opcode[5] & opcode[4] & ~opcode[2]);																		//Multiplexor B
			join
endmodule

module writeRegEnable(clk, nop, opcode, pipeline3);
	//-----Write Register Enable signal-----//
	input clk, nop;
	input [6:0] opcode;
	output pipeline3;

	reg pipeline, pipeline2, pipeline3;

	always @ (posedge clk)
	begin
		pipeline3 = pipeline2;
		pipeline2 = pipeline;
		if(nop)
			pipeline = 0;
		else
			pipeline = (~opcode[5] | opcode[4] | opcode[2]) & opcode[1] & opcode[0];
	end
endmodule

module writeMemEnable(clk, nop, opcode, pipeline2);
	//-----Write Memory Enable signal-----//
	input clk, nop;
	input [6:0] opcode;
	output pipeline2;

	reg pipeline, pipeline2;

	always @ (posedge clk)
	begin
		pipeline2 = pipeline;
		if(nop)
			pipeline = 0;
		else
			pipeline = ~opcode[6] & opcode[5] & ~opcode[4];
	end
endmodule

module loadEnable(clk, opcode, pipeline2);
	//-----Load Enable signal-----//
	input clk;
	input [6:0] opcode;
	output pipeline2;

	reg pipeline, pipeline2;

	always @ (posedge clk)
	begin
		pipeline2 = pipeline;
		pipeline = ~opcode[6] & ~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
    end
endmodule

module writeBack(clk, opcode, pipeline2);
	//-----Write Back signal-----//
	input clk;
	input [6:0] opcode;
	output [1:0] pipeline2;

	reg [1:0] pipeline, pipeline2;

	always @ (posedge clk)
	begin
		pipeline2 = pipeline;
		if(~opcode[6] & opcode[5] & opcode[2])
			pipeline = 2'b11;
		else if(~opcode[5] & ~opcode[4])
			pipeline = 2'b10;
		else if((opcode[4] & ~opcode[2]) | (~opcode[5] & opcode[2]))
			pipeline = 2'b01;
		else
			pipeline = 2'b00;
	end
endmodule

module pcEnable(clk, nop, bres, opcode, pipeline2);
	//-----PC Enable signal-----//
	input clk, nop, bres;
	input [6:0] opcode;
	output pipeline2;

	reg [6:0] pipeline;
	reg pipeline2;

	always @ (posedge clk)
	begin
		pipeline2 = (bres | pipeline[2]) & pipeline[6];
		if(nop)
			pipeline = 7'b0000000;
		else
			pipeline = opcode;
	end
endmodule

module unsignedOperations(clk, nop, instruction);
	//-----Unsigned Operations for ALU signal-----//
	input clk, nop;
	input [31:0] instruction;
	output pipeline;

	reg pipeline;

	always @ (posedge clk)
	if(nop)
		pipeline = 0;
	else
		pipeline = ((~instruction[30] & instruction[14] & ~instruction[13]) | (~instruction[14] & instruction[13])) & instruction[12] & instruction[4] & ~instruction[2];
endmodule