
module my2_fsm_dp(
	input CLK,
	input s,
	input we,
	input [31:0] a,
	input [31:0] b,
	output x,
	output [31:0] result
);


reg [31:0] temp;
wire [31:0] mux_out1;
wire [31:0] mux_out2;
wire [31:0] sum;
wire car;


// buraya dikkat et
always @(negedge CLK)
	begin
	if(we == 1'b1)
		temp <= mux_out1;
	end
	
	
	

Adder_32bit add(sum, car,temp,b,0);
	

assign mux_out1 = s ? sum : a;


buf i3(x, sum[31]); // passing the most significant bit of sum 

assign mux_out2 = x ? temp : sum;

assign result = mux_out2;
 

endmodule
