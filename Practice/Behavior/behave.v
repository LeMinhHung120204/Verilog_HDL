// Variable and Net can be initialized when they are declared
module behave(sum, co ,a, b, ci);
	output reg [7:0] sum = 0;	//Initialize 8 bit output sum
	output reg co = 0;			//Initialize 1 bit output co
	input [7:0] a, b;
	input ci;
endmodule 

// Always
module clock_gen(output reg clock);
// Initialize clock at time zero 
	initial
		clock = 1'b0;		// clock được khởi tạo bằng 0 ngay khi mô phỏng bắt đầu.
	always
		#10 clock = ~clock;	// Cứ sau 10 đơn vị thời gian (#10), tín hiệu clock sẽ đảo trạng thái (~clock).
	initial
		#1000 $finish;		// Sau 1000 đơn vị thời gian, mô phỏng sẽ dừng lại ($finish).
endmodule


