module my_testbench ();
	
	wire [31:0] shift;
	
	reg [31:0] in;
	
	shift_left_2 test(shift, in);
	
	initial begin
	
	#10 in = 32'b 001100011001010010010010010010011 ;
	
	#2 $display ("shift = %b" , shift);
	#2 $display ("input = %b" , in);
	
	
	
	

	
	end
	
endmodule


//module shift_left_2 ( 
//output [31:0] shifted_address, 
//input [31:0] address
//
//); 


