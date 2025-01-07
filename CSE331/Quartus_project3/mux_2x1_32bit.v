module mux_2x1_32bit(
	
	output [31:0]out,
	
	input [31:0]in_0,
	input [31:0]in_1,
	
	input sel
);

		mux_2x1_1bit mux_0(out[0], in_0[0], in_1[0], sel);
		mux_2x1_1bit mux_1(out[1], in_0[1], in_1[1], sel);
		mux_2x1_1bit mux_2(out[2], in_0[2], in_1[2], sel);
		mux_2x1_1bit mux_3(out[3], in_0[3], in_1[3], sel);
		mux_2x1_1bit mux_4(out[4], in_0[4], in_1[4], sel);
		mux_2x1_1bit mux_5(out[5], in_0[5], in_1[5], sel);
		mux_2x1_1bit mux_6(out[6], in_0[6], in_1[6], sel);
		mux_2x1_1bit mux_7(out[7], in_0[7], in_1[7], sel);
		mux_2x1_1bit mux_8(out[8], in_0[8], in_1[8], sel);
		mux_2x1_1bit mux_9(out[9], in_0[9], in_1[9], sel);
		mux_2x1_1bit mux_10(out[10], in_0[10], in_1[10], sel);
		mux_2x1_1bit mux_11(out[11], in_0[11], in_1[11], sel);
		mux_2x1_1bit mux_12(out[12], in_0[12], in_1[12], sel);
		mux_2x1_1bit mux_13(out[13], in_0[13], in_1[13], sel);
		mux_2x1_1bit mux_14(out[14], in_0[14], in_1[14], sel);
		mux_2x1_1bit mux_15(out[15], in_0[15], in_1[15], sel);
		mux_2x1_1bit mux_16(out[16], in_0[16], in_1[16], sel);
		mux_2x1_1bit mux_17(out[17], in_0[17], in_1[17], sel);
		mux_2x1_1bit mux_18(out[18], in_0[18], in_1[18], sel);
		mux_2x1_1bit mux_19(out[19], in_0[19], in_1[19], sel);
		mux_2x1_1bit mux_20(out[20], in_0[20], in_1[20], sel);
		mux_2x1_1bit mux_21(out[21], in_0[21], in_1[21], sel);
		mux_2x1_1bit mux_22(out[22], in_0[22], in_1[22], sel);
		mux_2x1_1bit mux_23(out[23], in_0[23], in_1[23], sel);
		mux_2x1_1bit mux_24(out[24], in_0[24], in_1[24], sel);
		mux_2x1_1bit mux_25(out[25], in_0[25], in_1[25], sel);
		mux_2x1_1bit mux_26(out[26], in_0[26], in_1[26], sel);
		mux_2x1_1bit mux_27(out[27], in_0[27], in_1[27], sel);
		mux_2x1_1bit mux_28(out[28], in_0[28], in_1[28], sel);
		mux_2x1_1bit mux_29(out[29], in_0[29], in_1[29], sel);
		mux_2x1_1bit mux_30(out[30], in_0[30], in_1[30], sel);
		mux_2x1_1bit mux_31(out[31], in_0[31], in_1[31], sel);
		
	
	 
endmodule 
