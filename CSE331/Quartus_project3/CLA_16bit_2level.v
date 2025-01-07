module CLA_16bit_2level(
	
	output [15:0] result,
	output carry_out,
	
	input [15:0] in_0,
	input [15:0] in_1,
	input carry_in
);
		
		wire c_out[3:0];
		
		wire [3:0] carries;
		wire [3:0] p;
		wire [3:0] g;

		generator_and_propagate_4bit p_and_g_0(g[0], p[0], in_0[3:0], in_1[3:0]);
		generator_and_propagate_4bit p_and_g_1(g[1], p[1], in_0[7:4], in_1[7:4]);
		generator_and_propagate_4bit p_and_g_2(g[2], p[2], in_0[11:8], in_1[11:8]);
		generator_and_propagate_4bit p_and_g_3(g[3], p[3], in_0[15:12], in_1[15:12]);
		
		
		carry_out_generator generator(carries, p, g, carry_in);
		
		
		CLA_4bit layer0(c_out[0], result[3:0], in_0[3:0], in_1[3:0], carry_in);
		CLA_4bit layer1(c_out[1], result[7:4], in_0[7:4], in_1[7:4], carries[0]);
		CLA_4bit layer2(c_out[2], result[11:8], in_0[11:8], in_1[11:8], carries[1]);
		CLA_4bit layer3(c_out[3], result[15:12], in_0[15:12], in_1[15:12], carries[2]);
		
		
		or res_carry(carry_out, 0, carries[3]);
		



endmodule 