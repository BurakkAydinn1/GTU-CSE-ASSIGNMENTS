module xor_gate_32 (
output [31:0]result, 
input [31:0]a,
input [31:0]b
);
	
	
	xor xor_0(result[0],a[0],b[0]);
	xor xor_1(result[1],a[1],b[1]);
	xor xor_2(result[2],a[2],b[2]);
	xor xor_3(result[3],a[3],b[3]);
	xor xor_4(result[4],a[4],b[4]);
	xor xor_5(result[5],a[5],b[5]);
	xor xor_6(result[6],a[6],b[6]);
	xor xor_7(result[7],a[7],b[7]);
	xor xor_8(result[8],a[8],b[8]);
	xor xor_9(result[9],a[9],b[9]);
	xor xor_10(result[10],a[10],b[10]);
	xor xor_11(result[11],a[11],b[11]);
	xor xor_12(result[12],a[12],b[12]);
	xor xor_13(result[13],a[13],b[13]);
	xor xor_14(result[14],a[14],b[14]);
	xor xor_15(result[15],a[15],b[15]);
	xor xor_16(result[16],a[16],b[16]);
	xor xor_17(result[17],a[17],b[17]);
	xor xor_18(result[18],a[18],b[18]);
	xor xor_19(result[19],a[19],b[19]);
	xor xor_20(result[20],a[20],b[20]);
	xor xor_21(result[21],a[21],b[21]);
	xor xor_22(result[22],a[22],b[22]);
	xor xor_23(result[23],a[23],b[23]);
	xor xor_24(result[24],a[24],b[24]);
	xor xor_25(result[25],a[25],b[25]);
	xor xor_26(result[26],a[26],b[26]);
	xor xor_27(result[27],a[27],b[27]);
	xor xor_28(result[28],a[28],b[28]);
	xor xor_29(result[29],a[29],b[29]);
	xor xor_30(result[30],a[30],b[30]);
	xor xor_31(result[31],a[31],b[31]);

	
endmodule 