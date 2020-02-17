//32-bit ALU
//Purely implemented design in lecture4 slide.
//I got it by adding 31 times 1-bit alu and 1 times msb-1-bit alu one by one.In order to find cout, continuosly transport the cin to cX.
//the first less bit is set, and the first cin is aluop[2]
module big_alu(input [31:0]b,
					 input [31:0]a,
					 input [2:0]aluop,
					 output cout,
					 output [31:0]out,
					 output v,
					 output zOut
					 );
					 
	wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30;
	wire set;
	wire [15:0]z;
	wire [7:0]z2;
	wire [3:0]z3;
	wire [1:0]z4;
	wire z5;
	one_bit_alu ALU0(b[0],a[0],set,aluop[2],aluop,c0,out[0]);
	one_bit_alu ALU1(b[1],a[1],1'b0,c0,aluop,c1,out[1]);
	one_bit_alu ALU2(b[2],a[2],1'b0,c1,aluop,c2,out[2]);
	one_bit_alu ALU3(b[3],a[3],1'b0,c2,aluop,c3,out[3]);
	one_bit_alu ALU4(b[4],a[4],1'b0,c3,aluop,c4,out[4]);
	one_bit_alu ALU5(b[5],a[5],1'b0,c4,aluop,c5,out[5]);
	one_bit_alu ALU6(b[6],a[6],1'b0,c5,aluop,c6,out[6]);
	one_bit_alu ALU7(b[7],a[7],1'b0,c6,aluop,c7,out[7]);
	one_bit_alu ALU8(b[8],a[8],1'b0,c7,aluop,c8,out[8]);
	one_bit_alu ALU9(b[9],a[9],1'b0,c8,aluop,c9,out[9]);
	one_bit_alu ALU10(b[10],a[10],1'b0,c9,aluop,c10,out[10]);
	one_bit_alu ALU11(b[11],a[11],1'b0,c10,aluop,c11,out[11]);
	one_bit_alu ALU12(b[12],a[12],1'b0,c11,aluop,c12,out[12]);
	one_bit_alu ALU13(b[13],a[13],1'b0,c12,aluop,c13,out[13]);
	one_bit_alu ALU14(b[14],a[14],1'b0,c13,aluop,c14,out[14]);
	one_bit_alu ALU15(b[15],a[15],1'b0,c14,aluop,c15,out[15]);
	one_bit_alu ALU16(b[16],a[16],1'b0,c15,aluop,c16,out[16]);
	one_bit_alu ALU17(b[17],a[17],1'b0,c16,aluop,c17,out[17]);
	one_bit_alu ALU18(b[18],a[18],1'b0,c17,aluop,c18,out[18]);
	one_bit_alu ALU19(b[19],a[19],1'b0,c18,aluop,c19,out[19]);
	one_bit_alu ALU20(b[20],a[20],1'b0,c19,aluop,c20,out[20]);
	one_bit_alu ALU21(b[21],a[21],1'b0,c20,aluop,c21,out[21]);
	one_bit_alu ALU22(b[22],a[22],1'b0,c21,aluop,c22,out[22]);
	one_bit_alu ALU23(b[23],a[23],1'b0,c22,aluop,c23,out[23]);
	one_bit_alu ALU24(b[24],a[24],1'b0,c23,aluop,c24,out[24]);
	one_bit_alu ALU25(b[25],a[25],1'b0,c24,aluop,c25,out[25]);
	one_bit_alu ALU26(b[26],a[26],1'b0,c25,aluop,c26,out[26]);
	one_bit_alu ALU27(b[27],a[27],1'b0,c26,aluop,c27,out[27]);
	one_bit_alu ALU28(b[28],a[28],1'b0,c27,aluop,c28,out[28]);
	one_bit_alu ALU29(b[29],a[29],1'b0,c28,aluop,c29,out[29]);
	one_bit_alu ALU30(b[30],a[30],1'b0,c29,aluop,c30,out[30]);
	msb_one_bit_alu ALU31(b[31],a[31],1'b0,c30,aluop,cout,out[31],set,v);
	
	or(z[0],out[0],out[1]); or(z[1],out[2],out[3]); or(z[2],out[4],out[5]); or(z[3],out[6],out[7]); 
	or(z[4],out[8],out[9]); or(z[5],out[10],out[11]); or(z[6],out[12],out[13]); or(z[7],out[14],out[15]);
	or(z[8],out[16],out[17]); or(z[9],out[18],out[19]); or(z[10],out[20],out[21]); or(z[11],out[22],out[23]);
	or(z[12],out[24],out[25]); or(z[13],out[26],out[27]); or(z[14],out[28],out[29]); or(z[15],out[30],out[31]);
	
	or(z2[0],z[0],z[1]); or(z2[1],z[2],z[3]); or(z2[2],z[4],z[5]); or(z2[3],z[6],z[7]); 
	or(z2[4],z[8],z[9]); or(z2[5],z[10],z[11]); or(z2[6],z[12],z[13]); or(z2[7],z[14],z[15]);

	or(z3[0],z2[0],z2[1]); or(z3[1],z2[2],z2[3]); or(z3[2],z2[4],z2[5]); or(z3[3],z2[6],z2[7]); 
	
	or(z4[0],z3[0],z3[1]); or(z4[1],z3[2],z3[3]);
	
	or(z5,z4[0],z4[1]);
	
	not(zOut,z5);
endmodule