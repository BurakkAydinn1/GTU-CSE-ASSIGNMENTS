module my_testbench();

reg [31:0] a;
reg [31:0] b;

reg [2:0] ALU_op;

reg CLK;
reg reset;

wire [31:0] result;


alu alu0(result, a,b, ALU_op,reset, CLK);


initial
	begin
	
	CLK = 1'b0;	

		
	//////////////////////////////////////////// AND GATE
	
	
	#5 a = 32'b10001111111111111111111111111111; b = 32'b11111111111111110000000111111111; ALU_op= 3'b000;
	
	
	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	#5 $display ("And Gate result  = %b (%d)", result ,result);
	
	
	//////////////////////////////////////////// OR GATE
	
	#5 a = 32'b10001111111111111111111111111111; b = 32'b11111111111111110000000111111111; ALU_op= 3'b001;
	
	
	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	
	#5 $display ("Or Gate result  = %b (%d)", result,result);
	
	
	//////////////////////////////////////////// XOR GATE
	
	#5 a = 32'b10001111111111111111111111111111; b = 32'b11111111111111110000000111111111; ALU_op= 3'b010;
	
	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	
	#5 $display ("Xor Gate result  = %b (%d)", result,result);
	
	//////////////////////////////////////////// NOR GATE
	
	
	#5 a = 32'b10001111111111111111111111111111; b = 32'b11111111111111110000000111111111; ALU_op= 3'b011;

	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	#5 $display ("Nor gate result  = %b (%d)", result,result);
	
	
	//////////////////////////////////////////// LESS THAN
	
	
	#5 a = -32'd17; b = -32'd47; ALU_op= 3'b100;
	
	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	
	#5 $display ("Less than result = %b (%d)", result,result);	
	
	
	/////////////////////////////////////////// ADDITION
	
	#5 a = 32'd43; b = 32'd17; ALU_op= 3'b101;
	
	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	
	#5 $display ("Addition result  = %b (%d)", result,result);
	
	
	/////////////////////////////////////////// SUBSTRACTION	
	
	
	#5 a = 32'd113; b = 32'd50; ALU_op= 3'b110;
	
	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	
	#5 $display ("Substraction result  = %b (%d)", result, result);
	
	
	/////////////////////////////////////////// MOD OPERATION RESULT
	
	#10; // Optional delay
	
	reset = 1'b1;
	a = 32'd35;
	b = 32'd8;
	ALU_op= 3'b111;
	
	#5
	reset = 1'b0;
	
	#100000; // WAIT FOR RESULT BE READY

	#5 $display ("1.number = %b (%d) ", a,a);
	
	#5 $display ("2.number  = %b (%d) ", b,b);
	
	#5 $display("Mod operation result = %d", result, result);
	
	end

	
always
	begin
		#1
		CLK = ~CLK;
	end
	
	

endmodule



