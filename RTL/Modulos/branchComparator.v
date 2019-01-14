//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: branchComparator.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for the Branch Comparator of RISC V
//
//	Update History:
//	- 01/05/2019: Creation of the module.
//	- 01/12/2019: Fixed blt's assignment problem.
//
//	Variable Description:
//	- un: signal that indicates if the values must be compared with unsigned values.
//	- rr1: read register 1 input.
//	- rr2: read register 2 input.
//	- beq: Signal that indicates if the values are equal.
//	- blt: Signal that indicates if rr1's input is lower than rr2's input
//
//-------------------------------------------------------------------------//

module brComparator(un, rr1, rr2, beq, blt);
	input un;
	input [31:0] rr1, rr2;
	output reg beq, blt;

	reg signed [31:0] aux1, aux2;

	always @ (un, rr1, rr2)
	begin
		fork
			beq = rr1 == rr2;
			aux1 = rr1;
			aux2 = rr2;
		join
		if(un)
			if(rr1 < rr2)
				blt = 1;
			else
				blt = 0;
		else
			if(aux1 < aux2)
				blt = 1;
			else
				blt = 0;
			end
	end
endmodule