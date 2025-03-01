module  edge_dff (
	output reg q,
	input d, clk, clear, enable
);
	always @(posedge clk or posedge clear)
		if (clear)
			q <= 0;
		else if (enable)
			q <= d;
endmodule 

// register 1x4;
module register (
	output [3:0] dataOut,
	input [3:0] dataIn,
	input enable, clk, clear
);
	edge_dff e_dff0 (dataOut[0], dataIn[0], clk, clear, enable);
	edge_dff e_dff1 (dataOut[1], dataIn[1], clk, clear, enable);
	edge_dff e_dff2 (dataOut[2], dataIn[2], clk, clear, enable);
	edge_dff e_dff3 (dataOut[3], dataIn[3], clk, clear, enable);
endmodule 
