module mux_8x1_32bit(
	
	output [31:0] out,
	
	input [31:0] in_0,
	input [31:0] in_1,
	input [31:0] in_2,
	input [31:0] in_3,
	input [31:0] in_4,
	input [31:0] in_5,
	input [31:0] in_6,
	input [31:0] in_7,
	
	input sel_2,
	input sel_1,
	input sel_0
);

		mux_8x1_1bit mux_0(out[0], in_0[0], in_1[0], in_2[0], in_3[0], in_4[0], in_5[0] , in_6[0], in_7[0], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_1(out[1], in_0[1], in_1[1], in_2[1], in_3[1], in_4[1], in_5[1] , in_6[1], in_7[1], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_2(out[2], in_0[2], in_1[2], in_2[2], in_3[2], in_4[2], in_5[2] , in_6[2], in_7[2], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_3(out[3], in_0[3], in_1[3], in_2[3], in_3[3], in_4[3], in_5[3] , in_6[3], in_7[3], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_4(out[4], in_0[4], in_1[4], in_2[4], in_3[4], in_4[4], in_5[4] , in_6[4], in_7[4], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_5(out[5], in_0[5], in_1[5], in_2[5], in_3[5], in_4[5], in_5[5] , in_6[5], in_7[5], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_6(out[6], in_0[6], in_1[6], in_2[6], in_3[6], in_4[6], in_5[6] , in_6[6], in_7[6], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_7(out[7], in_0[7], in_1[7], in_2[7], in_3[7], in_4[7], in_5[7] , in_6[7], in_7[7], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_8(out[8], in_0[8], in_1[8], in_2[8], in_3[8], in_4[8], in_5[8] , in_6[8], in_7[8], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_9(out[9], in_0[9], in_1[9], in_2[9], in_3[9], in_4[9], in_5[9] , in_6[9], in_7[9], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_10(out[10], in_0[10], in_1[10], in_2[10], in_3[10], in_4[10], in_5[10] , in_6[10], in_7[10], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_11(out[11], in_0[11], in_1[11], in_2[11], in_3[11], in_4[11], in_5[11] , in_6[11], in_7[11], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_12(out[12], in_0[12], in_1[12], in_2[12], in_3[12], in_4[12], in_5[12] , in_6[12], in_7[12], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_13(out[13], in_0[13], in_1[13], in_2[13], in_3[13], in_4[13], in_5[13] , in_6[13], in_7[13], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_14(out[14], in_0[14], in_1[14], in_2[14], in_3[14], in_4[14], in_5[14] , in_6[14], in_7[14], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_15(out[15], in_0[15], in_1[15], in_2[15], in_3[15], in_4[15], in_5[15] , in_6[15], in_7[15], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_16(out[16], in_0[16], in_1[16], in_2[16], in_3[16], in_4[16], in_5[16] , in_6[16], in_7[16], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_17(out[17], in_0[17], in_1[17], in_2[17], in_3[17], in_4[17], in_5[17] , in_6[17], in_7[17], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_18(out[18], in_0[18], in_1[18], in_2[18], in_3[18], in_4[18], in_5[18] , in_6[18], in_7[18], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_19(out[19], in_0[19], in_1[19], in_2[19], in_3[19], in_4[19], in_5[19] , in_6[19], in_7[19], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_20(out[20], in_0[20], in_1[20], in_2[20], in_3[20], in_4[20], in_5[20] , in_6[20], in_7[20], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_21(out[21], in_0[21], in_1[21], in_2[21], in_3[21], in_4[21], in_5[21] , in_6[21], in_7[21], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_22(out[22], in_0[22], in_1[22], in_2[22], in_3[22], in_4[22], in_5[22] , in_6[22], in_7[22], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_23(out[23], in_0[23], in_1[23], in_2[23], in_3[23], in_4[23], in_5[23] , in_6[23], in_7[23], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_24(out[24], in_0[24], in_1[24], in_2[24], in_3[24], in_4[24], in_5[24] , in_6[24], in_7[24], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_25(out[25], in_0[25], in_1[25], in_2[25], in_3[25], in_4[25], in_5[25] , in_6[25], in_7[25], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_26(out[26], in_0[26], in_1[26], in_2[26], in_3[26], in_4[26], in_5[26] , in_6[26], in_7[26], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_27(out[27], in_0[27], in_1[27], in_2[27], in_3[27], in_4[27], in_5[27] , in_6[27], in_7[27], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_28(out[28], in_0[28], in_1[28], in_2[28], in_3[28], in_4[28], in_5[28] , in_6[28], in_7[28], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_29(out[29], in_0[29], in_1[29], in_2[29], in_3[29], in_4[29], in_5[29] , in_6[29], in_7[29], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_30(out[30], in_0[30], in_1[30], in_2[30], in_3[30], in_4[30], in_5[30] , in_6[30], in_7[30], sel_2, sel_1, sel_0);
		mux_8x1_1bit mux_31(out[31], in_0[31], in_1[31], in_2[31], in_3[31], in_4[31], in_5[31] , in_6[31], in_7[31], sel_2, sel_1, sel_0);
		
	
	 
endmodule 
