module ALU_1bit_CLA(
	
	output result,
	output r_generate,
	output r_propagate,
	
	
	input in_0,
	input in_1,
	input c_in
);


	xor xor1 (in_0_xor_in_1, in_0, in_1);
	xor xor2 (result, in_0_xor_in_1 , c_in);

	or (r_propagate, in_0, in_1);
	and (r_generate, in_0, in_1);


endmodule 