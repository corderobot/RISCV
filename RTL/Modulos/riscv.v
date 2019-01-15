//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: riscv.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behavior of a RISC V processor
//
//
//	Update History:
//	- 01/14/2019: Creation of the module
//
//-------------------------------------------------------------------------//

module riscv(clk, reset, fetch_addr, instruction, result);
	input clk, reset;
	output [31:0] fetch_addr, instruction, result;

	memory ram();

endmodule

module memory(fetch, instruction);
	//memoria temporal
	
	input [31:0] fetch;
	output reg [31:0] instruction;

	reg [31:0] temp_memory [0:199]; //capacidad para 50 instrucciones por ahorita

	initial fork	//Assignación de instrucciones, de 4 en 4
		temp_memory[0] = 'h00000000;
	join

	always @ (fetch)
	instruction = temp_memory[fetch];

endmodule

module programCounter(clk, reset, ALUPC, PCMux, fetch_addr);

	input clk, PCMux, reset;
	input [31:0] ALUPC;
	output reg [31:0] fetch_addr;
	
	initial fetch_addr <= 0;

	always @ (reset)
	fetch_addr <= 0;

	always @ (posedge clk)
	fork
		if(PCMux)
			fetch_addr = ALUPC;
		else
			fetch_addr <= fetch_addr + 4;
	join
endmodule

