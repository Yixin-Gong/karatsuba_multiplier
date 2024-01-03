`timescale 1ns/1ps
module karatsuba_mul_tb;

parameter m=32;
parameter n=64;
reg [m-1:0] A;
reg [m-1:0] B;
wire [n-1:0] C;

karatsuba_mul_top dut(
	.A			(A),
    .B			(B),
    .C			(C)
);

initial begin
	 #50
    B = 32'b10111011_11011011_10000011_11011011;
    A = 32'b11011011_10010011_10111011_11011011;
    #50
    B = 32'b10000011_11011011_00000011_11011011;
    A = 32'b10010011_10010011_10111011_11011011;
	 #50
    B = 32'b11111011_11011011_11011011_00000011;
    A = 32'b11010011_10010011_10010011_10111011;
    $finish;// 结束仿真
end

endmodule