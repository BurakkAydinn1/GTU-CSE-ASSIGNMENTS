module my_testbench ();

	reg[4:0] read_1;
	reg[4:0] read_2;
	reg[4:0] write_reg;
	
	reg[31:0] write_data;
	reg regWrite;
	
	
	wire [31:0] result_1;
	wire [31:0] result_2;

	register_block test(result_1, result_2, write_data, read_1, read_2, write_reg, regWrite);
	
	initial begin
	#5 regWrite = 1'b1;  read_1 = 5'd9; read_2 = 5'd11; write_data = 32'd1025; write_reg = 5'd10;
	#5 $display ("1.ref = %b (%d) ", result_1,result_1);
	#5 $display ("1.ref = %b (%d) ", result_2,result_2);
		
	end
endmodule 

