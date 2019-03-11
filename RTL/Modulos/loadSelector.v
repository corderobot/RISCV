//---------------------------Galileo University---------------------------//
//	Main Collaborators:
//	- Rodrigo Cordero
//	- Kevin Hernandez
//
//	Module Name: loadSelector.v
//	Project: FPGA RISC V
//	Description: Verilog module which describes the behaviour for Risc V's Load Selector
//
//
//	Update History:
//	- 01/02/2019: Creation of the module.
//
//-------------------------------------------------------------------------//
	
module loadSelector(input [31:0] MemData,
                    input [1:0] LoadSelector,
                    output reg [31:0] Data);
  	
  initial Data = 0;
  
  always @(MemData, LoadSelector)
    fork
      case(LoadSelector)
        2'b00 : begin
          Data[7:0] <= MemData[7:0];
          Data[31:8] <= {23{MemData[7]}};
        end
        2'b01 : begin
          Data[15:0] <= MemData[15:0];
          Data[31:16] <= {15{MemData[15]}};
        end
        2'b10: Data <= MemData;
      endcase
    join
endmodule
