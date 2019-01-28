//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: alu.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for Risc V's Alu
//
//	Variables Description:
//	- X: Data to be operated.
//	- Y: Data to be operated.
//	- S: Signal that selects wich operation will be done.
//	- equal: Signal says if the two inputs (X and Y) are equal.
//	- result: Signal wich contains the result of the operation.
//	- unsigned: Signal wich says if the operation must be done with/without signed bits.
//
//	Update History:
//	- 12/29/2018: Creation of the module.
//	- 01/01/2019: Changed module's name, changed the blocking assignation of the variables (Y5, XH, and YH) to unblocking assignation
//								and added a fork-join block for parallelization.
//	- 02/01/2019: Deleted some variables for optimization, added variables and operations descriptions, added an unsigned
//								input signal and modified the module to operate signed and unsigned bits.
//	- 12/01/2019: Captured arithmetic hazard: divide by 0; and removed additional unsigned operations.
//	- 28/01/2019: Registers are now initialized with value 0.
//
//-------------------------------------------------------------------------//
	
module alu(input [31:0] X, Y,
		   input [3:0] S,
		   input un,
		   output reg equal,
		   output [31:0] result);
	
	initial fork
		equal = 0;
		partialResultUnsigned = 0;
		partialResultSigned = 0;
	join

  wire signed [31:0] Xs, Ys;
  reg [31:0] partialResultUnsigned, partialResultSigned;
	assign Xs = X;
	assign Ys = Y;
	always @(X, Y, S, un)
		  begin
			
			fork
				if(X == Y)
					equal = 1'b1;
				else
					equal = 1'b0;
				case (S)
					4'b0000 : partialResultSigned = Xs << Y[4:0];						//sll
					4'b0001 : partialResultSigned = Xs >>> Y[4:0];						//sra
					4'b0010 : partialResultSigned = Xs + Ys;									//add
					4'b0011 : partialResultSigned = Xs & Ys;									//and
					4'b0100 : partialResultSigned = Xs | Ys;									//or
					4'b0101 : partialResultSigned = Xs ^ Ys;									//Xor
					4'b0110 : partialResultSigned = Xs < Ys;									//slt
					4'b0111 : partialResultSigned = Xs * Ys;									//mul
					4'b1000 : partialResultSigned = Xs[31:16] * Ys[31:16];		//mulh
					4'b1001 : 
						if(Ys == 0)
							partialResultSigned = 0;
						else
							partialResultSigned = Xs / Ys;										//div
					4'b1010 : 
						if(Ys == 0)
							partialResultSigned = 0;
						else
							partialResultSigned = Xs % Ys;										//rem
				 	4'b1011 : partialResultSigned = Xs - Ys;									//substract
				endcase

				case (S)
				  4'b0001 : partialResultUnsigned = X >> Y[4:0];						//sra
				  4'b0110 : partialResultUnsigned = X < Y;									//slt
				endcase
			join
			
		  end
  mux32bits_2_to_1 m(partialResultSigned, partialResultUnsigned, un, result);
endmodule

module mux32bits_2_to_1(data1, data2, selector, out);
	input [31:0] data1, data2;
	input selector;
	output reg [31:0] out;

	always @ (data1, data2, selector)
	case (selector)
		1'b0: out = data1;
		1'b1: out = data2;
	endcase
endmodule