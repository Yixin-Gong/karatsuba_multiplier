module karatsuba_mul_4(
    A,B,C
);

parameter m=4;
parameter n=7;
input [m-1:0]A;
input [m-1:0]B;
output [n-1:0]C;

parameter p=m/2;

wire [p-1:0]A_l,A_h,B_l,B_h;
wire [2*p-1:0]C1,C4,C5,C6;
wire [p-1:0]C2,C3;

assign A_l=A[p-1:0];
assign A_h=A[m-1:p];
assign B_l=B[p-1:0];
assign B_h=B[m-1:p];

assign C2=A_h^A_l;
assign C3=B_h^B_l;


karatsuba_mul_2 M1(A_h,B_h,C1);
karatsuba_mul_2 M2(A_l,B_l,C4);
karatsuba_mul_2 M3(C2,C3,C5);

assign C6=C1^C4^C5;

assign C=(C1<<m)^(C6<<p)^C4;

endmodule