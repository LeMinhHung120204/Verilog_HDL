module mux4_1 (input [3 : 0] IN, input [1 : 0] SEL, output OUT);
	wire [3 : 0] AND_OUT;
	wire [1 : 0] NOT_SEL;
	
	// Cổng not
	not n1(NOT_SEL[0], SEL[0]);
	not n2(NOT_SEL[1], SEL[1]);
	
	// 4 Cổng AND_OUT
	// C1
	/* and a0(AND_OUT[0], IN[0], NOT_SEL[1], NOT_SEL[0]);
	and a1(AND_OUT[1], IN[1], NOT_SEL[1], SEL[0]);
	and a2(AND_OUT[2], IN[2], SEL[1], NOT_SEL[0]);
	and a3(AND_OUT[3], IN[3], SEL[1], SEL[0]); */
	
	// C2 sử dụng array of instance
	and and_gate[3:0] (
		AND_OUT,
		IN,
		{NOT_SEL[1], NOT_SEL[1], SEL[1], SEL[1]},
		{NOT_SEL[0], SEL[0], NOT_SEL[0], SEL[0]}
	);
	
	// Cổng OR
	or or1(OUT, AND_OUT[0], AND_OUT[1], AND_OUT[2], AND_OUT[3]);
endmodule 