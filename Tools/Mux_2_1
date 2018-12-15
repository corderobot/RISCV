module Mux_2_1(I0, I1, A, Y);
	input I0, I1, A;
	output Y;
	wire I0A, AN, ANI1;
	nand (I0A, I0, A);
	nand (AN, A, A);
	nand (ANI1, AN, I1);
	nand (Y, I0A, ANI1);
endmodule
