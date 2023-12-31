module karatsuba_mul_32(  
	A, B, C
);

parameter m=32;
parameter n=64;
input [m-1:0] A;
input [m-1:0] B;
output[n-1:0] C;

wire [m/2-1:0] A0, A1;
wire [m/2-1:0] B0, B1;
wire [m-1:0] P0, P1, P2, P3;

assign A0 = A[m/2-1:0];
assign A1 = A[m-1:m/2];
assign B0 = B[m/2-1:0];
assign B1 = B[m-1:m/2];

karatsuba_mul_16  M1 (.A(A0), .B(B0), .C(P0));
karatsuba_mul_16  M2 (.A(A1), .B(B0), .C(P1));//结果需移16位
karatsuba_mul_16  M3 (.A(A0), .B(B1), .C(P2));//结果需移16位
karatsuba_mul_16  M4 (.A(A1), .B(B1), .C(P3));//结果需移32位

wire [n-1:0] th,tl,t1,t3;
assign t1=P1<<16;
assign t3=P3<<16;
wire [n-1:0]th_shift = th << 16;
wire coin1,coin2,coin3;

add_64 ADD0 (.a({32'b0,P0}), .b(t1), .sum(tl),  .in(1'b0), .coin(coin1));
add_64 ADD1 (.a({32'b0,P2}), .b(t3), .sum(th),  .in(1'b0), .coin(coin2));
add_64 ADD2 (.a(th_shift), .b(tl), .sum(C),   .in(1'b0), .coin(coin3));

endmodule

