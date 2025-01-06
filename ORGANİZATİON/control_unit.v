module my_testbench ();

	reg [5:0] opcode;
	
	wire regDst;
	wire branch;
	wire memRead;
	wire memWrite;
	wire [2:0] ALUop;
	wire ALUsrc;
	wire regWrite;
	wire jump;
	wire byteOperation;
	wire move;
	
	control_unit control_unit(regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperation, move, opcode);
	
	initial begin
	
	#30 opcode = 6'b000000; // R-type instruction
	#2 $display ("R-type = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	
	#30 opcode = 6'b000010; // addi (addimmidiate) instruction
	#2 $display ("addi= %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	#30 opcode = 6'b000011; // subi (substract immidiate) instruction
	#2 $display ("subi= %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
		
	
	#30 opcode = 6'b000100; // andi (and immidiate) instruction
	#2 $display ("andi= %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
			
	
	
	#30 opcode = 6'b000101; // ori (or immidiate) instruction
	#2 $display ("ori= %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
		
		
	#30 opcode = 6'b001000; // load word instruction
	#2 $display ("load word = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	#30 opcode = 6'b001001; // load byte instruction
	#2 $display ("load byte = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	#30 opcode = 6'b010000; // store word instruction
	#2 $display ("store word = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	#30 opcode = 6'b010001; // store byte instruction
	#2 $display ("store byte = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	
	#30 opcode = 6'b100011; // branch on equal instruction
	#2 $display ("branch on equal = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
		
	#30 opcode = 6'b100111; // branch on not equal instruction
	#2 $display ("branch on not equal = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
		
	#30 opcode = 6'b111000; // jump instruction
	#2 $display ("jump = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
		
		
	#30 opcode = 6'b111001; // jump and link instruction
	#2 $display ("jump and link= %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	#30 opcode = 6'b100000; // move instruction
	#2 $display ("move = %b" , opcode);
	#30 $display ("regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUop= %b, ALUsrc= %b, regwrite= %b, jump= %b, byteOperation= %b, move= %b",
					 regDst,      branch   , memRead 	, memWrite	  , ALUop	 , ALUsrc     , regWrite	, jump 	 , byteOperation    ,  move   );
	
	
	
	end
	
endmodule

 
