module karatsuba_mul_top(
	input		clk,
	input		rst_n,
	input 	    [31:0] A,
	input 	    [31:0] B,
	output	    [63:0] C
);

reg [31:0] a,b;

karatsuba_mul_32 dut(
	.A			(a),
    .B			(b),
    .C			(C)
);

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n) begin
	a <= 32'b00000000_00000000_00000000_00000000;
	b <= 32'b00000000_00000000_00000000_00000000;
	end
	else begin
	a <= A;
	b <= B;
	end	
end


endmodule

