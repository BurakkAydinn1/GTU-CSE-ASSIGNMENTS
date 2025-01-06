module my_testbench ();
	
	reg clock;
	
	mips test(clock);
	
	
	initial begin
	
	#10 clock = 1'b1;
	

	
	#10 clock = 1'b0;
	
	

	end
	
endmodule


