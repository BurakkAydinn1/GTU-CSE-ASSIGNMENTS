module mux_8x1_1bit(
	
	output out,
	
	input in_0,
	input in_1,
	input in_2,
	input in_3,
	input in_4,
	input in_5,
	input in_6,
	input in_7,
	
	input sel_2,
	input sel_1,
	input sel_0
);

	wire mux_wire_4x1_0;
	wire mux_wire_4x1_1;

	mux_4x1_1bit mux_4_1bit_0(mux_wire_4x1_0 ,in_0, in_1, in_2, in_3, sel_1, sel_0);
	mux_4x1_1bit mux_4_1bit_1(mux_wire_4x1_1 ,in_4, in_5, in_6, in_7, sel_1, sel_0);
	
	mux_2x1_1bit mux_2_1bit(out, mux_wire_4x1_0, mux_wire_4x1_1, sel_2);
	
	
	 
endmodule 
