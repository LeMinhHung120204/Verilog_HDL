// 4-bit ripple carry full adder
module FFA (
	output [3:0] sum,
	output cout,
	input [3:0] a, b, 
	input cin
);
	wire [2:0] c;
	FA f1(.sum(sum[0]), .cout(c[0]), .a(a[0]), .b(b[0]), .cin(cin));
	FA f2(.sum(sum[1]), .cout(c[1]), .a(a[1]), .b(b[1]), .cin(c[0]));
	FA f3(.sum(sum[2]), .cout(c[2]), .a(a[2]), .b(b[2]), .cin(c[1]));
	FA f4(.sum(sum[3]), .cout(cout), .a(a[3]), .b(b[3]), .cin(c[2]));
endmodule

// Full adder 1-bit
module FA(
	output sum, cout,
	input a, b, cin
);
	assign sum = a ^ b ^ cin;
	assign cout = a & b | ((a^b) & cin);
	
endmodule 