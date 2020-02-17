module mux4to1_32bit_testbench();
	wire[31:0]out;
	reg[31:0]c0;
	reg[31:0]c1;
	reg[31:0]c2;
	reg[31:0]c3;
	reg[1:0] sel;
	
	mux4to1_32bit muxA(out,c0,c1,c2,c3,sel);
	initial begin
		c0= 32'b00 ; c1= 32'b01; c2=32'b10 ; c3=32'b11;  sel= 2'b00;
		#20;
		c0= 32'b00 ; c1= 32'b01; c2=32'b10 ; c3=32'b11;  sel= 2'b01;
		#20;
		c0= 32'b00 ; c1= 32'b01; c2=32'b10 ; c3=32'b11;  sel= 2'b10;
		#20;
		c0= 32'b00 ; c1= 32'b01; c2=32'b10 ; c3=32'b11;  sel= 2'b11;
		#20;
	end
 
	initial begin
		$monitor(" c0=%32b c1=%32b c2=%32b c3=%32b sel=%2b out=%32b",c0,c1,c2,c3,sel,out);
	end


endmodule