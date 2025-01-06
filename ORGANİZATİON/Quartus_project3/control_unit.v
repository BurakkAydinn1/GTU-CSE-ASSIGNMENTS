module control_unit ( 
output regDst, // output reg regDst, 
output branch, // output reg branch, 
output memRead,  
output memWrite, 
output [2:0] ALUop, 
//(This is an optional signal for lb and sb operations) 
//(This can also be used as memToReg) 
//(This was assigned as [1:0] before, by mistake. It should be [2:0]) 
output ALUsrc, 
output regWrite ,
output jump, 
output byteOperations,  //(This is an optional signal for lb and sb operations) 
output move,    
input [5:0] opcode

);

	wire [5:0] notcode;
	
	not not_0(notcode[0], opcode[0]);
	not not_1(notcode[1], opcode[1]);
	not not_2(notcode[2], opcode[2]);
	not not_3(notcode[3], opcode[3]);
	not not_4(notcode[4], opcode[4]);
	not not_5(notcode[5], opcode[5]);
	
	
	
   // regDst  // burdda R-typei unuttun dikkatli ol amk
	
	and reg_DST_gate(regDst, notcode[0], notcode[1], notcode[2], notcode[3], notcode[4], notcode[5]);
	
	// branch
	
	and branch_gate(branch, opcode[5], notcode[4], notcode[3], opcode[1], opcode[0]);
	
	// memRead  
	
	and mem_Read_gate(memRead, notcode[5], notcode[4], opcode[3], notcode[2], notcode[1]);
	
	// memWrite
	
	and  mem_Write_gate(memWrite, notcode[5], opcode[4], notcode[3], notcode[2], notcode[1]);
	
	// Alu source
	wire [3:0]help_hadi;
	
	and ALU_SRC_gate0(help_hadi[0], notcode[0], notcode[1], notcode[2], notcode[3], notcode[4], notcode[5]);
	and ALU_SRC_gate1(help_hadi[1], opcode[0], opcode[1], notcode[2], notcode[3], notcode[4], opcode[5]);
	and ALU_SRC_gate2(help_hadi[2], opcode[0], opcode[1], opcode[2], notcode[3], notcode[4], opcode[5]);
	
	or hadi(ALUsrc, help_hadi[0], help_hadi[1],help_hadi[2]);
	// regWrite
	
	wire [9:0] regwrite_help;
	
	and reg_write_help0(regwrite_help[0], notcode[5], notcode[4], notcode[3], notcode[2], notcode[1], notcode[0]); // R-type
	
	and reg_write_help1(regwrite_help[1], notcode[5], notcode[4], notcode[3], notcode[2], opcode[1], notcode[0]); // add immediate
	
	and reg_write_help2(regwrite_help[2], notcode[5], notcode[4], notcode[3], notcode[2], opcode[1], opcode[0]); // substract immediate
	
	and reg_write_help3(regwrite_help[3], notcode[5], notcode[4], notcode[3], opcode[2], notcode[1], notcode[0]); // and immediate
	
	and reg_write_help4(regwrite_help[4], notcode[5], notcode[4], notcode[3], opcode[2], notcode[1], opcode[0]); // or immediate
	
	and reg_write_help5(regwrite_help[5], notcode[5], notcode[4], opcode[3], notcode[2], notcode[1], notcode[0]); // load word
	
	and reg_write_help6(regwrite_help[6], notcode[5], notcode[4], opcode[3], notcode[2], notcode[1], opcode[0]); // load byte
	
	and reg_write_help7(regwrite_help[7], notcode[5], notcode[4], notcode[3], opcode[2], opcode[1], opcode[0]); // settless than
	
	and reg_write_help8(regwrite_help[8], opcode[5], opcode[4], opcode[3], notcode[2], notcode[1], opcode[0]); // jump and link
	
	and reg_write_help9(regwrite_help[9], opcode[5], notcode[4], notcode[3], notcode[2], notcode[1], notcode[0]); // move
	
	
	or #(9) reg_write_gate(regWrite, regwrite_help[0], regwrite_help[1], regwrite_help[2], regwrite_help[3], regwrite_help[4],
										 regwrite_help[5], regwrite_help[6], regwrite_help[7], regwrite_help[8], regwrite_help[9]);
	
	
	// jump
	
	and jump_gate(jump, opcode[5], opcode[4], opcode[3], notcode[2], notcode[1]);
	
	
	// byte Operation
	
	wire byte_temp0;
	
	xor byteop_help0(byte_temp0, opcode[4], opcode[3]);
	
	and byteop_gate(byteOperations, notcode[5], byte_temp0, notcode[2], notcode[1], opcode[0]);
	
	
	// move
	
	and move_gate(move, opcode[5], notcode[4], notcode[3], notcode[2], notcode[1], notcode[0]);
	
	
	// Alu op [2]
	
	wire not_ALUop2;
	
	and temp_ALUop(not_ALUop2, notcode[5], notcode[4], notcode[3], opcode[2], notcode[1]);
	
	not ALUop2_gate(ALUop[2], not_ALUop2);
	
	// ALu op [1]
	
	
	wire ALUop1_help[3:0];
	
	and ALUop1_help0_gate(ALUop1_help[0], notcode[5], notcode[4], notcode[3], notcode[2], notcode[1], notcode[0]);
	
	and ALUop1_help1_gate(ALUop1_help[1], notcode[5], notcode[4], notcode[3], notcode[2], opcode[1], opcode[0]);
	
	and ALUop1_help2_gate(ALUop1_help[2], opcode[5], notcode[4], notcode[3], notcode[2], opcode[1], opcode[0]);
	
	and ALUop1_help3_gate(ALUop1_help[3], opcode[5], notcode[4], notcode[3], opcode[2], opcode[1], opcode[0]);

	
	or ALUop1_gate(ALUop[1], ALUop1_help[0],ALUop1_help[1],ALUop1_help[2],ALUop1_help[3]);
	
	
	// Alu op [0]
	
	wire ALUop0_help[10:0];
	
	and ALUop0_help0_gate(ALUop0_help[0], notcode[5], notcode[4], notcode[3], notcode[2], notcode[1], notcode[0]);
	
	and ALUop0_help1_gate(ALUop0_help[1], notcode[5], notcode[4], notcode[3], notcode[2], opcode[1], notcode[0]);
	
	and ALUop0_help2_gate(ALUop0_help[2], notcode[5], notcode[4], notcode[3], opcode[2], notcode[1], opcode[0]);
	
	and ALUop0_help3_gate(ALUop0_help[3], notcode[5], notcode[4], opcode[3], notcode[2], notcode[1], notcode[0]);
	
	and ALUop0_help4_gate(ALUop0_help[4], notcode[5], opcode[4], notcode[3], notcode[2], notcode[1], notcode[0]);
	
	and ALUop0_help5_gate(ALUop0_help[5], notcode[5], notcode[4], opcode[3], notcode[2], notcode[1], opcode[0]);
	
	and ALUop0_help6_gate(ALUop0_help[6], notcode[5], opcode[4], notcode[3], notcode[2], notcode[1], opcode[0]);
	


	
	or ALUop0_gate(ALUop[0],ALUop0_help[0], ALUop0_help[1], ALUop0_help[2], 
									ALUop0_help[3], ALUop0_help[4], ALUop0_help[5], ALUop0_help[6]);
									




endmodule

