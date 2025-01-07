module adder(
	
	output [31:0] result,
	output carry_out,
	
	input [31:0] in_0,
	input [31:0] in_1,
	input carry_in
);

		wire between_c_out;
		
		CLA_16bit_2level add_1(result[15:0], between_c_out, in_0[15:0], in_1[15:0], carry_in);
		CLA_16bit_2level add_2(result[31:16], carry_out, in_0[31:16], in_1[31:16], between_c_out);



endmodule 