module load_unit(output [31:0] writeData,
					  input [31:0] readDataMem,
					  input [1:0] load_signal);
	wire [31:0] lb,lh,lw;
	
	or(lb[0],1'b0,readDataMem[0]); or(lb[1],1'b0,readDataMem[1]); or(lb[2],1'b0,readDataMem[2]); or(lb[3],1'b0,readDataMem[3]);
	or(lb[4],1'b0,readDataMem[4]); or(lb[5],1'b0,readDataMem[5]); or(lb[6],1'b0,readDataMem[6]); or(lb[7],1'b0,readDataMem[7]);
	or(lb[8],1'b0,1'b0); or(lb[9],1'b0,1'b0); or(lb[10],1'b0,1'b0); or(lb[11],1'b0,1'b0);
	or(lb[12],1'b0,1'b0); or(lb[13],1'b0,1'b0); or(lb[14],1'b0,1'b0); or(lb[15],1'b0,1'b0);
	or(lb[16],1'b0,1'b0); or(lb[17],1'b0,1'b0); or(lb[18],1'b0,1'b0); or(lb[19],1'b0,1'b0);
	or(lb[20],1'b0,1'b0); or(lb[21],1'b0,1'b0); or(lb[22],1'b0,1'b0); or(lb[23],1'b0,1'b0);
	or(lb[24],1'b0,1'b0); or(lb[25],1'b0,1'b0); or(lb[26],1'b0,1'b0); or(lb[27],1'b0,1'b0);
	or(lb[28],1'b0,1'b0); or(lb[29],1'b0,1'b0); or(lb[30],1'b0,1'b0); or(lb[31],1'b0,1'b0);
	
	or(lh[0],1'b0,readDataMem[0]); or(lh[1],1'b0,readDataMem[1]); or(lh[2],1'b0,readDataMem[2]); or(lh[3],1'b0,readDataMem[3]);
	or(lh[4],1'b0,readDataMem[4]); or(lh[5],1'b0,readDataMem[5]); or(lh[6],1'b0,readDataMem[6]); or(lh[7],1'b0,readDataMem[7]);
	or(lh[8],1'b0,readDataMem[8]); or(lh[9],1'b0,readDataMem[9]); or(lh[10],1'b0,readDataMem[10]); or(lh[11],1'b0,readDataMem[11]);
	or(lh[12],1'b0,readDataMem[12]); or(lh[13],1'b0,readDataMem[13]); or(lh[14],1'b0,readDataMem[14]); or(lh[15],1'b0,readDataMem[15]);
	or(lh[16],1'b0,1'b0); or(lh[17],1'b0,1'b0); or(lh[18],1'b0,1'b0); or(lh[19],1'b0,1'b0);
	or(lh[20],1'b0,1'b0); or(lh[21],1'b0,1'b0); or(lh[22],1'b0,1'b0); or(lh[23],1'b0,1'b0);
	or(lh[24],1'b0,1'b0); or(lh[25],1'b0,1'b0); or(lh[26],1'b0,1'b0); or(lh[27],1'b0,1'b0);
	or(lh[28],1'b0,1'b0); or(lh[29],1'b0,1'b0); or(lh[30],1'b0,1'b0); or(lh[31],1'b0,1'b0);
	
	or(lw[0],1'b0,readDataMem[0]); or(lw[1],1'b0,readDataMem[1]); or(lw[2],1'b0,readDataMem[2]); or(lw[3],1'b0,readDataMem[3]);
	or(lw[4],1'b0,readDataMem[4]); or(lw[5],1'b0,readDataMem[5]); or(lw[6],1'b0,readDataMem[6]); or(lw[7],1'b0,readDataMem[7]);
	or(lw[8],1'b0,readDataMem[8]); or(lw[9],1'b0,readDataMem[9]); or(lw[10],1'b0,readDataMem[10]); or(lw[11],1'b0,readDataMem[11]);
	or(lw[12],1'b0,readDataMem[12]); or(lw[13],1'b0,readDataMem[13]); or(lw[14],1'b0,readDataMem[14]); or(lw[15],1'b0,readDataMem[15]);
	or(lw[16],1'b0,readDataMem[16]); or(lw[17],1'b0,readDataMem[17]); or(lw[18],1'b0,readDataMem[18]); or(lw[19],1'b0,readDataMem[19]);
	or(lw[20],1'b0,readDataMem[20]); or(lw[21],1'b0,readDataMem[21]); or(lw[22],1'b0,readDataMem[22]); or(lw[23],1'b0,readDataMem[23]);
	or(lw[24],1'b0,readDataMem[24]); or(lw[25],1'b0,readDataMem[25]); or(lw[26],1'b0,readDataMem[26]); or(lw[27],1'b0,readDataMem[27]);
	or(lw[28],1'b0,readDataMem[28]); or(lw[29],1'b0,readDataMem[29]); or(lw[30],1'b0,readDataMem[30]); or(lw[31],1'b0,readDataMem[31]);
	
	mux4to1_32bit muxA(writeData,lb,lh,lw,32'bx,load_signal);
	
	always@(*)begin
		$display("readDataMem=%32b",readDataMem);
	end

endmodule