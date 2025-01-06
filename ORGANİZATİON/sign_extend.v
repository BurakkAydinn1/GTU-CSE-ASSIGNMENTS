module my_testbench ();

	reg [15:0] imm;

	wire[31:0] result;

	sign_extend test(result,imm);
	
	initial begin
	#5 imm = 16'd35;
	#5 $display ("result = %b (%d) ", result, result);
		
	end
endmodule 
