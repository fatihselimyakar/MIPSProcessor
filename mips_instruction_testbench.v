//testbench for instruction data module
module mips_instruction_testbench(); 	
	reg [31:0] read_address;
	wire [31:0] instruction;

	mips_instruction insta(instruction,read_address);
	
	initial begin
		read_address= 32'b00000000000000000000000000000000;
		#20;
	end
 
	initial begin
		$monitor("read_address=%32b,instruction=%32b",read_address,instruction);
	end
 
endmodule 