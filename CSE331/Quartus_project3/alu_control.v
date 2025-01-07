module alu_control ( 
output [2:0] alu_ctr, 
input [5:0] function_code, 
input [2:0] ALUop

);

	wire [5:0] not_function_code;
	
	not not_0(not_function_code[0], function_code[0]);
	not not_1(not_function_code[1], function_code[1]);
	not not_2(not_function_code[2], function_code[2]);
	not not_3(not_function_code[3], function_code[3]);
	not not_4(not_function_code[4], function_code[4]);
	not not_5(not_function_code[5], function_code[5]);
	
	wire [3:0] notcode;
	
	not not0(notcode[0], ALUop[0]);
	not not1(notcode[1], ALUop[1]);
	not not2(notcode[2], ALUop[2]);
	
	

   // alu_ctr[0] instruction
	
	wire [10:0] ctr0_help;
	// add
	and ctr0_help_gate0(ctr0_help[0], not_function_code[5], not_function_code[4], not_function_code[3], not_function_code[2], function_code[1], not_function_code[0], ALUop[2], ALUop[1], ALUop[0]);
	
	// or
	and ctr0_help_gate1(ctr0_help[1], not_function_code[5], not_function_code[4], not_function_code[3], function_code[2], not_function_code[1], function_code[0],  ALUop[2], ALUop[1], ALUop[0]);
	
	// jump register
	and ctr0_help_gate2(ctr0_help[2], not_function_code[5], not_function_code[4], function_code[3], not_function_code[2], not_function_code[1], not_function_code[0], ALUop[2], ALUop[1], ALUop[0]);
	
	
	// ALU_OP
	and ctr0_help_gate3(ctr0_help[3], notcode[2], notcode[1], ALUop[0]);
	and ctr0_help_gate4(ctr0_help[4], ALUop[2], notcode[1], ALUop[0]);
	
	or ctr0_gate(alu_ctr[0],ctr0_help[0], ctr0_help[1], ctr0_help[2],
									ctr0_help[3], ctr0_help[4]);
	
	
	// alu_ctr[1] 

	wire [10:0] ctr1_help;
	
	// substract
	and ctr1_help_gate0(ctr1_help[0], not_function_code[5], not_function_code[4], not_function_code[3], not_function_code[2], function_code[1], function_code[0], ALUop[2], ALUop[1], ALUop[0]);
	
	// set less than
	and ctr1_help_gate1(ctr1_help[1], not_function_code[5], not_function_code[4], not_function_code[3], function_code[2], function_code[1], function_code[0],  ALUop[2], ALUop[1], ALUop[0]);
	
	// jump register
	and ctr1_help_gate2(ctr1_help[2], not_function_code[5], not_function_code[4], function_code[3], not_function_code[2], not_function_code[1], not_function_code[0], ALUop[2], ALUop[1], ALUop[0]);

	
	// ALUOP
	and ctr1_help_gate3(ctr1_help[3], ALUop[2], ALUop[1], notcode[0]);
	
	
	or ctr1_gate(alu_ctr[1], ctr1_help[0], ctr1_help[1], ctr1_help[2], ctr1_help[3]);
	
	
	
	// alu_ctr[2]
	
	wire [10:0] ctr2_help;
	
	// add
	and ctr2_help_gate0(ctr2_help[0], not_function_code[5], not_function_code[4], not_function_code[3], not_function_code[2], function_code[1], not_function_code[0], ALUop[2], ALUop[1], ALUop[0]);
	
	// substract
	and ctr2_help_gate1(ctr2_help[1], not_function_code[5], not_function_code[4], not_function_code[3], not_function_code[2], function_code[1], function_code[0], ALUop[2], ALUop[1], ALUop[0]);
	
	// set less than
	and ctr2_help_gate2(ctr2_help[2], not_function_code[5], not_function_code[4], not_function_code[3], function_code[2], function_code[1], function_code[0],  ALUop[2], ALUop[1], ALUop[0]);
	
	// jump register
	and ctr2_help_gate3(ctr2_help[3], not_function_code[5], not_function_code[4], function_code[3], not_function_code[2], not_function_code[1], not_function_code[0], ALUop[2], ALUop[1], ALUop[0]);
		
	
	// ALUOP
	and ctr2_help_gate6(ctr2_help[4], ALUop[2], notcode[1], notcode[0]);	
	and ctr2_help_gate7(ctr2_help[5], ALUop[2], notcode[1], ALUop[0]);
	and ctr2_help_gate8(ctr2_help[6], ALUop[2], ALUop[1], notcode[0]);
		
		
	or ctr2_gate (alu_ctr[2], ctr2_help[0], ctr2_help[1], ctr2_help[2], ctr2_help[3], ctr2_help[4],
						 ctr2_help[5], ctr2_help[6]);
	
	
	
		
		

endmodule 