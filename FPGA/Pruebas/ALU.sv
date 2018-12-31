module ALU(input [31:0] X, Y,
           input [3:0] S,
           output reg equal,
           output reg [31:0] result);
  
  reg [4:0] Y5;
  always @(X, Y, S)
    begin
      assign Y5 = Y;
      if(X == Y)
        equal = 1'b1;
      else
        equal = 1'b0;
      case (S)
        4'b0000 : result = X << Y5;
        4'b0001 : result = X >> Y5;
        4'b0010 : result = X + Y;
        4'b0011 : result = X & Y;
        4'b0100 : result = X | Y;
        4'b0101 : result = X ^ Y;
        4'b0110 : result = X < Y;
        4'b0111 : result = X * Y;
        4'b1000 : result = X[31:16] * Y[31:16];
        4'b1001 : result = X / Y;
        4'b1010 : result = X % Y;
        4'b1011 : result = X - Y;
      endcase
    end
endmodule
