module mux2to1_testbench();
	wire out;
	reg c0;
	reg c1;
	reg sel;
	
	mux2to1 muxA(out,c0,c1,sel);
	initial begin
		c0= 1'b1 ; c1= 1'b0; sel= 1'b0;
		#20;
		c0= 1'b1 ; c1= 1'b0; sel= 1'b1;
		#20;
	end
 
	initial begin
		$monitor(" c0=%1b c1=%1b sel=%1b out=%1b",c0,c1,sel,out);
	end
							
							
endmodule