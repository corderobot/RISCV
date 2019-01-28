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
//                writeRegEnable, writeMemEnable, loadEnable, writeBack and pcEnable.
//	- 03/01/2019: Modified the main module (controll), added a submodule description and 
//                the following submodules: unsignedOperations, loadControll, ALUSel, brControll.
//	- 04/01/2019: Added the submodules brUnsigned and nopControll, modified the main module (controll)
//                and the following submodules: loadControll, ALUSel and brControll.
//	- 05/01/2019: Added the submodule Hazards and modified the main module (controll).
//	- 10/01/2019: Fixed the submodules: nopControll, brControll, writeRegEnable, writeMemEnable and muxABSelector. Once nop is activated, it takes 1 more clock cycle.
//	- 11/01/2019: Fixed ALUSel, now it accepts sll and slli instructions.
//	- 28/01/2019: Inicialización de los registros con valor 0.
//
//	Submodule Description:
//	- immGenSelector:     The purpose of this submodule is to send a signal that indicates to the
//                        Immediate Generator wich type of immediate to generate.
//	- muxABSelector:      Submodule wich tells to the multiplexor A and B wich data should let it 'pass'.
//	- writeRegEnable:     The sole purpose of this module is to let values be written on the Register File.
//	- writeMemEnable:     The sole purpose of this module is to let values be written on the memory.
//	- loadEnable:         The purpose of this module is to send a signal to another module in
//                        charge of inserting 'bubles' (hazard solution of this processor).
//	- writeBack:          Submodule wich tells the Write Back Multiplexor wich input should pass.
//	- pcEnable:           Submodule in charge of generating a signal wich tells to the PC multiplexor
//                        if the PC input should pass.
//	- unsignedOperations: The purpose is to send a signal to the ALU wich tells if the operations should
//												be done with unsigned inputs.
//	- loadControll:       Submodule wich indicates to the Load Selector Multiplexor wich load should pass.
//	- ALUSel:             The purpose of this module is to indicate to the ALU wich operation shall be done.
//	- brControll:         Submodule in charge of sending a signal if the branch was succesfully done or not.
//	- brUnsigned:         Submodule in charge of determining if a branch should be done with unsigned values.
//	- nopControll:        The purpose of this submodule is to send a signal to all the pipeline registers to reset their values.
//	- Hazards:            The purpose of this submodule is to send signals if the respective hazards have been activated.
//
//-------------------------------------------------------------------------//

module controll(clk, instruction, blt, beq, writeRegEnableSignal, writeMemEnableSignal, loadEnableSignal, pcEnableSignal, unsignedOperationsSignal, nopSignal, brUnsignedSignal, muxABSelectorSignal, writeBackSignal, loadControllSignal, aluSelectorSignal, immGenSelectorSignal, alu1AHazSignal, alu1BHazSignal, alu2AHazSignal, alu2BHazSignal, mregAHazSignal, mregBHazSignal, rs1, rs2, rsd);
	//-----Controll Section-----//
	input clk, blt, beq;
	input [4:0] rs1, rs2, rsd;
	input [31:0] instruction;

	output writeRegEnableSignal, writeMemEnableSignal, loadEnableSignal, pcEnableSignal, unsignedOperationsSignal, nopSignal, brUnsignedSignal,  alu1AHazSignal, alu1BHazSignal, alu2AHazSignal, alu2BHazSignal, mregAHazSignal, mregBHazSignal;
	output [1:0] muxABSelectorSignal, writeBackSignal, loadControllSignal;
	output [3:0] aluSelectorSignal;
	output [4:0] immGenSelectorSignal;

	wire brControllSignal;

	immGenSelector        igs(clk, nopSignal, instruction[6:0], immGenSelectorSignal);
	muxABSelector         mabs(clk, nopSignal, instruction[6:0], muxABSelectorSignal);
	writeRegEnable        wre(clk, nopSignal, instruction[6:0], writeRegEnableSignal);
	writeMemEnable        wme(clk, instruction[6:0], writeMemEnableSignal);
	loadEnable            le(clk, instruction[6:0], loadEnableSignal);
	writeBack             wb(clk, instruction[6:0], writeBackSignal);
	pcEnable              pce(clk, nopSignal, brControllSignal, instruction[6:0], pcEnableSignal);
	unsignedOperations    uo(clk, nopSignal, instruction, unsignedOperationsSignal);
	loadControll          lc(clk, instruction, loadControllSignal);
	ALUSel                as(clk, instruction, aluSelectorSignal);
	brUnsigned            bru(clk, instruction, brUnsignedSignal);
	brControll            brc(clk, nopSignal, instruction, blt, beq, brControllSignal);
	nopControll           nc(clk, brControllSignal, instruction, nopSignal);
	Hazards               haz(clk, rs1, rs2, rsd, alu1AHazSignal, alu1BHazSignal, alu2AHazSignal, alu2BHazSignal, mregAHazSignal, mregBHazSignal);
endmodule

module immGenSelector(clk, nop, opcode, pipeline);
	//-----Immediate Generator Selector-----//
	input clk, nop;
	input [6:0] opcode;
	output reg [4:0] pipeline;
	
	reg flag;

	initial fork
		flag = 1;
		pipeline = 0;
	join

	always @ (posedge clk)
	if(flag)
		flag = 0;
	else
		if(nop)
			fork
				pipeline[0] = 0;																		//Type I
				pipeline[1] = 0;																		//Type S
				pipeline[2] = 0;																		//Type U
				pipeline[3] = 0;																		//Type SB
				pipeline[4] = 0;																		//Type UJ
				flag = 1;
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
	output reg [1:0] pipeline;

	reg flag;
  
	initial fork
		flag = 0;
		pipeline = 0;
  	join

	always @ (posedge clk)
	if(flag)
		flag = 0;
	else
		if(nop)
			fork
				pipeline[0] = 0;
				pipeline[1] = 0;
			  flag = 1;
			join
		else
			fork
				pipeline[0] = ~((~opcode[6] & ~opcode[2]) | (~opcode[4] & ~opcode[3] & opcode[2]));
				pipeline[1] = ~(opcode[5] & opcode[4] & ~opcode[2]);
			join
endmodule

module writeRegEnable(clk, nop, opcode, pipeline3);
	//-----Write Register Enable signal-----//
	input clk, nop;
	input [6:0] opcode;
	output reg pipeline3;

	reg pipeline, pipeline2, pipeline3, flag;

	initial fork
		flag = 0;
		pipeline = 0;
		pipeline2 = 0;
		pipeline3 = 0;
	join

	always @ (posedge clk)
	begin
		pipeline3 = pipeline2;
		pipeline2 = pipeline;
		if(flag)
			flag = 0; 
		else
			if(nop)
				fork
					pipeline = 0;
					flag = 1;
				join
			else
				pipeline = (~opcode[5] | opcode[4] | opcode[2]) & opcode[1] & opcode[0];
		
	end
endmodule

module writeMemEnable(clk, opcode, pipeline2);
	//-----Write Memory Enable signal-----//
	input clk;
	input [6:0] opcode;
	output reg pipeline2;

	reg pipeline;

	initial fork
		pipeline = 0;
		pipeline2 = 0;
	join

	always @ (posedge clk)
	begin
		pipeline2 = pipeline;
		pipeline = ~opcode[6] & opcode[5] & ~opcode[4];
	end
endmodule

module loadEnable(clk, opcode, pipeline2);
	//-----Load Enable signal-----//
	input clk;
	input [6:0] opcode;
	output reg pipeline2;

	reg pipeline;

	initial fork
		pipeline = 0;
		pipeline2 = 0;
	join

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
	output reg [1:0] pipeline2;

	reg [1:0] pipeline;

	initial fork
		pipeline = 0;
		pipeline2 = 0;
	join

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
	output reg pipeline2;

	reg [6:0] pipeline;
	reg flag;
  
	initial fork
		flag = 0;
		pipeline = 0;
		pipeline2 = 0;
	join

	always @ (posedge clk)
	begin
		pipeline2 = (bres | pipeline[2]) & pipeline[6];
		if(flag)
			flag = 0;
		else
		  if(nop)
				fork
					pipeline = 0;
					flag = 1;
				join
		  else
				pipeline = opcode;
	end
endmodule

module unsignedOperations(clk, nop, instruction, pipeline);
	//-----Unsigned Operations for ALU signal-----//
	input clk, nop;
	input [31:0] instruction;
	output reg pipeline;

	reg flag;

	initial fork
		flag = 0;
		pipeline = 0;
	join


	always @ (posedge clk)
		if(flag)  
			flag = 0;
		else
		  if(nop)
			fork
			  pipeline = 0;
			  flag = 1;
			join
		  else
			  pipeline = ((~instruction[30] & instruction[14] & ~instruction[13]) | (~instruction[14] & instruction[13])) & instruction[12] & instruction[4] & ~instruction[2];
endmodule

module loadControll(clk, inst, pipeline2);
	//-----Load Controll signal-----//
	input clk;
	input [31:0] inst;
	output reg [1:0] pipeline2;

	reg [1:0] pipeline;

	initial fork
		pipeline = 0;
		pipeline2 = 0;
	join

	always @(posedge clk)
		begin
			pipeline2 = pipeline;
			case ({inst[14], inst[13], inst[12]})
				3'b000: pipeline = 0;
				3'b001: pipeline = 1;
				3'b010: pipeline = 2;
				default: pipeline = 0;
			endcase
		end
endmodule

module ALUSel(clk, inst, pipeline);
	//-----Alu Selector signal-----//
	input clk;
	input [31:0] inst;
	output reg [3:0] pipeline;

	initial pipeline = 0;
	
	always @(posedge clk)
			fork
				case (inst[0] & inst[1])
					1'b0 : pipeline = 2;
					1'b1 : 
							if(inst[14] & ~inst[13] & inst[12] & inst[4] & ~inst[2]) //srl
								pipeline = 1;
							else if( (~inst[14] & ~inst[13] & ~inst[12] & inst[4] & ((~inst[30] & ~inst[25] & inst[5] & ~inst[2]) |  ~inst[5])) | ~inst[4]) //add
								pipeline = 2;
							else if( inst[14] & inst[13] & inst[12] & inst[4] & ((inst[5] & ~inst[2]) | ~inst[5]) ) //and
								pipeline = 3;
							else if( ((inst[14] & inst[13] & ~inst[12] & inst[4] & ((~inst[25] & inst[5] & ~inst[2]) | ~inst[5]))) ) //or
								pipeline = 4;
							else if( ((inst[14] & ~inst[13] & ~inst[12] & inst[4] & ((~inst[25] & inst[5] & ~inst[2]) | ~inst[5]))) ) //xor
								pipeline = 5;
							else if( ~inst[14] & inst[13] & inst[4] & ~inst[2] ) //slt
								pipeline = 6;
							else if( ~inst[14] & ~inst[13] & ~inst[12] & inst[4] & ~inst[30] & inst[25] & inst[5] & ~inst[2] ) //mul
								pipeline = 7;
							else if( ~inst[14] & ~inst[13] & inst[12] & inst[4] & inst[25] & inst[5] & ~inst[2] ) //mulh
								pipeline = 8;
							else if( inst[14] & ~inst[13] & ~inst[12] & inst[4] & inst[25] & inst[5] & ~inst[2] ) //div
								pipeline = 9;
							else if( inst[14] & inst[13] & ~inst[12] & inst[4] & inst[25] & inst[5] & ~inst[2] )
								pipeline = 10;
							else if( ~inst[14] & ~inst[13] & ~inst[12] & inst[4] & inst[30] & ~inst[25] & inst[5] & ~inst[2] )
								pipeline = 11;
							else if( ~inst[14] & ~inst[13] & inst[12] & inst[4] & ( ( ~inst[25] & inst[5] & ~inst[2] ) | ~inst[5] ) )
								pipeline = 0;
							else
								pipeline = 2;
				endcase
			join
endmodule

module brControll(clk, nop, inst, blt, beq, pipeline);
	//-----Branch Controll signal-----//
	input [31:0] inst;
	input clk, nop, blt, beq;
	output reg pipeline;
	
	reg flag;

	initial fork
		flag = 1;
		pipeline = 0;
	join

	always @(posedge clk)
	if(flag)
		flag = 0;
	else
		if(nop)
			fork
				pipeline = 0;
				flag = 1;
			join
		else
			if(~inst[14] & ~inst[12])
				pipeline = beq;
			else if(~inst[14] & inst[12])
				pipeline = ~beq;
			else if(inst[14] & ~inst[12])
				pipeline = blt;
			else if(inst[14] & inst[12])
				pipeline = ~blt;
endmodule

module brUnsigned(clk, inst, pipeline);
	//-----Branch Unsigned signal-----//
	input clk;
	input [31:0] inst;
	output reg pipeline;

	initial pipeline = 0;

	always @ (posedge clk)
		pipeline = inst[13];
endmodule

module nopControll(clk, bres, inst, nop);
	//-----Nop Controll signal-----//
	input clk, bres;
	input [31:0] inst;
	output reg nop;

	reg pipelineA, pipelineB, flag;

	initial fork
		flag = 0;
		pipelineA = 0;
		pipelineB = 0;
		nop = 0;
	join

	always @ (posedge clk)
	begin
	  
	if(flag)
		fork 
		  flag = 0;
		  nop = 0;
		join
	else
		begin
			nop = (pipelineA & pipelineB) | (pipelineA & ~pipelineB & bres);
			if(nop)
				fork
					pipelineA = 0;
					pipelineB = 0;
					flag = 1;
				join
			else
				fork
					pipelineA = inst[6];
					pipelineB = inst[2];
				join
			end
		end
endmodule

module Hazards(clk, rs1, rs2, rsd, ALU1AHaz, ALU1BHaz, ALU2AHaz, ALU2BHaz, MregAHaz, MregBHaz);
	//-----Hazards signals-----//
  input [4:0] rs1, rs2, rsd;
  input clk;
  output reg ALU1AHaz, ALU1BHaz, MregAHaz, MregBHaz, ALU2AHaz, ALU2BHaz;

  reg [4:0] pipeline, pipeline2, pipeline3;

  initial fork
  	pipeline = 0;
  	pipeline2 = 0;
  	pipeline3 = 0;
  	ALU1AHaz = 0;
  	ALU1BHaz = 0;
  	MregAHaz = 0;
  	MregBHaz = 0;
  	ALU2AHaz = 0;
  	ALU2BHaz = 0;
  join
  
  always @(posedge clk)
  begin
	pipeline3 = pipeline2;
	pipeline2 = pipeline;
	pipeline = rsd;


	fork
		//Alu 1 Data Hazard
			ALU1AHaz = (rs1 == pipeline) & ~(pipeline == 0);
			ALU1BHaz = (rs2 == pipeline) & ~(pipeline == 0);

			//Alu 2 Data Hazard
			ALU2AHaz = (rs1 == pipeline2) & ~(pipeline2 == 0);
			ALU2BHaz = (rs2 == pipeline2) & ~(pipeline2 == 0);

			//Register Data Hazard
			MregAHaz = (rs1 == pipeline3) & ~(pipeline3 == 0);
			MregBHaz = (rs2 == pipeline3) & ~(pipeline3 == 0);
	join
  end
endmodule