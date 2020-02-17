//1-bit FULL ADDER
//Purely implemented design in lecture4 slide.
module full_adder(output cout,
						output out,
						input cin,
						input a,
						input b
						);	
		wire w1,w2,w3,w4;
		
		xor_gate XOR1(w1,a,b);
		xor_gate XOR2(out,cin,w1);
		
		and (w3,a,b);
		and (w4,cin,w1);
		or (cout,w3,w4);
		
endmodule