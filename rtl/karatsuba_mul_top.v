module karatsuba_mul_top(
	input 	    [31:0] A,
	input 	    [31:0] B,
	output	    [63:0] C
);

karatsuba_mul_32 dut(
	.A			(A),
    .B			(B),
    .C			(C)
);

endmodule

