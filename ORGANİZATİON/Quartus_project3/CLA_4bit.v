module CLA_4bit(
	
	output carry_out,
	output [3:0] result,
	
	/*
	output r_generate, // g[3:0]
	output r_propagate, // p[3:0]
	*/
	
	input [3:0] in_0,
	input [3:0] in_1,
	input carry_in
);



	wire [3:0] carries;
	wire [3:0] p;
	wire [3:0] g;
		
	
	or or_0(p[0], in_0[0], in_1[0]); // p0
	or or_1(p[1], in_0[1], in_1[1]); // p1
	or or_2(p[2], in_0[2], in_1[2]); // p2
	or or_3(p[3], in_0[3], in_1[3]); // p3
	
	and and_0(g[0], in_0[0], in_1[0]); // g0
	and and_1(g[1], in_0[1], in_1[1]); // g1
	and and_2(g[2], in_0[2], in_1[2]); // g2
	and and_3(g[3], in_0[3], in_1[3]); // g3
	
	
	carry_out_generator generator(carries, p, g, carry_in);
	
	sum_out sum_0(result[0], in_0[0], in_1[0], carry_in);
	sum_out sum_1(result[1], in_0[1], in_1[1], carries[0]);
	sum_out sum_2(result[2], in_0[2], in_1[2], carries[1]);
	sum_out sum_3(result[3], in_0[3], in_1[3], carries[2]);
	
	or assign_carry_out(carry_out, 0, carries[3]);
	
	/*
	and pro(r_propagate, p[3], p[2], p[1], p[0], carry_in); // p[3].p[2].p[1].p[0].c0
	
	and and_p3_g2_gate(and_p3_g2, p[3], g[2]); // p[3].g[2]
	and and_p3_p2_g1_gate(and_p3_p2_g1, p[3] ,p[2], g[1]); // p[3].p[2].g[1]
	and and_p3_p2_p1_g0_gate(and_p3_p2_p1_g0, p[3],p[2], p[1], g[0]); // p[3].p[2].p[1].g[0]
	
	or gen(r_generate, g[3], and_p3_g2, and_p3_p2_g1, and_p3_p2_p1_g0); // c4 = g[3] + p[3].g[2] + p[3].p[2].g[1] + p[3].p[2].p[1].g[0] 

	*/

endmodule 