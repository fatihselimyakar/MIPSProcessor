module alu_control(output [2:0] aluctr,
						 input [1:0] aluop,
						 input [5:0] func
					 );
					 
	wire w1,w2,w3,w4;
	
	and (w1,aluop[1],func[1]);
	or (aluctr[2],aluop[0],w1);
	
	not(w2,aluop[1]);
	not(w3,func[2]);
	or(aluctr[1],w2,w3);
	
	or(w4,func[3],func[0]);
	and(aluctr[0],w4,aluop[1]);
			 
endmodule