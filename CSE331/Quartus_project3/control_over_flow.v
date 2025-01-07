module control_over_flow(
	
	output result,
	
	input r_adder, // less significant bit of substractor result 
	
	input msb_0, // most significant bit of input_1
	input msb_1  // most significant bot of input_2
	
);

	wire diff;

	xor diff_gate(diff, msb_0, msb_1);
	
	
	
	mux_2x1_1bit mux_decision(result,r_adder, msb_0 ,diff);



endmodule 