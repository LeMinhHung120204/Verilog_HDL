module D_FF(q, d, clk, reset);
	output reg q; // Biến q cần được khai báo kiểu reg vì được gán trong always
	input d, clk, reset;
	
	always @(posedge clk or posedge reset)
		begin
			if (reset)	// Khi reset = 1, q được đặt về 0
				q <= 1'b0;
			else 	// Nếu không, q nhận giá trị của d tại cạnh lên của clk
				q <= d;
		end
endmodule

module T_FF(q, clk, reset);
	output q;
	input clk, reset;
	wire d;
	D_FF dffo(q, d, clk, reset);
	not n1(d, q);
endmodule

module ripper_carry_couter(q, clk, reset);
	output [3:0] q;
	input clk, reset;
	// 4 instance of the module T_FF are created
	T_FF tffo(q[0], clk, reset);
	T_FF tff1(q[1],q[0], reset); 
	T_FF tff2(q[2],q[1], reset); 
	T_FF tff3(q[3],q[2], reset); 
endmodule
