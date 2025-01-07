module my_testbench ();
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;
	wire [3:0] sum;
	wire c_out;
	
	full_adder_4bit fa1 (sum, c_out, a, b, c_in);
	
	initial begin
		#0 a = 0; b = 0; c_in= 0;
		#5 $display ("time: %0t, %d + %d (c_in = %d)=> sum = %d, carry_out = %d", $time, a, b, c_in, sum, c_out);
		#5 a = 4; b = 5; c_in= 1;
		#5 $display ("time: %0t, %d + %d (c_in = %d)=> sum = %d, carry_out = %d", $time, a, b, c_in, sum, c_out);
		#5 a = 10; b = 6; c_in = 0;
		#5 $display ("time: %0t, %d + %d (c_in = %d)=> sum = %d, carry_out = %d", $time, a, b, c_in, sum, c_out);
		#5 a = 10; b = 6; c_in = 1; // sum: 0001 c_out: 1
		#5 $display ("time: %0t, %d + %d (c_in = %d)=> sum = %d, carry_out = %d", $time, a, b, c_in, sum, c_out);
	end
	
endmodule 
	