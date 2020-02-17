module lui_unit_testbench();
	wire [31:0] writeData;
	reg [15:0] immediate;
	reg [31:0] memoryOut;
	reg lui_control_signal;

	lui_unit luiA(writeData,immediate,memoryOut,lui_control_signal);
	
	initial begin
		immediate=16'b1111111111111111; memoryOut=32'b01010101010101010101010101010101; lui_control_signal=1'b0;
		#20;
		immediate=16'b1111111111111111; memoryOut=32'b01010101010101010101010101010101; lui_control_signal=1'b1;
	end
	
	initial begin
		$monitor("immediate=%16b memoryOut=%32b lui_control_signal=%1b writeData=%32b",immediate,memoryOut,lui_control_signal,writeData);
	end

endmodule