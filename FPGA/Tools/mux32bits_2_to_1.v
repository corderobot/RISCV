//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: mux32bits_2_to_1.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for a multiplexor of 32 bits, 2 to 1.
//
//	Variables Description:
//	- data1: input 1.
//	- data2: input 2.
//	- selector: Signal that selects the input.
//	- out: Signal that contains the input of the selected input.
//
//	Update History:
//	- 01/02/2018: Creation of the module.
//
//-------------------------------------------------------------------------//

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