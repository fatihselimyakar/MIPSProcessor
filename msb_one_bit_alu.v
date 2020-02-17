//msb 1-bit ALU
//Purely implemented design in lecture4 slide.
//I got it by adding xor to the input of full adder and mux to the output of full adder.
module msb_one_bit_alu(input b,
						 input a,
						 input less, //no 3
						 input cin,
						 input [2:0]aluop,
						 output cout,
						 output out,
						 output set,
						 output v
						 );
	wire w1,w2,w3;
	wire no0,no1;
	xor_gate XOR1(w1,b,aluop[2]);
	full_adder FA1(cout,w2,cin,a,w1); //no 2
	
	and (no0,a,w1);//no 0
	or (no1,a,w1); //no 1
	
	xor_gate XOR2(v,cin,cout); //V
	xor_gate XOR3(set,v,w2); //set
	
	mux MUX1(out,no0,no1,w2,less,aluop[1:0]);

endmodule