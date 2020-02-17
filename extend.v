module extend(output [31:0] out,
				  input [15:0] in,
				  input extend_signal);
	wire [31:0]zero_extend,one_extend,sign_extend;
	wire cout,v;
	
	or(sign_extend[0],in[0],1'b0); or(sign_extend[1],in[1],1'b0); or(sign_extend[2],in[2],1'b0); or(sign_extend[3],in[3],1'b0);
	or(sign_extend[4],in[4],1'b0); or(sign_extend[5],in[5],1'b0); or(sign_extend[6],in[6],1'b0); or(sign_extend[7],in[7],1'b0);
	or(sign_extend[8],in[8],1'b0); or(sign_extend[9],in[9],1'b0); or(sign_extend[10],in[10],1'b0); or(sign_extend[11],in[11],1'b0);
	or(sign_extend[12],in[12],1'b0); or(sign_extend[13],in[13],1'b0); or(sign_extend[14],in[14],1'b0); or(sign_extend[15],in[15],1'b0);
	or(sign_extend[16],in[15],1'b0); or(sign_extend[17],in[15],1'b0); or(sign_extend[18],in[15],1'b0); or(sign_extend[19],in[15],1'b0);
	or(sign_extend[20],in[15],1'b0); or(sign_extend[21],in[15],1'b0); or(sign_extend[22],in[15],1'b0); or(sign_extend[23],in[15],1'b0);
	or(sign_extend[24],in[15],1'b0); or(sign_extend[25],in[15],1'b0); or(sign_extend[26],in[15],1'b0); or(sign_extend[27],in[15],1'b0);
	or(sign_extend[28],in[15],1'b0); or(sign_extend[29],in[15],1'b0); or(sign_extend[30],in[15],1'b0); or(sign_extend[31],in[15],1'b0);
	
	or(zero_extend[0],in[0],1'b0); or(zero_extend[1],in[1],1'b0); or(zero_extend[2],in[2],1'b0); or(zero_extend[3],in[3],1'b0);
	or(zero_extend[4],in[4],1'b0); or(zero_extend[5],in[5],1'b0); or(zero_extend[6],in[6],1'b0); or(zero_extend[7],in[7],1'b0);
	or(zero_extend[8],in[8],1'b0); or(zero_extend[9],in[9],1'b0); or(zero_extend[10],in[10],1'b0); or(zero_extend[11],in[11],1'b0);
	or(zero_extend[12],in[12],1'b0); or(zero_extend[13],in[13],1'b0); or(zero_extend[14],in[14],1'b0); or(zero_extend[15],in[15],1'b0);
	or(zero_extend[16],1'b0,1'b0); or(zero_extend[17],1'b0,1'b0); or(zero_extend[18],1'b0,1'b0); or(zero_extend[19],1'b0,1'b0);
	or(zero_extend[20],1'b0,1'b0); or(zero_extend[21],1'b0,1'b0); or(zero_extend[22],1'b0,1'b0); or(zero_extend[23],1'b0,1'b0);
	or(zero_extend[24],1'b0,1'b0); or(zero_extend[25],1'b0,1'b0); or(zero_extend[26],1'b0,1'b0); or(zero_extend[27],1'b0,1'b0);
	or(zero_extend[28],1'b0,1'b0); or(zero_extend[29],1'b0,1'b0); or(zero_extend[30],1'b0,1'b0); or(zero_extend[31],1'b0,1'b0);
	
	mux2to1_32bit mux(out,zero_extend,sign_extend,extend_signal);
	
endmodule