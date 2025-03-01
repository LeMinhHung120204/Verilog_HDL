module add4bit(
	output [3:0] sum,
	output carry_out,
	input carry_in,
	input [3:0] ina, inb
);
	assign {carry_out, sum} = ina + inb + carry_in;
endmodule 