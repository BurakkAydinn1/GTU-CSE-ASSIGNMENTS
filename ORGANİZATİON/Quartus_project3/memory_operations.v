module memory_operations (input [31:0] content, input [4:0] address);
	reg [31:0] registers [31:0];
	
	
	always @ (address) begin
		$readmemb("registers.mem", registers);
		registers[address] = content;
		$writememb("registers.mem", registers);
	end 
	


endmodule 

//module memory_operations (
//    input [31:0] content,
//    input [4:0] address,
//    input write_enable
//);
//
//    reg [31:0] registers [31:0];
//
//    initial begin
//        $readmemb("registers.mem", registers);
//        if (write_enable)
//            registers[address] = content;
//        $writememb("registers.mem", registers);
//    end
//
//endmodule
