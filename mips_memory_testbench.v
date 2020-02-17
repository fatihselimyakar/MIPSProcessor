//testbench for memory data module
module mips_memory_testbench(); 
	reg [1:0] signal_store_control;
	reg signal_mem_read,signal_mem_write,clk;	
	reg [31:0] write_data,address;
	wire [31:0] read_data;

	mips_memory mema(read_data,address,write_data,signal_store_control,signal_mem_read,signal_mem_write,clk);
	
	initial begin
		signal_store_control=2'b00; signal_mem_write=1'b1; signal_mem_read=1'b0; clk=1'b1; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000000;
		#20;
		signal_store_control=2'b00; signal_mem_write=1'b1; signal_mem_read=1'b0; clk=1'b0; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000000;
		#20;
		signal_store_control=2'b01; signal_mem_write=1'b1; signal_mem_read=1'b0; clk=1'b1; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000001;
		#20;
		signal_store_control=2'b01; signal_mem_write=1'b1; signal_mem_read=1'b0; clk=1'b0; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000001;
		#20;
		signal_store_control=2'b10; signal_mem_write=1'b1; signal_mem_read=1'b0; clk=1'b1; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000010;
		#20;
		signal_store_control=2'b10; signal_mem_write=1'b1; signal_mem_read=1'b0; clk=1'b0; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000010;
		#20;
		signal_store_control=2'b00; signal_mem_write=1'b0; signal_mem_read=1'b1; clk=1'b1; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000000;
		#20;
		signal_store_control=2'b00; signal_mem_write=1'b0; signal_mem_read=1'b1; clk=1'b0; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000000;
		#20;
		signal_store_control=2'b00; signal_mem_write=1'b0; signal_mem_read=1'b1; clk=1'b1; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000001;
		#20;
		signal_store_control=2'b00; signal_mem_write=1'b0; signal_mem_read=1'b1; clk=1'b0; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000001;
		#20;
		signal_store_control=2'b00; signal_mem_write=1'b0; signal_mem_read=1'b1; clk=1'b1; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000010;
		#20;
		signal_store_control=2'b00; signal_mem_write=1'b0; signal_mem_read=1'b1; clk=1'b0; write_data= 32'b11111111111111111111111111111111; address= 32'b00000000000000000000000000000010;



	end
 
	initial begin
			$monitor(" signal_mem_write=%1b, signal_mem_read=%1b, clk=%1b, write_data=%32b ,address=%32b, read_data=%32b",signal_mem_write,signal_mem_read,clk,write_data,address,read_data);
	end
 
endmodule 
