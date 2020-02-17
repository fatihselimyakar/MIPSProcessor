module lui_unit(output [31:0] writeData,
					 input [15:0] immediate,
					 input [31:0] memoryOut,
					 input lui_control_signal);
	
	wire [31:0] immPlusZeros;
	
	or(immPlusZeros[0],1'b0,1'b0); or(immPlusZeros[1],1'b0,1'b0); or(immPlusZeros[2],1'b0,1'b0); or(immPlusZeros[3],1'b0,1'b0);
	or(immPlusZeros[4],1'b0,1'b0); or(immPlusZeros[5],1'b0,1'b0); or(immPlusZeros[6],1'b0,1'b0); or(immPlusZeros[7],1'b0,1'b0);
	or(immPlusZeros[8],1'b0,1'b0); or(immPlusZeros[9],1'b0,1'b0); or(immPlusZeros[10],1'b0,1'b0); or(immPlusZeros[11],1'b0,1'b0);
	or(immPlusZeros[12],1'b0,1'b0); or(immPlusZeros[13],1'b0,1'b0); or(immPlusZeros[14],1'b0,1'b0); or(immPlusZeros[15],1'b0,1'b0);
	or(immPlusZeros[16],1'b0,immediate[0]); or(immPlusZeros[17],1'b0,immediate[1]); or(immPlusZeros[18],1'b0,immediate[2]); or(immPlusZeros[19],1'b0,immediate[3]);
	or(immPlusZeros[20],1'b0,immediate[4]); or(immPlusZeros[21],1'b0,immediate[5]); or(immPlusZeros[22],1'b0,immediate[6]); or(immPlusZeros[23],1'b0,immediate[7]);
	or(immPlusZeros[24],1'b0,immediate[8]); or(immPlusZeros[25],1'b0,immediate[9]); or(immPlusZeros[26],1'b0,immediate[10]); or(immPlusZeros[27],1'b0,immediate[11]);
	or(immPlusZeros[28],1'b0,immediate[12]); or(immPlusZeros[29],1'b0,immediate[13]); or(immPlusZeros[30],1'b0,immediate[14]); or(immPlusZeros[31],1'b0,immediate[15]);

	mux2to1_32bit muxA(writeData,memoryOut,immPlusZeros,lui_control_signal);

endmodule