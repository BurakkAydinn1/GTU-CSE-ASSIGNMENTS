module memory_block ( 

output reg [31:0] read_data, 


input byteOperation,  
input [17:0] address, 
input [31:0] write_data, 
input memRead, 
input memWrite

); 
	reg [31:0] mem [31:0];
	
	reg [1:0] byte_offset;
	reg [15:0] index;
	
	
	

	always @(memRead, memWrite, byteOperation) begin
		
		$readmemb("mem.mem", mem);
		byte_offset = address[1:0]; //byte ofset
		index = address[17:2]; // index od1 memroy address
		
		
		if (memRead) begin
			if(byteOperation == 1'b1) begin
			
				if(byte_offset == 2'b00) begin	
					read_data[7:0] = mem[index][7:0];
					read_data[31:8] = 24'd0;
				end
				else if (byte_offset == 2'b01) begin	
					read_data[7:0] = mem[index][15:8];
					read_data[31:8] = 24'd0;
				end	
				else if (byte_offset == 2'b10) begin	
					read_data[7:0] = mem[index][23:16];
					read_data[31:8] = 24'd0;	
				end
				else if (byte_offset == 2'b11) begin
					read_data[7:0] = mem[index][31:24];
					read_data[31:8] = 24'd0;
				end
			end
			else begin
				read_data = mem[index];
			end
		end
			
			
		if (memWrite) begin
			
			if(byteOperation == 1'b1) begin
				if(byte_offset == 2'b00) begin	
					mem[index][7:0] = write_data[7:0];
				end
				else if (byte_offset == 2'b01) begin	
					mem[index][15:8] = write_data[7:0];
				end	
				else if (byte_offset == 2'b10) begin	
					mem[index][23:16] = write_data[7:0];	
				end
				else if (byte_offset == 2'b11) begin
					mem[index][31:24] = write_data[7:0];
				end
			end
			else begin
				mem[index] = write_data;
			end
			
		end
	
		$writememb("mem.mem", mem);
		
	end
	

endmodule 



