module extend_testbench();
	reg signal;
	reg [15:0]in;
	wire [31:0]out;
	
	extend ex(out,in,signal);
	
	initial begin
		in= 16'b1000001111111111; signal=1'b1;
		#20;
		in= 16'b1000001111111111; signal=1'b0;
		#20;
		in= 16'b0000001111111111; signal=1'b1;
		#20;
		in= 16'b0000001111111111; signal=1'b0;
	end
 
	initial begin
		$monitor("in=%16b,out=%32b,signal=%1b",in,out,signal);
	end
endmodule