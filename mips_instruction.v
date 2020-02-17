module mips_instruction(output reg[31:0] instruction,
								input [31:0] read_address);
	reg [31:0] instructions [255:0];
	
	initial begin
		$readmemb("instruction.txt",instructions);
	end
	
	always @(*) begin
		instruction=instructions[read_address];
	end

endmodule