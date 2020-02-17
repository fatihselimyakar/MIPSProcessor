module load_unit_testbench();
	wire [31:0] writeData;
	reg [31:0] readDataMem;
	reg [1:0] load_signal;
	
	load_unit luA(writeData,readDataMem,load_signal);
	
	initial begin
		readDataMem=32'b11111111111111111111111111111111 ; load_signal=2'b00;
		#20;
		readDataMem=32'b11111111111111111111111111111111 ; load_signal=2'b01;
		#20;
		readDataMem=32'b11111111111111111111111111111111 ; load_signal=2'b10;
		#20;
		readDataMem=32'b11111111111111111111111111111111 ; load_signal=2'b11;
		#20;
	end
 
	initial begin
		$monitor("writeData=%32b",writeData);
	end
	
endmodule