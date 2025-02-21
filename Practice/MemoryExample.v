module MemoryExample #(parameter WIDTH = 8, DEPTH = 256) (
	input clk,
	input [WIDTH - 1 : 0] data_in,
	input [7 : 0] address, 
	output reg [WIDTH - 1 : 0] data_out
);
	reg [WIDTH - 1 : 0] RAM [0 : DEPTH - 1]; // Khai báo bộ nhớ RAM 
	
	always @(posedge clk) begin
		RAM[address] <= data_in;	// Ghi dữ liệu vào bộ nhớ
		data_out <= RAM[address];	// Đọc dữ liệu từ bộ nhớ
	end
endmodule 