module mux_4x1_1bit(
	
	output out,
	
	input in_0,
	input in_1,
	input in_2,
	input in_3,
	
	input sel_1,
	input sel_0
);

	wire not_sel_0;
	wire not_sel_1;
	
	wire and_wire_0;
	wire and_wire_1;
	wire and_wire_2;
	wire and_wire_3;

	not not_selection_0(not_sel_0 , sel_0);
	not not_selection_1(not_sel_1 , sel_1);
	
	
	and and_0_gate(and_wire_3, in_0, not_sel_1 ,not_sel_0);
	and and_1_gate(and_wire_2, in_1, not_sel_1 ,sel_0);
	and and_2_gate(and_wire_1, in_2, sel_1 ,not_sel_0);
	and and_3_gate(and_wire_0, in_3, sel_1 ,sel_0);
	
	
	or total(out, and_wire_0, and_wire_1, and_wire_2, and_wire_3);
	
	
endmodule 
