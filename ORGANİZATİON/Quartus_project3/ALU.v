module alu(

	output [31:0] result,
	output zero,

	input wire [31:0] in_0,
	input wire [31:0] in_1,
	input wire [2:0] ALU_op


);
//
//	always @(ALU_op) begin
//	
//	$display(" ALU ================================== %b", 0);
//	$display(" amk evladi toplama islemi = %b", adder_result);
//	$display("in_0= %b", in_0);
//	$display("in_1= %b", in_1);
//	$display(" ALU ================================== %b", 0);
//	end


	
	wire bitwise;
	wire carry_in;
	wire carry_out;
	
	wire less_result_temp;
	wire [31:0] not_in_1;
	wire [31:0] res_mux;
	wire [31:0] adder_result;
	wire [31:0] less_result;
	wire [31:0] result_2;
	wire [31:0] mod_in;
	
	not_gate_32 not_1(not_in_1, in_1);

	wire [31:0] and_gate_result;
	wire [31:0] or_gate_result;
	wire [31:0] xor_gate_result;
	wire [31:0] nor_gate_result;
	wire mux_dec;
	
	
	Basic_controller cont(carry_in, bitwise, mux_dec, ALU_op);

	
	and_gate_32 and_1(and_gate_result, in_0, in_1);
	or_gate_32 or_1(or_gate_result, in_0, in_1);
	xor_gate_32 xor_1(xor_gate_result, in_0,in_1);
	nor_gate_32 nor_1(nor_gate_result, in_0, in_1);
	
	
	mux_2x1_32bit mux_1(res_mux, in_1, not_in_1, bitwise);
	mux_2x1_32bit mux_2(mod_in, in_0, 32'd0, mux_dec);
	
	
	adder adder_32(adder_result, carry_out , mod_in , res_mux, carry_in);
	
	
	
	control_over_flow  control(less_result_temp, adder_result[31], in_0[31], in_1[31]);
	sett_less_than  stl(less_result, less_result_temp);
   
	
	
	mux_8x1_32bit mux (result, and_gate_result, or_gate_result, xor_gate_result, nor_gate_result, less_result, adder_result , adder_result, 0 , ALU_op[2], ALU_op[1], ALU_op[0]);
	
	
	
	assign zero = (result == 32'b0) ? 1 : 0;
	
	
	
endmodule 