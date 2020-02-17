//4:1 MULTIPLEXER
//Allows you to select 1 out of 4 1-bit binary numbers
module mux (output out,
				input c0,
				input c1,
				input c2,
				input c3,
				input [1:0] sel
				);
	wire s0not,s1not;
	wire w1,w2,w3,w4;
	
	not (s0not,sel[0]);
	not (s1not,sel[1]);
	
	and (w1,c0,s1not,s0not);
	and (w2,c1,s1not,sel[0]);
	and (w3,c2,sel[1],s0not);
	and (w4,c3,sel[1],sel[0]);
	
	or or1(out,w1,w2,w3,w4);

endmodule





