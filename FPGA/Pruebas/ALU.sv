module testALU;
  reg [31:0] X, Y;
  reg [3:0] S;
  wire equal;
  wire [31:0] result;
  
  ALU ALU(X, Y, S, equal, result);
  
  initial 
  	begin
      $dumpfile("out.vcd");
      $dumpvars(1, testALU);
      
      X = 32'b00000000000000000000000000001011;
      Y = 32'b00000000000000000000000000000011;
      S = 11; #25
      S = 0; #25
      S = 1; #25
      S = 2; #25
      X = 9;
      Y = 9; 
    end
  initial 
    #250 $finish;
endmodule
  
