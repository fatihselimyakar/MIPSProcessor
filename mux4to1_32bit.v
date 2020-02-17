module mux4to1_32bit(output[31:0]out,
							input[31:0]c0,
							input[31:0]c1,
							input[31:0]c2,
							input[31:0]c3,
							input[1:0] sel);
	wire [31:0] w1,w2;
	mux2to1_32bit mux4_32_1(w1,c0,c1,sel[0]);
	mux2to1_32bit mux4_32_2(w2,c2,c3,sel[0]);
	mux2to1_32bit mux4_32_3(out,w1,w2,sel[1]);

endmodule