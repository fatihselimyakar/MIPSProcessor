module mux2to1_32bit_testbench();
	wire[31:0]out;
	reg[31:0]c0;
	reg[31:0]c1;
	reg sel;
	
	mux2to1_32bit muxA(out,c0,c1,sel);
	initial begin
		c0= 32'b00 ; c1= 32'b11; sel= 1'b0;
		#20;
		c0= 32'b00 ; c1= 32'b11; sel= 1'b1;
		#20;
	end
 
	initial begin
		$monitor(" c0=%32b c1=%32b sel=%1b out=%32b",c0,c1,sel,out);
	end
							
							
endmodule