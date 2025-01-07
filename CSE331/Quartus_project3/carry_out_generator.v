module carry_out_generator(
	
	output [3:0] Carry_out,
	
	input [3:0] p,
	input [3:0] g,

	input carry_in
);

	wire and_p0_c0;
	wire and_p1_p0_c0;
	wire and_p2_p1_p0_c0;
	wire and_p3_p2_p1_p0_c0;
	
	wire and_p1_g0;
	wire and_p2_p1_g0;
	wire and_p3_p2_p1_g0;
	

	wire and_p2_g1;
	wire and_p3_p2_g1;
	
	wire and_p3_g2;


	//////////////////////////////////////////////////////////

	and and_p0_c0_gate(and_p0_c0, p[0], carry_in); // p[0].c0
	
	and and_p1_p0_c0_gate(and_p1_p0_c0, p[1], p[0], carry_in); // p[1].p[0].c0
	
	and and_p2_p1_p0_c0_gate(and_p2_p1_p0_c0, p[2], p[1], p[0], carry_in); // p[2].p[1].p[0].c0
	
	and and_p3_p2_p1_p0_c0_gate(and_p3_p2_p1_p0_c0, p[3], p[2], p[1], p[0], carry_in); // p[3].p[2].p[1].p[0].c0
	
	///////////////////////////////////////////////////////////////////////////
	
	and and_p1_g0_gate(and_p1_g0, p[1], g[0]); // p[1].g[0]
	
	and and_p2_p1_g0_gate(and_p2_p1_g0, p[2], p[1], g[0]); // p[2].p[1].g[0]
	
	and and_p3_p2_p1_g0_gate(and_p3_p2_p1_g0, p[3],p[2], p[1], g[0]); // p[3].p[2].p[1].g[0]

	///////////////////////////////////////////////////////////////////////////
	
	and and_p2_g1_gate(and_p2_g1, p[2], g[1]); // p[2].g[1]
	
	and and_p3_p2_g1_gate(and_p3_p2_g1, p[3], p[2], g[1]); // p[3].p[2].g[1]
	
	///////////////////////////////////////////////////////////////////////////
	
	and and_p3_g2_gate(and_p3_g2, p[3], g[2]); // p[3].g[2]	
	
	///////////////////////////////////////////////////////////////////////////
	
	
	or c1_gate(Carry_out[0], g[0], and_p0_c0);  // c1 = g[0] + p[0].c0
	
	or c2_gate(Carry_out[1], g[1], and_p1_g0, and_p1_p0_c0); // c2 = g[1] + p[1].g[0] + p[1].p[0].c0
	
	or c3_gate(Carry_out[2], g[2], and_p2_g1, and_p2_p1_g0, and_p2_p1_p0_c0); // c3 = g[2] + p[2].g[1] + p[2].p[1].g[0] + p[2].p[1].p[0].c0
	
	or c4_gate(Carry_out[3], g[3], and_p3_g2, and_p3_p2_g1, and_p3_p2_p1_g0, and_p3_p2_p1_p0_c0); // c4 = g[3] + p[3].g[2] + p[3].p[2].g[1] + p[3].p[2].p[1].g[0] + p[3].p[2].p[1].p[0].c0
	
	


endmodule 