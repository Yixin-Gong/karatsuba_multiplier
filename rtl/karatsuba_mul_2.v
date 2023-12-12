module karatsuba_mul_2(
    A, B, C
);

parameter m=2;
parameter n=3;
input [m-1:0]A;
input [m-1:0]B;
output [n-1:0]C;


assign C[0]=A[0]&B[0];
assign C[2]=A[1]&B[1];
assign C[1]=((A[1]^A[0])&(B[1]^B[0]))^(C[0])^(C[2]);   //(A[1]*B[0])^(A[0]*B[1]);

endmodule