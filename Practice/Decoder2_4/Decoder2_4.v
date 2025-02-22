module Decoder2_4(
	output [3:0] y, 
	input [1:0] s
);
	wire [1:0] s1;
	not n1(s1[0], s[0]);
	not n2(s1[1], s[1]);
	
	and and_gate [3:0] (
		y,
		{s1[0], s1[0], s1[0], s[0]},
		{s1[1], s1[1], s[1], s[1]}
	);
endmodule