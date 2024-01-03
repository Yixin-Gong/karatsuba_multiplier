module add_8(
    input [7:0] a,
    input [7:0] b,
    input		in,    
	output reg 		 coin,
	output reg [7:0] sum
);

parameter m=8;

wire [m/2-1:0] Al;
wire [m-1:m/2] Ah;
wire [m/2-1:0] Bl;
wire [m-1:m/2] Bh;

assign Al=a[m/2-1:0];
assign Ah=a[m-1:m/2];
assign Bl=b[m/2-1:0];
assign Bh=b[m-1:m/2];

wire [m/2-1:0] suml;
wire [m/2-1:0] sumh;
wire 		   coinl;
wire 		   coinh;


add_4	dutl(.a(Al), .b(Bl), .sum(suml), .in(in),     .coin(coinl));
add_4	duth(.a(Ah), .b(Bh), .sum(sumh), .in(coinl),  .coin(coinh));

always @(*) begin
	sum ={sumh,suml};
	coin =coinh;
end

endmodule