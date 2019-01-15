//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: hazardMux.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behavior for Risc V's Hazard multiplexors
//
//
//	Update History:
//	- 01/14/2019: Creation of the module
//
//-------------------------------------------------------------------------//

module hazardMux(clk, nop, rr1, rr2, regHaz, dataHaz1, dataHaz2, LUI, imm, RAhz, RBhz, ALU2Ahz, ALU2Bhz, ALU1Ahz, ALU1Bhz, luiHaz1, luiHaz2, mulA, mulB, R1, R2, X, Y);

	input [31:0] rr1, rr2, regHaz, LUI, imm, dataHaz1, dataHaz2, PC;
	input RAhz, RBhz, ALU2Ahz, ALU2Bhz, ALU1Ahz, ALU1Bhz, luiHaz1, luiHaz2, clk, nop, mulA, mulB;
	output reg [31:0] dataA, dataB;
	wire [31:0] auxA, auxB;
	output [31:0] R1, R2, X, Y;

	hazardsMux hsm(rr1, rr2, regHaz, dataHaz1, dataHaz2, LUI, imm, RAhz, RBhz, ALU2Ahz, ALU2Bhz, ALU1Ahz, ALU1Bhz, luiHaz1, luiHaz2, auxA, auxB);
	hazardMuxPipeline hmp(clk, nop, auxA, auxB, R1, R2);
	aluMux am(R1, R2, PC, imm, mulA, mulB, X, Y);

endmodule

module hazardsMux(rr1, rr2, regHaz, dataHaz1, dataHaz2, LUI, imm, RAhz, RBhz, ALU2Ahz, ALU2Bhz, ALU1Ahz, ALU1Bhz, luiHaz1, luiHaz2, dataA, dataB);

	input [31:0] rr1, rr2, regHaz, LUI, imm, dataHaz1, dataHaz2;
	input RAhz, RBhz, ALU2Ahz, ALU2Bhz, ALU1Ahz, ALU1Bhz, luiHaz1, luiHaz2;
	output reg [31:0] dataA, dataB;

	always @ (rr1, rr2, regHaz, dataHaz1, dataHaz2, LUI, imm, RAhz, RBhz, ALU2Ahz, ALU2Bhz, ALU1Ahz, ALU1Bhz, luiHaz1, luiHaz2)
	fork
		case({RAhz, luiHaz2, ALU2Ahz, luiHaz1, ALU1Ahz})	//Data A case
			5'b00000: dataA = rr1;
			5'b00001: dataA = dataHaz1;
			5'b00010: dataA = rr1;
			5'b00011: dataA = imm;

			5'b00100: dataA = dataHaz2;
			5'b00101: dataA = dataHaz1;
			5'b00110: dataA = dataHaz2;
			5'b00111: dataA = imm;

			5'b01000: dataA = rr1;
			5'b01001: dataA = dataHaz1;
			5'b01010: dataA = rr1;
			5'b01011: dataA = imm;
			5'b01100: dataA = LUI;
			5'b01101: dataA = dataHaz1;
			5'b01110: dataA = LUI;
			5'b01111: dataA = imm;

			5'b10000: dataA = regHaz;
			5'b10001: dataA = dataHaz1;
			5'b10010: dataA = regHaz;
			5'b10011: dataA = imm;
			5'b10100: dataA = dataHaz2;
			5'b10101: dataA = dataHaz1;
			5'b10110: dataA = dataHaz2;
			5'b10111: dataA = imm;
			5'b11000: dataA = regHaz;
			5'b11001: dataA = dataHaz1;
			5'b11010: dataA = regHaz;
			5'b11011: dataA = imm;
			5'b11100: dataA = LUI;
			5'b11101: dataA = dataHaz1;
			5'b11110: dataA = LUI;
			5'b11111: dataA = imm;
		endcase

		case({RBhz, luiHaz2, ALU2Bhz, luiHaz1, ALU1Bhz})	//Data B case
			5'b00000: dataB = rr2;
			5'b00001: dataB = dataHaz1;
			5'b00010: dataB = rr2;
			5'b00011: dataB = imm;

			5'b00100: dataB = dataHaz2;
			5'b00101: dataB = dataHaz1;
			5'b00110: dataB = dataHaz2;
			5'b00111: dataB = imm;

			5'b01000: dataB = rr2;
			5'b01001: dataB = dataHaz1;
			5'b01010: dataB = rr2;
			5'b01011: dataB = imm;
			5'b01100: dataB = LUI;
			5'b01101: dataB = dataHaz1;
			5'b01110: dataB = LUI;
			5'b01111: dataB = imm;

			5'b10000: dataB = regHaz;
			5'b10001: dataB = dataHaz1;
			5'b10010: dataB = regHaz;
			5'b10011: dataB = imm;
			5'b10100: dataB = dataHaz2;
			5'b10101: dataB = dataHaz1;
			5'b10110: dataB = dataHaz2;
			5'b10111: dataB = imm;
			5'b11000: dataB = regHaz;
			5'b11001: dataB = dataHaz1;
			5'b11010: dataB = regHaz;
			5'b11011: dataB = imm;
			5'b11100: dataB = LUI;
			5'b11101: dataB = dataHaz1;
			5'b11110: dataB = LUI;
			5'b11111: dataB = imm;
		endcase
	join
endmodule

module hazardMuxPipeline(clk, nop, dataA, dataB, dA, dB);
	input clk, nop;
	input [31:0] dataA, dataB;
	output reg [31:0] dA, dB;

	reg flag;

	initial flag = 0;

	always @ (posedge clk)
	if(flag)
		flag = 0;
	else
		if(nop)
			fork
				flag = 1;
				dA = 0;
				dB = 0;
			join
		else
			fork
				dA = dataA;
				dB = dataB;
			join
endmodule

module aluMux(rr1, rr2, PC, imm, mulA, mulB, dataA, dataB);

	input [31:0] rr1, rr2, PC, imm;
	input mulA, mulB;
	output reg [31:0] dataA, dataB;

	always @ (rr1, rr2, PC, imm, mulA, mulB)
	case({mulA, mulB})
		0:
			fork
				dataA = rr1;
				dataB = rr2;
			join
		1:
			fork
				dataA = rr1;
				dataB = imm;
			join
		2:
			fork
				dataA = PC;
				dataB = rr2;
			join
		3:
			fork
				dataA = PC;
				dataB = imm;
			join
	endcase
endmodule