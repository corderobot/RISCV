//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: register_file.v
//	Project: FPGA RISC V
//	Description: Verilog module wich describes the behaviour for Risc V's Register File.
//
//	Variables Description:
//	- clk: Main processor's clock.
//	- writeData: Data to be written on a specific register.
//	- writeReg: Signal that selects the register will save the data.
//	- writeEnable: Signal that allows data to be written on a register.
//	- readReg1: Signal that says wich register's data must be retrieved.
//	- readReg2: Signal that says wich register's data must be retrieved.
//	- readData1: Data retrieved from a register (using the readReg1 input).
//	- readData2: Data retrieved from a register (using the readReg2 input).
//
//	Update History:
//	- 01/01/2019: Creation of the module.
//
//------------------------------------------------------------------------//

module register_file(writeData, writeEnable, readReg1, readReg2, writeReg, clk, readData1, readData2);
	input clk, writeEnable;
	input [31:0] writeData;
	input [4:0] readReg1, readReg2, writeReg;

	output [31:0] readData1, readData2;
	reg [31:0] readData1, readData2;

	reg [31:0] register [0:30];
  
  	initial fork
		readData1 = 0;
		readData2 = 0;
		register[0] = 0;
		register[1] = 0;
		register[2] = 0;
		register[3] = 0;
		register[4] = 0;
		register[5] = 0;
		register[6] = 0;
		register[7] = 0;
		register[8] = 0;
		register[9] = 0;
		register[10] = 0;
		register[11] = 0;
		register[12] = 0;
		register[13] = 0;
		register[14] = 0;
		register[15] = 0;
		register[16] = 0;
		register[17] = 0;
		register[18] = 0;
		register[19] = 0;
		register[20] = 0;
		register[21] = 0;
		register[22] = 0;
		register[23] = 0;
		register[24] = 0;
		register[25] = 0;
		register[26] = 0;
		register[27] = 0;
		register[28] = 0;
		register[29] = 0;
		register[30] = 0;
	join

	always @ (posedge clk)
		fork

			//-----Register Write Area-----//
			case ({writeReg, writeEnable})
				6'b000011: register[0] = writeData;
				6'b000101: register[1] = writeData;
				6'b000111: register[2] = writeData;
				6'b001001: register[3] = writeData;
				6'b001011: register[4] = writeData;
				6'b001101: register[5] = writeData;
				6'b001111: register[6] = writeData;
				6'b010001: register[7] = writeData;
				6'b010011: register[8] = writeData;
				6'b010101: register[9] = writeData;
				6'b010111: register[10] = writeData;
				6'b011001: register[11] = writeData;
				6'b011011: register[12] = writeData;
				6'b011101: register[13] = writeData;
				6'b011111: register[14] = writeData;
				6'b100001: register[15] = writeData;
				6'b100011: register[16] = writeData;
				6'b100101: register[17] = writeData;
				6'b100111: register[18] = writeData;
				6'b101001: register[19] = writeData;
				6'b101011: register[20] = writeData;
				6'b101101: register[21] = writeData;
				6'b101111: register[22] = writeData;
				6'b110001: register[23] = writeData;
				6'b110011: register[24] = writeData;
				6'b110101: register[25] = writeData;
				6'b110111: register[26] = writeData;
				6'b111001: register[27] = writeData;
				6'b111011: register[28] = writeData;
				6'b111101: register[29] = writeData;
				6'b111111: register[30] = writeData;
			endcase

			//-----Register Read Area-----//
			case (readReg1)
				0: readData1 = 'h00000000;
				1: readData1 = register[0];
				2: readData1 = register[1];
				3: readData1 = register[2];
				4: readData1 = register[3];
				5: readData1 = register[4];
				6: readData1 = register[5];
				7: readData1 = register[6];
				8: readData1 = register[7];
				9: readData1 = register[8];
				10: readData1 = register[9];
				11: readData1 = register[10];
				12: readData1 = register[11];
				13: readData1 = register[12];
				14: readData1 = register[13];
				15: readData1 = register[14];
				16: readData1 = register[15];
				17: readData1 = register[16];
				18: readData1 = register[17];
				19: readData1 = register[18];
				20: readData1 = register[19];
				21: readData1 = register[20];
				22: readData1 = register[21];
				23: readData1 = register[22];
				24: readData1 = register[23];
				25: readData1 = register[24];
				26: readData1 = register[25];
				27: readData1 = register[26];
				28: readData1 = register[27];
				29: readData1 = register[28];
				30: readData1 = register[29];
				31: readData1 = register[30];
			endcase

			case (readReg2)
				0: readData2 = 'h00000000;
				1: readData2 = register[0];
				2: readData2 = register[1];
				3: readData2 = register[2];
				4: readData2 = register[3];
				5: readData2 = register[4];
				6: readData2 = register[5];
				7: readData2 = register[6];
				8: readData2 = register[7];
				9: readData2 = register[8];
				10: readData2 = register[9];
				11: readData2 = register[10];
				12: readData2 = register[11];
				13: readData2 = register[12];
				14: readData2 = register[13];
				15: readData2 = register[14];
				16: readData2 = register[15];
				17: readData2 = register[16];
				18: readData2 = register[17];
				19: readData2 = register[18];
				20: readData2 = register[19];
				21: readData2 = register[20];
				22: readData2 = register[21];
				23: readData2 = register[22];
				24: readData2 = register[23];
				25: readData2 = register[24];
				26: readData2 = register[25];
				27: readData2 = register[26];
				28: readData2 = register[27];
				29: readData2 = register[28];
				30: readData2 = register[29];
				31: readData2 = register[30];
			endcase
		join
endmodule
