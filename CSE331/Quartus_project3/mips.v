module mips(
	input clock
);

	reg [31:0] pc = 0;
	

		wire [31:0] INSTRUCTION;
		
		instruction_block I_block(INSTRUCTION, pc);
		
		
		wire [31:0] output_sign_extend;
		wire [31:0] output_register1;
		wire [31:0] output_register2;
		wire [31:0] output_shift_left;
		
		wire [31:0] WRITE_DATA;
		wire [31:0] out_regDst;
		wire [31:0] bef_move;
		
	 	wire [2:0]  alu_ctr;
		
		wire regDst;  
		wire branch; 
		wire memRead;  
		wire memWrite; 
		wire [2:0] ALUop; 
		wire ALUsrc; 
		wire regWrite;
		wire jump; 
		wire byteOperations;
		wire move;
		wire jump_jr;
		wire jump_real;
		wire temp1;
		wire temp2;
		wire zero_bit_temp;
		
		wire zero_bit;
		
		wire [31:0] next_PC;
		wire [31:0] branch_PC;
		wire [31:0] final_PC;
		wire [31:0] jump_address;
		wire decide_branch;
		
		wire [31:0] output_ALUsrc;
		wire [31:0] output_ALU;
		wire [4:0] out_regDST;
		wire [4:0] read1;
		wire [31:0] read2;
		wire [4:0] write_real;
		wire jump_jal;
		
		
		
		assign out_regDst = regDst ? INSTRUCTION[15:11] : INSTRUCTION[20:16];
		
		
		
		register_block R_block(output_register1, output_register2, WRITE_DATA , 
					read1, INSTRUCTION[20:16], write_real , regWrite2);
					
		and hadi(regWrite2, regWrite, ~jump_jr);
		
		assign read1 = jump_jr ? 5'b11111 : INSTRUCTION[25:21];
		assign write_real = jump_jal ? 5'b11111 : out_regDst;
		
		assign output_ALUsrc = ALUsrc ? output_register2 : output_sign_extend ;
		
		alu alu_module(output_ALU, zero_bit_temp, output_ALUsrc, output_register1, alu_ctr);
		
		and zero_bit_gate(zero_bit, zero_bit_temp, INSTRUCTION[31], ~INSTRUCTION[30], ~INSTRUCTION[29],
		~INSTRUCTION[28], INSTRUCTION[27], INSTRUCTION[26]);
		
		wire [31:0] output_memory;
		
		memory_block M_block(output_memory, byteOperations, output_ALU[17:0], output_register2, memRead, memWrite);
		
		assign bef_move = memRead ? output_memory : output_ALU;
		
		assign read2 = move ? output_register1 : bef_move;
		
		assign WRITE_DATA = jump_jal ? pc : read2;

				
		control_unit C_block(regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move, INSTRUCTION[31:26]);
		
		sign_extend sign_module(output_sign_extend, INSTRUCTION[15:0]);
		
		alu_control alu_control_module(alu_ctr, INSTRUCTION[5:0], ALUop);
	
		shift_left_2 shift(output_shift_left, output_sign_extend);
		

		adder PC_4(next_PC, temp1 ,pc ,32'd4, 1'b0);
		
		adder PC_branch(branch_PC, temp2, next_PC ,output_shift_left,1'b0);
		
		
		
		and and_branch(decide_branch, zero_bit, branch);
		
		
		assign final_PC = decide_branch ? branch_PC : next_PC;
		
		// exception 1
		and jump_jr_gate(jump_jr, ~INSTRUCTION[31], ~INSTRUCTION[30], ~INSTRUCTION[29],
		~INSTRUCTION[28], ~INSTRUCTION[27], ~INSTRUCTION[26], ~INSTRUCTION[0]
		, ~INSTRUCTION[1] , ~INSTRUCTION[2] , INSTRUCTION[3], ~INSTRUCTION[4], ~INSTRUCTION[5]);
		

		
		
		// exception 2
		and jump_jal_gate(jump_jal, INSTRUCTION[31], INSTRUCTION[30], INSTRUCTION[29],
		~INSTRUCTION[28], ~INSTRUCTION[27], INSTRUCTION[26]);
		
		assign jump_address = jump_jr ? output_register1 : output_shift_left;
		
		or jump_gate(jump_real, jump_jr, jump);
		
		
		
		always @(posedge clock) begin
		
			
			$display ("pc = %d, Final_pc= %d, jumpaddress = %d", pc, final_PC, jump_address);
			
			$display ("INSTRUCTION = %b", INSTRUCTION);
			$display ("read_data1= %b", output_register1);
			$display ("read_data2= %b", output_register2);
			$display ("write_data = %b", WRITE_DATA);
			
			
			$display ("write_real = %b", write_real);
			$display ("regWrite = %b", regWrite);
			$display ("jump = %b", jump);
			$display ("zero_bit= %b",zero_bit);
			$display ("read1 = %b", read1);
			
			$display ("move = %b", move);
			
			
			$display ("ALU_control = %b ALUop= %b", alu_ctr, ALUop);
			$display ("output_ALU = %b", output_ALU);
			$display ("ALUsrc = %b , branch = %b, jump= %b", ALUsrc, branch,jump);
			$display ("regDst = %b , jump_jr = %b, jump_jal= %b", regDst, jump_jr,jump);
			
			if (jump_real)begin
				pc = jump_address;
			end
			else begin 
				pc = final_PC;
			end
			
		
		end
		


endmodule 




