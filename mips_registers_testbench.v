//testbench for register data module
module mips_registers_testbench(); 
	reg signal_reg_write, clk;	
	reg [31:0] write_data;
	reg [4:0] read_reg_1,read_reg_2,write_reg;
	wire [31:0] read_data_1,read_data_2;

	mips_registers regtb ( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );
	initial begin
		read_reg_1= 5'b00000 ; read_reg_2= 5'b00001; write_reg=5'b00010 ; signal_reg_write=1'b1; clk=1'b1; write_data= 32'b11111111111111110000000000000000;
		#20;
		read_reg_1= 5'b00000 ; read_reg_2= 5'b00001; write_reg=5'b00010 ; signal_reg_write=1'b1; clk=1'b0; write_data= 32'b11111111111111110000000000000000;
		#20;
		read_reg_1= 5'b00000 ; read_reg_2= 5'b00010; write_reg=5'b00010 ; signal_reg_write=1'b0; clk=1'b1; write_data= 32'b11111111111111110000000000000000;
		#20;
		read_reg_1= 5'b00000 ; read_reg_2= 5'b00010; write_reg=5'b00010 ; signal_reg_write=1'b0; clk=1'b0; write_data= 32'b11111111111111110000000000000000;
		#20;

	end
 
	initial begin
		$monitor(" write=%32b Read_data_1_addres=%5b, Read_data_2_addres=%5b ,data_1=%32b, data_2=%32b, clk=%1b",write_data,read_reg_1,read_reg_2,read_data_1,read_data_2,clk);
	end
 
endmodule 