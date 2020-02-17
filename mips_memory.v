module mips_memory(output reg[31:0] read_data,
						input  [31:0] address,write_data,
						input [1:0]store_control_signal,
						input signal_mem_read,signal_mem_write,clk
						);
	
	reg [31:0] data_mem [255:0];

	initial begin
		$readmemb("memory.txt", data_mem);
	end

	always @(negedge clk) begin
		if(signal_mem_write) begin
			if(store_control_signal[1]==0 & store_control_signal[0]==0) begin
				data_mem[ address]=write_data; 
			end
			else if(store_control_signal[1]==0 & store_control_signal[0]==1) begin
				data_mem[address][15:0]=write_data[15:0];
			end
			else if(store_control_signal[1]==1 & store_control_signal[0]==0) begin
				data_mem[address][7:0]=write_data[7:0];
			end
			$writememb("memory.txt", data_mem);
		end
	end
	always @(*) begin
		if(signal_mem_read) begin
			read_data = data_mem[address];
		end
	end

endmodule