module my_testbench ();
	
	reg [31:0] pc;
	wire [31:0] instruction;
	
	
	instruction_block instruction_block (instruction, pc);
	
	
	initial begin
	
	#10 pc= 32'd0;
	
	#2 $display ("read_data = %b" , instruction);
	
	
	
	#10 pc= 32'd5;
	
	#2 $display ("read_data = %b" , instruction);


	end
	
endmodule


