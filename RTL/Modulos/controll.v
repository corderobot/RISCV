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
//								writeRegEnable, writeMemEnable, loadEnable, writeBack and pcEnable.
//	- 03/01/2019: Modified the main module (controll), added a submodule description section and 
//								the following submodules: unsignedOperations, loadControll, ALUSel, brControll, Hazards.
//
//	Submodule Description:
//	-	immGenSelector:			The purpose of this submodule is to send a signal that indicates to the
//												Immediate Generator wich type of immediate to generate.
//	-	muxABSelector:			Submodule wich tells to the multiplexor A and B wich data should let it 'pass'.
//	-	writeRegEnable:			The sole purpose of this module is to let values be written on the Register File.
//	-	writeMemEnable:			The sole purpose of this module is to let values be written on the memory.
//	-	loadEnable:					The purpose of this module is to send a signal to another module in
//												charge of inserting 'bubles' (hazard solution of this processor).
//	-	writeBack:					Submodule wich tells the Write Back Multiplexor wich input should pass.
//	-	pcEnable:						Submodule in charge of generating a signal wich tells to the PC multiplexor
//												if the PC input should pass.
//	-	unsignedOperations:	The purpose is to send a signal to the ALU wich tells if the operations should
//												be done with unsigned inputs.
//	-	loadControll:				Submodule wich indicates to the Load Selector Multiplexor wich load should pass.
//	-	ALUSel:							The purpose of this module is to indicate to the ALU wich operation shall be done.
//	-	brControll:					Submodule in charge of sending a signal if the branch was succesfully done or not.
//
//-------------------------------------------------------------------------//

module controll(clk, instruction, );
	//-----Controll Section-----//
	//-----Not final version-----//
	input clk, blt, beq;
	input [31:0] instruction;

	output writeRegEnableSignal, writeMemEnableSignal, loadEnableSignal, pcEnableSignal, unsignedOperationsSignal, nopSignal;
	output [1:0] muxABSelectorSignal, writeBackSignal, loadControllSignal;
	output [4:0] immGenSelectorSignal, aluSelectorSignal;

	wire branchResult;

	immGenSelector 				igs(clk, nopSignal, instruction[6:0], immGenSelectorSignal);
	muxABSelector 				mabs(clk, nopSignal, instruction[6:0], muxABSelectorSignal);
	writeRegEnable 				wre(clk, nopSignal, instruction[6:0], writeRegEnableSignal);
	writeMemEnable 				wme(clk, nopSignal, instruction[6:0], writeMemEnableSignal);
	loadEnable 						le(clk, instruction[6:0], loadEnableSignal);
	writeBack							wb(clk, instruction[6:0], writeBackSignal);
	pcEnable 							pce(clk, nopSignal, branchResult, instruction[6:0], pcEnableSignal);
	unsignedOperations 		uo(clk, nopSignal, instruction);
	loadControll 					lc(instruction, loadControllSignal);
	ALUSel 								as(instruction, aluSelectorSignal);
	brControll 						bc(wBControll, blt, beq, Bres);
	Hazards                             Hazs(clk, rs1, rsd, rs2, ALU1AHaz, ALU1BHaz, MregAHaz, MregBHaz, ALU2AHaz, ALU2BHaz);
	
	//********HAZARDS**************
	input [4:0] rs1, rs2, rsd;
	output reg ALU1AHaz, ALU1BHaz, MregAHaz, MregBHaz, ALU2AHaz, ALU2BHaz;
  	reg [4:0] rd0, rd1, rd2;

	//************* 
	output reg [3:0] ALUSelector;
	output reg BrUnsigned, Bres, nop;
	output reg [1:0] LoadSelector;
	reg [3:0] wALUSelector;
	reg wNop = 1'b0;
	reg wandor, Inst6, Inst2;
	reg [31:0] wBControll;
	reg [1:0] wLoadS, loadControll;
	
	
	//**********

	reg pipelines [0:7];
	always @ (posedge clk)
	fork
		//-----Immediate Generator Selector-----//
		begin
			//*****
			ALUSelector = wALUSelector;
			BrUnsigned = instruction[13];
			if(~wNop)
				begin
					wBControll = instruction;
					wandor = ((instruction[6] & instruction[2]) | (Bres & instruction[6] & ~instruction[2]));
				end
			else if(wNop)
				begin
					wandor = 1'b0;
					wBControll = 32'b0;
					WME1 = 1'b0;
				end
			nop = wandor;
			wNop = wandor;
			LoadSelector = wLoadS;
			wLoadS = loadControll;
			//*****
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

module loadControll(input [31:0] Inst,
										output reg [1:0] loadMux);
	
	always @(Inst)
		case ({Inst[14], Inst[13], Inst[12]})
			3'b000: loadMux = 0;
			3'b001: loadMux = 1;
			3'b010: loadMux = 2;
			default: loadMux = 0;
		endcase
endmodule

module ALUSel(input [31:0] Inst,
							output reg [3:0] ALUSelOut);
	
	reg wiSll, wiSlr, wiAdd, wiAnd1, wiAnd2, wiAnd3, wiAnd4, wiOr, wiXor, wiMul, wiMulh, wiDiv, wiRem, wiSub, wiSlt;
	
	always @(Inst)
			fork
				case (Inst[0] & Inst[1])
					1'b0 : ALUSelOut = 2;
					1'b1 : 
						begin
							wiSll = 1'b0; //Sll
							
							wiSlr = Inst[14] & ~Inst[13] & Inst[12] & Inst[4] & ~Inst[2]; // Slr
						
							wiAdd = (((~Inst[14] & ~Inst[13] & ~Inst[12] & Inst[4]) & ((~Inst[30] & ~Inst[25] & Inst[5] & ~Inst[2]) |  ~Inst[5])) | ~Inst[4]);
						
							wiAnd1 = (Inst[14] & Inst[13] & Inst[12] & Inst[4]);
							wiAnd2 = (Inst[5] & ~Inst[2]);
							wiAnd3 = wiAnd1 | wiAnd2;
							wiAnd4 = wiAnd1 & wiAnd3; //And
						
							 wiOr = ((Inst[14] & Inst[13] & ~Inst[12] & Inst[4] & ((~Inst[25] & Inst[5] & ~Inst[2]) | ~Inst[5]))); // Or
						
							 wiXor = ((Inst[14] & ~Inst[13] & ~Inst[12] & Inst[4] & ((~Inst[25] & Inst[5] & ~Inst[2]) | ~Inst[5]))); // Xor
						
							wiSlt = (~Inst[14] & Inst[13] & Inst[4] & ~Inst[2]); // Slt
						
							wiMul = ((~Inst[14] & ~Inst[13] & ~Inst[12] & Inst[4] & ~Inst[30] & Inst[25] & Inst[5] & ~Inst[2])); // Mul
						
							wiMulh = (~Inst[14] & ~Inst[13] & Inst[12] & Inst[4] & Inst[25] & Inst[5] & ~Inst[2]); // Mulh
						
							wiDiv = ((Inst[14] & ~Inst[13] & ~Inst[12] & Inst[4] & Inst[25] & Inst[5] & ~Inst[2])); // Div
						
							wiRem = ((Inst[14] & Inst[13] & ~Inst[12] & Inst[4] & Inst[25] & Inst[5] & ~Inst[2])); // Rem
						
							wiSub = ((~Inst[14] & ~Inst[13] & ~Inst[12] & Inst[4] & Inst[30] & ~Inst[25] & Inst[5] & ~Inst[2])); // Sub
							
							
							ALUSelOut = wiSll | (wiSlr * 1) | (wiAdd * 2) | (wiAnd4 * 3) | (wiOr * 4) | (wiXor * 5) | (wiMul * 7) |  (wiMulh * 8) | (wiDiv * 9) | (wiRem * 10) | (wiSub * 11) | (wiSlt * 6);
						end
				endcase
			join
endmodule

module brControll(input [31:0] Inst,
									input blt, beq, 
									output reg result);
	
	always @(Inst)
			fork
				case(~Inst[12])
					1'b0:
						begin
							if(~Inst[14])
								result = ~beq;
							else
								result = ~blt;
						end
					1'b1:
							begin
								if(~Inst[14])
									result = beq;
								else
									result = blt;
							end
				endcase
			join
								
endmodule

module Hazards(clk, rs1, rsd, rs2, ALU1AHaz, ALU1BHaz, MregAHaz, MregBHaz, ALU2AHaz, ALU2BHaz);
  input [4:0] rs1, rs2, rsd;
  input clk;
  output reg ALU1AHaz, ALU1BHaz, MregAHaz, MregBHaz, ALU2AHaz, ALU2BHaz;
  reg [4:0] rd0, rd1, rd2;
  always @(posedge clk)
    fork
      begin
        
        rd2 = rd1;
        rd1 = rd0;
        rd0 = rsd;
        
        //ALU Hazard
        ALU1AHaz = 1'b0;
        ALU1BHaz = 1'b0;
        if((rs1 == rd0) & (rd0 != 0))
          ALU1AHaz = 1'b1;
        else if ((rs2 == rd0) & (rd0 != 0))
          ALU1BHaz = 1'b1;
        	
        //Reg Data Hazard
        MregAHaz = 1'b0;
        MregBHaz = 1'b0;
        if((rs1 == rd2) & (rd2 != 0))
          MregAHaz = 1'b1;
        else if ((rs2 == rd2) & (rd2 != 0))
          MregBHaz = 1'b1;
        
        //ALU2 Data Hazard
        ALU2AHaz = 1'b0;
        ALU2BHaz = 1'b0;
        if((rs1 == rd1) & (rd1 != 0))
          ALU2AHaz = 1'b1;
        else if ((rs2 == rd1) & (rd1 != 0))
          ALU2BHaz = 1'b1;
      end
    join
  
endmodule
