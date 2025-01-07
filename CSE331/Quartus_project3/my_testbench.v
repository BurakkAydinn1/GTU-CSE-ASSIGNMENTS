
module my_testbench ();
	
	reg clock = 0;
	
	
	mips mips_test(clock);
	
	initial begin
	$display("%d instruction number", 32'd1);
	#10  clock = 1'b1;
	#10	clock = 1'b0;
	
	$display("%d instruction number", 32'd2);

	#10  clock = 1'b1;
	#10	clock = 1'b0;
	
	$display("%d instruction number", 32'd3);

	#10  clock = 1'b1;
	#10	clock = 1'b0;

	$display("%d instruction number", 32'd4);
	
	#10  clock = 1'b1;
	#10	clock = 1'b0;

	$display("%d instruction number", 32'd5);
	
	#10  clock = 1'b1;
	#10	clock = 1'b0;
	
	$display("%d instruction number", 32'd6);
	
	#10  clock = 1'b1;
	#10	clock = 1'b0;
//	
//	$display("%d instruction number", 32'd7);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	$display("%d instruction number", 32'd8);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	$display("%d instruction number", 32'd9);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	$display("%d instruction number", 32'd10);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	$display("%d instruction number", 32'd11);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	$display("%d instruction number", 32'd12);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	$display("%d instruction number", 32'd13);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	
//	$display("%d instruction number", 32'd14);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	$display("%d instruction number", 32'd15);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	$display("%d instruction number", 32'd16);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	
//	
//	$display("%d instruction number", 32'd17);
//	
//	#10  clock = 1'b1;
//	#10	clock = 1'b0;
//	

	
	

	end
	
	
endmodule
