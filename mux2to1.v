//2:1 1-bit MULTIPLEXER
//Allows you to select 1 out of 2 1-bit binary numbers
module mux2to1 (output out,
				input c0,
				input c1,
				input sel
				);
	wire selNot;
	wire w1,w2;
	
	not (selNot,sel);
	
	and (w1,c0,selNot);
	and (w2,c1,sel);
	
	or or1(out,w1,w2);

endmodule
 
