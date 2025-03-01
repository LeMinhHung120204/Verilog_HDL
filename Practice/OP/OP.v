module OP (
    input [3:0] a,
    input [3:0] b,
    output [4:0] sum
);
    assign sum = a + b;
endmodule

module arithemetic_operators();
	initial begin
		$display ("5 + 10 = %d", 5 + 10);
	end
endmodule

//bitwise
module xor3(input a, b, c, output y);
	assign y = a ^ b ^ c;
endmodule 

// Concatenation
module add_1bit(input a, b, ci, output s, co);
	assign #(3, 4) {co, s} = {(a & b) | (b & ci) | (a & ci), a ^ b ^ ci}; 
endmodule 

// Condition
module quad_mux2_1(
	input [3:0] i0, i1, 
	input s,
	output [3:0] y
);
	assign y = s ? i1 : i0;
endmodule 

// Relation & Equality operator 
module comp_4bit(
	input [3:0] a, b,
	output a_gt_b, a_eq_b, a_lt_b
);
	assign a_gt_b = (a > b),
			a_eq_b = (a == b),
			a_lt_b = (a < b);
endmodule 

// Arithmetic
module add_4bit(
	input [3:0] a, b,
	input ci,
	output [3:0] s, 
	output co
);
	assign {co, s} = a + b + ci;
endmodule 

// Mux 4 to 1

module mux4_1(
	input in1, in2, in3, in4, cntrl1, cntrl2,
	output out
);
	/*assign out = 	(in1 & ~cntrl1 & ~cntrl2) |
						(in2 & ~cntrl1 & cntrl2) |
						(in3 & cntrl1 & ~cntrl2) |
						(in4 & cntrl1 & cntrl2);*/					
	// Use nested conditional operator
	assign out = cntrl1 ? (cntrl2 ? in4 : in3) : (cntrl2 ? in2 : in1);
endmodule 

/*module mux4_1(
	input in1, in2, in3, in4, 
	input [1:0] cntrl,
	output out
);
	assign out = (cntrl == 2'b00) ? in1: 
						(cntrl == 2'b01) ? in2: 
						(cntrl == 2'b10) ? in3: 
						(cntrl == 2'b11) ? in4:
						1'bx;
endmodule*/


// Combinational circuit
module fa(
	input a, b, cin, 
	output s, cout
);
	assign s = a ^ b ^ cin,
	cout = (a & b) | (cin & (a^b));
endmodule 

// adder 8bit
module adder(
	input [7:0] a, b,
	output [7:0] s,
	output cout
);
	assign {cout, s} = a + b;
endmodule 

// comparator 
module comparator(result, A, B, greaterNotLess);
	parameter width = 8;
	parameter delay = 1;
	
	input [width - 1 : 0] A, B;	//comparand
	input greaterNotLess;			//1 - greater, 0 - less than
	output result;
	
	assign #1 result = greaterNotLess ? (A > B) : (A < B);
endmodule 

// 4-bit ripple carry counter
module edge_dff(q, qbar, d, clk, clear);

	input d, clk, clear;
	output q, qbar;
	
	// internal variables
	wire s, sbar, r, rbar, cbar;
	assign cbar = ~clear;
	
	// input latch; A latch is level sensitive. An edge-sensitive
	// flip-flop is implemented by using 3 SR latch.
	assign 	sbar = ~(rbar & s),
				s = ~(sbar & cbar & ~clk),
				r = ~(rbar & ~clk & s),
				rbar = ~(r & cbar & d);
	
	// output latch
	assign 	q = ~(s & qbar),
				qbar = ~(q & r & cbar);
endmodule 

module T_FF(q, clk, clear);
	input clk, clear;
	output q;
	
	// Instantiate the edge_triggered DFF
	// Complement of output q is fed back.
	// Notice qbar not needed. Unconnected port
	edge_dff ff1(q, ~q, clk, clear);
	
endmodule 

//ripple counter 
module counter (Q, clock, clear);

	output [3:0] Q;
	input clock, clear;
	
	// Instantiate the T flipflops
	T_FF tff0(Q[0], clock, clear);
	T_FF tff1(Q[1], clock, clear);
	T_FF tff2(Q[2], clock, clear);
	T_FF tff3(Q[3], clock, clear);
	
endmodule 