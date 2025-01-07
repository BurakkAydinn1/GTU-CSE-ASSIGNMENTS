module my_testbench ();

	reg [5:0] func_code;
	reg [2:0] ALU_op;
	wire [2:0] ALU_ctr;
	
	alu_control alu_control(ALU_ctr, func_code, ALU_op);
	
	
	initial begin
	
	#10 ALU_op= 3'b000; func_code = 6'b000010;
	
	#2 $display ("add = %b" , ALU_ctr);
	
	
	#10 ALU_op= 3'b001; func_code = 6'b000011;
	
	#2 $display ("substract = %b" , ALU_ctr);

	
	#10 ALU_op= 3'b100; func_code = 6'b000100;
	
	#2 $display ("and = %b" , ALU_ctr);
	
	
	#10 ALU_op= 3'b101; func_code = 6'b000101;
	
	#2 $display ("or = %b" , ALU_ctr);
	
	
	#10 ALU_op= 3'b110; func_code = 6'b000111;
	
	#2 $display ("set less than= %b" , ALU_ctr);
	
	
	#2 $display (" R-type instruction");
	
	#10 ALU_op= 3'b111; func_code = 6'b000010;
	
	#2 $display ("add = %b" , ALU_ctr);
	
	
	#10 ALU_op= 3'b111; func_code = 6'b000011;
	
	#2 $display ("substract = %b" , ALU_ctr);

	
	#10 ALU_op= 3'b111; func_code = 6'b000100;
	
	#2 $display ("and = %b" , ALU_ctr);
	
	
	#10 ALU_op= 3'b111; func_code = 6'b000101;
	
	#2 $display ("or = %b" , ALU_ctr);
	
	
	#10 ALU_op= 3'b111; func_code = 6'b000111;
	
	#2 $display ("set less than= %b" , ALU_ctr);
	
	
	
	end
	
endmodule


//module alu_control ( 
//output [2:0] alu_ctr, 
//input [5:0] function_code, 
//input [2:0] ALUop
//
//);
 
