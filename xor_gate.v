//2 INPUT XOR GATE
//I implement the (a+b)*('(ab))
module xor_gate(output out,
					 input a,
					 input b
					 );
	wire andnot;
	wire w1,w2;
	
	or (w1,a,b);
	
	and (w2,a,b);
	not (andnot,w2);
	
	and (out,andnot,w1);
					 			 
endmodule