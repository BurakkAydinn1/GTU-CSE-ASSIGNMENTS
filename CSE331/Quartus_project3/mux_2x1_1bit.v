module mux_2x1_1bit(
	
	output out,
	
	input in_0,
	input in_1,
	
	input sel
);

	wire not_sel;
	wire and0;
	wire and1;
	
	

	not not_selection(not_sel ,sel);
	
	and and_0_gate(and0 ,not_sel, in_0);
	and and_1_gate(and1 ,sel,in_1);
	
	or total(out, and0, and1);
	
	
	
endmodule 
