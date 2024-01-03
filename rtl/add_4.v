module add_4(
   input [3:0] 		a,
   input [3:0] 		b,
   input				in,//进位输入    
   output reg 		 	coin,//进位输出
	output reg [3:0] 	sum
);

reg [4:0] carry;

always @(*) begin
    carry[0] = in; // 初始化进位
//	carry[0] =1'b0;
    sum[0] = a[0] ^ b[0] ^ carry[0]; // 计算第0位的和
    carry[1] = (a[0] & b[0]) | (a[0] & carry[0]) | (b[0] & carry[0]); // 更新第1位的进位
    sum[1] = a[1] ^ b[1] ^ carry[1]; // 计算第1位的和
    carry[2] = (a[1] & b[1]) | (a[1] & carry[1]) | (b[1] & carry[1]); // 更新第2位的进位
    sum[2] = a[2] ^ b[2] ^ carry[2]; // 计算第2位的和
    carry[3] = (a[2] & b[2]) | (a[2] & carry[2]) | (b[2] & carry[2]); // 更新第3位的进位
    sum[3] = a[3] ^ b[3] ^ carry[3]; // 计算第3位的和
    carry[4] = (a[3] & b[3]) | (a[3] & carry[3]) | (b[3] & carry[3]); // 更新第4位的进位
	coin =carry[4];
end

endmodule


