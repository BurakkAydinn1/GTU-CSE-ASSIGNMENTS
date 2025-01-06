module my_testbench ();
	reg [31:0] content;
	reg [4:0] address;
	memory_operations m1 (content, address);
	initial begin
		#5 address = 0; content  = 32'b11110000000000000011000000000000;
		#5 address = 31; content = 32'b11111111111111111111111111111111;
	end
endmodule 