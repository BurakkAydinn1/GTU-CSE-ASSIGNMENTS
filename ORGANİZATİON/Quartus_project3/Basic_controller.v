module Basic_controller(

	output bitwise,
	output carry_in,
	output mux_dec,
	input [2:0] ALU_op

);

	
	
	wire not_1;
	wire not_0;
	
	wire bet_2;
	wire bet_1;
	
	
	not not_gate_0(not_0, ALU_op[0]); // ~A1
	not not_gate_1(not_1, ALU_op[1]); // ~A0
	
	
	and and_1(bet_1, not_0, not_1);
	
	
	or or_1(bet_2, bet_1, ALU_op[1]);
	
	and final1(bitwise, bet_2, ALU_op[2]);
	
	and final2(carry_in, bet_2, ALU_op[2]);
	
	and final3(mux_dec, ALU_op[0], ALU_op[1] ,ALU_op[2]);
	
	



endmodule 