//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: programCounter.v
//	Project: FPGA RISC V
//	Description: Verilog module wich describes the behaviour for Risc V's Program Counter.
//
//	Variables Description:
//	- clk: Main processor's clock.
//	- in: Current instruction address.
//	- fetch_addr: Current instruction address.
//	- PCOut4: Added 4 to current instruction address.
//
//	Update History:
//	- 01/01/2019: Creation of the module.
//
//------------------------------------------------------------------------//

module programCounter(input clk,
                      input[31:0] in, 
                      output reg [31:0] fetch_addr, PCOut4);

	always @ (posedge clk)
		fork
      fetch_addr <= in;
      PCOut4 <= 4 + in;
		join
endmodule
