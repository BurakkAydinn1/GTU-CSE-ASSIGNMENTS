module sum_out(

	output sum,

	input in_1,
	input in_2,
	input carry_in
);

	wire in_1_xor_in_2;
	
	
	xor xor1 (in_1_xor_in_2, in_1, in_2);
	xor xor2 (sum, in_1_xor_in_2 , carry_in);


endmodule 