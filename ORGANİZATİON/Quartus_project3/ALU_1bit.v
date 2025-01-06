module ALU_1bit(

	output result,
	output c_out,
	
	input in_0,
	input in_1,
	input c_in,
	input ainvert,
	input binvert,
	input less_xor,
	input Operation_1,
	input Operation_0
	
);

	wire not_in_0;
	wire not_in_1;
	
	wire ain_wire;
	wire bin_wire;
	
	not not_1(not_in_0, in_0);
	not not_2(not_in_1, in_1);

	mux_2x1_1bit(ain_wire, in_0, not_in_0, ainvert);
	mux_2x1_1bit(bin_wire, in_1, not_in_1, binvert);
	
	wire and_out;
	wire or_out;
	
	and and_0(and_out, ain_wire, bin_wire);
	or or_0(or_out, ain_wire, bin_wire);
	
	wire fula_out;
	
	full_adder(fula_out, c_out, in_0, in_1, c_in);
	
	
	wire xor_result;
	
	xor xor_0(xor_result, in_0,  in_1);
	
	wire less_xor_result;
	
	mux_2x1_1bit(less_xor_result, 0 , xor_result , less_xor);
	
	
	mux_4x1_1bit mux_4_1bit_0(result, and_out, or_out, fula_out, less_xor_result, Operation_1, Operation_0);
	
	
	


endmodule 