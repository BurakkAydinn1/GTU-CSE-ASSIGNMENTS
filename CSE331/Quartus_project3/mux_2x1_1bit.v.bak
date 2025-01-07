module mux_2x1_1bit(
	input in1,
	input in2,
	input select,
		
	output out
);


	wire [1:0] cable;
	
	wire s_not;
	
	not (s_not,select);
	
	and (cable[0], in1, s_not);
	
	and (cable[1], in2 , s);
	
	or (out, cable[0],cable[1]);
	
	

endmodule 
