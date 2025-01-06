module my_testbench ();
	
	wire [31:0] read_data;
	
	reg byteOperation;
	reg [8:0] address;
	reg [31:0] write_data;
	reg memRead;
	reg memWrite;
	
	
	
	memory_block memory(read_data, byteOperation, address, write_data, memRead, memWrite);
	
	initial begin
	
	#10 byteOperation = 1'b1; address = 9'b000000001 ; memRead = 1'b1; memWrite = 1'b0; write_data = 32'b11111111111111111111111111111111;
	
	#2 $display ("read_data = %b" , read_data);

	
	#10 byteOperation = 1'b0; address = 9'b000000001 ; memRead = 1'b1; memWrite = 1'b0; write_data = 32'b11111111111111111111111111111111;
	
	#2 $display ("read_data = %b" , read_data);
	
	
	#10 byteOperation = 1'b1; address = 9'b000011110 ; memRead = 1'b0; memWrite = 1'b1; write_data = 32'b11111111111111111111111111111111;
	
	#2 $display ("read_data = %b" , read_data);
	
	#10 byteOperation = 1'b0; address = 9'b000001101 ; memRead = 1'b0; memWrite = 1'b1; write_data = 32'b11111111111111111111111111111111;
	
	#2 $display ("read_data = %b" , read_data);
	
	end
	
endmodule


//module memory_block ( 
//
//output reg [31:0] read_data, 
//
//
//input byteOperation,  
//input [8:0] address, 
//input [31:0] write_data, 
//input memRead, 
//input memWrite
//
//); 
//	reg [128:0] mem [31:0];
//	
//	reg [1:0] byte_offset;
//	reg [6:0] index;
//	
//	
//	
//
//	always @(memRead, memWrite, byteOperation) begin
//		
//		$readmemb("mem.mem", mem);
//		byte_offset = address[1:0]; //byte ofset
//		index = address[8:2]; // index od memroy address
//		
//		
//		if (memRead)
//			if(byteOperation)
//				if(byte_offset == 2'b00)	
//					read_data[7:0] = mem[index][7:0];		
//				else if (byte_offset == 2'b01)	
//					read_data[7:0] = mem[index][15:8];	
//				else if (byte_offset == 2'b10)	
//					read_data[7:0] = mem[index][23:16];		
//				else if (byte_offset == 2'b11)
//					read_data[7:0] = mem[index][31:24];
//			
//			else
//			read_data = mem[index];
//		
//			
//		if (memWrite)
//			mem[address] = write_data;
//	
//		$writememb("mem.mem", mem);
//		
//	end
//	
//
//
//endmodule 

