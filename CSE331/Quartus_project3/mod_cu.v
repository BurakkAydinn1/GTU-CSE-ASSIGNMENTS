
module mod_cu(
	input reset,
	input CLK,
	input x,
	input [31:0] temp,
	output reg we,
	output reg s,
	output reg [31:0] result
);

reg [1:0] curr_state, next_state;




localparam 
				T_assign 		= 2'b00,
				Substract	 		= 2'b01,
				Result			= 2'b10;
				


		
		
//State Registers			
always @(posedge CLK)
	begin
	if(reset)
		curr_state <= T_assign;
	else
		curr_state <= next_state;
	end

		

	



//Next State Logic
always @(*)
	begin
	case(curr_state)
	T_assign: begin
			next_state = Substract;
			end
	
	Substract: begin
			if(x == 1'b1)
				next_state = Result;
			else
				next_state = Substract;
			end
	
	Result: begin
				result = temp;
			 end
	
	
	endcase
	end




//Output Logic
always @(*)
	begin
	s = 1'b0;
	we = 1'b0;
	case(curr_state)
	T_assign: begin
			
			s = 1'b0;
			we = 1'b1;
			end
	
	Substract: begin
			
			s = 1'b1;
			we = 1'b1;
			end
	
	Result: begin
			 s = 1'b1;
			 we = 1'b0;
			 end
	
	
	endcase
	end
	



endmodule