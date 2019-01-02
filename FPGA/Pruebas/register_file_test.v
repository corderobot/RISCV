//---------------------------Galileo University---------------------------//
//  Main Collaborators:
//  - Rodrigo Cordero
//  - Kevin Hernandez
//
//  Module Name: register_file_test.v
//  Project: FPGA RISC V
//  Description: Verilog module wich stimulates the behaviour for Risc V's Register File.
//
//  Variables Description:
//  - clk: Main processor's clock.
//  - wd: Data to be written on a specific register.
//  - wr: Signal that selects the register will save the data.
//  - we: Signal that allows data to be written on a register.
//  - rr1: Signal that says wich register's data must be retrieved.
//  - rr2: Signal that says wich register's data must be retrieved.
//  - rs1: Data retrieved from a register (using the readReg1 input).
//  - rs2: Data retrieved from a register (using the readReg2 input).
//
//  Update History:
//  - 01/01/2019: Creation of the module.
//
//------------------------------------------------------------------------//

`timescale 1ns/100ps

module test();
	reg clk, we;
  reg [31:0] wd;
  reg [4:0] rr1, rr2, wr;
  wire [31:0] rs1, rs2;
  
  register_file rf(wd, we, rr1, rr2, wr, clk, rs1, rs2);
  
  initial clk = 1'b1;
  always #5 clk = ~clk;
  
  initial begin
    //For EPWave analysis on EDA playground
    //$dumpfile("out.vcd");
  	//$dumpvars(1, test);

    #10 we <= 1; wd <= 'h01234567; rr1 <= 5'b00000; rr2 <= 5'b00010; wr <= 5'b00101; 
     $display("x0 = %h, x2 = %h", rs1, rs2);
    #10 we <= 0; wd <= 'h01234588; rr1 <= 5'b00101; rr2 <= 5'b00111; wr <= 5'b00100;
     $display("x5 = %h, x7 = %h", rs1, rs2);
    #10 we <= 1; wd <= 'h88884444; rr1 <= 5'b00101; rr2 <= 5'b01111; wr <= 5'b00111;
     $display("x5 = %h, x7 = %h", rs1, rs2);
    #10 we <= 1; wd <= 'h88884443; rr1 <= 5'b00101; rr2 <= 5'b00111; wr <= 5'b00111;
     $display("x5 = %h, x7 = %h", rs1, rs2);
    
  end
  
  initial #250 $finish;
  
endmodule