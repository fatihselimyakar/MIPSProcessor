//2:1 32-bit MULTIPLEXER
//Allows you to select 1 out of 2 1-bit binary numbers
module mux2to1_32bit(output[31:0]out,
							input[31:0] c0,
							input[31:0]c1,
							input sel);
							
	mux2to1 mux0(out[0],c0[0],c1[0],sel); mux2to1 mux1(out[1],c0[1],c1[1],sel);
	mux2to1 mux2(out[2],c0[2],c1[2],sel); mux2to1 mux3(out[3],c0[3],c1[3],sel);
	mux2to1 mux4(out[4],c0[4],c1[4],sel); mux2to1 mux5(out[5],c0[5],c1[5],sel);
	mux2to1 mux6(out[6],c0[6],c1[6],sel); mux2to1 mux7(out[7],c0[7],c1[7],sel);
	mux2to1 mux8(out[8],c0[8],c1[8],sel); mux2to1 mux9(out[9],c0[9],c1[9],sel);
	mux2to1 mux10(out[10],c0[10],c1[10],sel); mux2to1 mux11(out[11],c0[11],c1[11],sel);
	mux2to1 mux12(out[12],c0[12],c1[12],sel); mux2to1 mux13(out[13],c0[13],c1[13],sel);
	mux2to1 mux14(out[14],c0[14],c1[14],sel); mux2to1 mux15(out[15],c0[15],c1[15],sel);
	mux2to1 mux16(out[16],c0[16],c1[16],sel); mux2to1 mux17(out[17],c0[17],c1[17],sel);
	mux2to1 mux18(out[18],c0[18],c1[18],sel); mux2to1 mux19(out[19],c0[19],c1[19],sel);
	mux2to1 mux20(out[20],c0[20],c1[20],sel); mux2to1 mux21(out[21],c0[21],c1[21],sel);
	mux2to1 mux22(out[22],c0[22],c1[22],sel); mux2to1 mux23(out[23],c0[23],c1[23],sel);
	mux2to1 mux24(out[24],c0[24],c1[24],sel); mux2to1 mux25(out[25],c0[25],c1[25],sel);
	mux2to1 mux26(out[26],c0[26],c1[26],sel); mux2to1 mux27(out[27],c0[27],c1[27],sel);
	mux2to1 mux28(out[28],c0[28],c1[28],sel); mux2to1 mux29(out[29],c0[29],c1[29],sel);
	mux2to1 mux30(out[30],c0[30],c1[30],sel); mux2to1 mux31(out[31],c0[31],c1[31],sel);
	
endmodule