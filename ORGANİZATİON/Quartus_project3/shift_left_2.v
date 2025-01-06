module shift_left_2 ( 
output [31:0] shifted_address, 
input [31:0] address

); 

 and and0(shifted_address[0], 1 ,0);
 and and1(shifted_address[1], 1 ,0);
 and and2(shifted_address[2], 1, address[0]);
 and and3(shifted_address[3], 1, address[1]);
 and and4(shifted_address[4], 1, address[2]);
 and and5(shifted_address[5], 1, address[3]);
 and and6(shifted_address[6], 1, address[4]);
 and and7(shifted_address[7], 1, address[5]);
 and and8(shifted_address[8], 1, address[6]);
 and and9(shifted_address[9], 1, address[7]);
 and and10(shifted_address[10], 1, address[8]);
 and and11(shifted_address[11], 1, address[9]);
 and and12(shifted_address[12], 1, address[10]);
 and and13(shifted_address[13], 1, address[11]);
 and and14(shifted_address[14], 1, address[12]);
 and and15(shifted_address[15], 1, address[13]);
 and and16(shifted_address[16], 1, address[14]);
 and and17(shifted_address[17], 1, address[15]);
 and and18(shifted_address[18], 1, address[16]);
 and and19(shifted_address[19], 1, address[17]);
 and and20(shifted_address[20], 1, address[18]);
 and and21(shifted_address[21], 1, address[19]);
 and and22(shifted_address[22], 1, address[20]);
 and and23(shifted_address[23], 1, address[21]);
 and and24(shifted_address[24], 1, address[22]);
 and and25(shifted_address[25], 1, address[23]);
 and and26(shifted_address[26], 1, address[24]);
 and and27(shifted_address[27], 1, address[25]);
 and and28(shifted_address[28], 1, address[26]);
 and and29(shifted_address[29], 1, address[27]);
 and and30(shifted_address[30], 1, address[28]);
 and and31(shifted_address[31], 1, address[29]);
 
 



endmodule 