module instruction_block ( 
output reg [31:0] instruction, 
input [31:0] pc
); 


	reg [31:0] instructions_total [1023:0];


	always @(pc) begin 
	
	$readmemb("instructions.mem", instructions_total);
	
	instruction = instructions_total[pc[31:2]];
	
	end



endmodule 