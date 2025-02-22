module Test_udp(output x, input y);
endmodule

primitive my_nand (out, a, b);  
    output out;  
    input a, b;  

    table  
        // a  b  :  out  
         0  0  :  1;  
         0  1  :  1;  
         1  0  :  1;  
         1  1  :  0;  
    endtable  
endprimitive 

primitive my_latch (q, clk, d); // Level-sensitive sequential UDPs
	output q; reg q;
	input clk, d;
	
	table
	// clk d q q+
	0 1 : ? : 1;
	0 0 : ? : 0;
	1 ? : ? : -; // -= no change
	endtable
endprimitive 

primitive my_dff(q, clk, d); //  Edge-sensitive sequential UDPs
	output q; reg q;
	input clk, d;
	
	table
	// obtain output on rising edge of clock
	// clock data q q+
	(01) 0 : ? : 0 ;
	(01) 1 : ? : 1 ;
	(0?)  1 : 1 : 1 ;
	(0?)  0 : 0 : 0 ;
	// ignore negative edge of clock
	(?0) ? : ? : -;
	 ?   ? : ? : -; // -= no change
	endtable
endprimitive
