module generator_and_propagate_4bit(

	output gen,
	output pro,

	input [3:0] in_0,
	input [3:0] in_1
);

	//
	wire and_p3_p2_p1_g0;
	wire and_p3_p2_g1;
	wire and_p3_g2;

	

	//
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
	
	///////////////////////////////////////////////////////////////////////////
	
	and and_p3_p2_p1_g0_gate(and_p3_p2_p1_g0, p[3],p[2], p[1], g[0]); // p[3].p[2].p[1].g[0]

	///////////////////////////////////////////////////////////////////////////
	
	and and_p3_p2_g1_gate(and_p3_p2_g1, p[3], p[2], g[1]); // p[3].p[2].g[1]
	
	///////////////////////////////////////////////////////////////////////////
	
	and and_p3_g2_gate(and_p3_g2, p[3], g[2]); // p[3].g[2]	
	
	///////////////////////////////////////////////////////////////////////////
	
	and res_pro(pro, p[3],p[2],p[1],p[0]);
	
	
	or res_gen(gen, g[3], and_p3_g2, and_p3_p2_g1, and_p3_p2_p1_g0);
	

endmodule 