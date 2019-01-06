//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: immGenerator.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behavior for Risc V's ImmGenerator
//
//
//	Update History:
//	- 01/02/2019: Creation of the module.
//  - 01/05/2019: Added pipeline, added the clk and nop inputs and a variable description section
//
//	Variable Description:
//	- clk: Processor's main clock.
//	- nop: Signal that indicates if the content of the pipeline register must be deleted.
//	- Inst: Instruction to be executed.
//	- S: Signal that indicates if an S type immediate should be generated.
//	- SB: Signal that indicates if an SB type immediate should be generated.
//	- U: Signal that indicates if an U type immediate should be generated.
//	- UJ: Signal that indicates if an UJ type immediate should be generated.
//	- immGenerated: Immediate generated.
//
//-------------------------------------------------------------------------//
	
module immGenerator(clk, nop, Inst, S, SB, U, UJ, immGenerated);
	input [24:0] Inst;
	input ILoad, S, SB, U, UJ, clk, nop;
	output reg [31:0] immGenerated;

	reg [24:0] pipeline;

	always @ (posedge clk)
	begin
		fork
			if(ILoad)
				fork
					immGenerated[11:0] <= pipeline[24:13];
					immGenerated[31:12] <= {20{pipeline[24]}};
				join
			else if(S)
				fork
					immGenerated[4:0] <= pipeline[4:0];
					immGenerated[11:5] <= pipeline[24:18];
					immGenerated[31:12] <= {20{pipeline[24]}};
				join
			else if(SB)
				fork
					immGenerated[4:1] <= pipeline[4:1];
					immGenerated[10:5] <= pipeline[23:18];
					immGenerated[11] <= pipeline[0];
					immGenerated[12] <= pipeline[24];
					immGenerated[31:13] <= {19{pipeline[24]}};
					immGenerated[0] <= 1'b0;
				join
			else if(U)
				fork
					immGenerated[31:12] <= pipeline[24:5];
					immGenerated[11:0] <= {12{1'b0}};
					immGenerated = immGenerated << 'h0c;
				join
			else if (UJ)
				fork
					immGenerated[0] = 1'b0;
					immGenerated[10:1] <= pipeline[23:14];
					immGenerated[11] <= pipeline[13];
					immGenerated[19:12] <= pipeline[12:5];
					immGenerated[20] <= pipeline[24];
					immGenerated[31:21] <= {10{pipeline[24]}};
				join
		join

		if(nop)
			pipeline = 0;
		else
			pipeline = Inst;
	end
endmodule