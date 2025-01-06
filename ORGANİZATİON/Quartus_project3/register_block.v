module register_block ( 
  output reg [31:0] read_data1,  
  output reg [31:0] read_data2,  
  // input byteOperations,  this is an optional input for register block ask why.
  input [31:0] write_data,  
  input [4:0] read_reg1, 
  input [4:0] read_reg2, 
  input [4:0] write_reg, 
  input regWrite
);

  reg [31:0] registers [31:0];
  
	 

  always @(read_reg1, read_reg2, write_reg) begin

	 $readmemb("registers.mem", registers);
    read_data1 = registers[read_reg1];
	 read_data2 = registers[read_reg2];
  
	 
	$display ("read_reg1= %b ", read_reg1);
	$display ("read_reg2= %b ", read_reg2);
	$display ("write_reg= %b ", write_reg);
	 
  end


	always @(regWrite, write_data, write_reg) begin
			if (regWrite == 1'b1) begin
			registers[write_reg] = write_data;
			$writememb("registers.mem", registers);
			end
	end
  

  
endmodule



