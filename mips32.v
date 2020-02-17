module mips32(clock);
	
	input clock;
	//program counter
	reg[31:0] PC = 32'b0;
	reg [31:0] registers [31:0];
	wire [31:0] instruction;
	
	// Parse instruction
	wire [4:0] rs, rt;
	wire [15:0] immediate;
	wire [5:0] opcode;

	//Signals
	wire memtoread,memtoreg,memwrite,extend,lui_control,regwrite;
	wire [1:0] load_control,store_control;
	//For **hw4 signals
	wire regdest,branch,alusrc,jump,pcsrc,jal,jr;
	wire [1:0] aluop;
	wire [2:0] aluctr;
	
	//register wires
	wire [31:0] write_data,last_write_data,read_data_1,read_data_2;
	wire [31:0] extend_out;
	wire [4:0] writeRegister;//for writing rt or rd **hw4
	
	//alu wires
	wire cout,v,zero;
	wire [31:0] alu_out,alu_input;//**alu_input **hw4
	
	//memory and load unit wires
	wire [31:0] memoryOut,read_data_mem;
	
	
	mips_instruction mi1(instruction,PC);

	control_unit cu1(memread,memtoreg,memwrite,regwrite,store_control,extend,lui_control,load_control,regdest,branch,alusrc,aluop,jump,jal,jr,instruction[31:26]);
	
	//input of register's will write port **hw4
	mux2to1 minimux1(writeRegister[4],instruction[20],instruction[15],regdest);
	mux2to1 minimux2(writeRegister[3],instruction[19],instruction[14],regdest);
	mux2to1 minimux3(writeRegister[2],instruction[18],instruction[13],regdest);
	mux2to1 minimux4(writeRegister[1],instruction[17],instruction[12],regdest);
	mux2to1 minimux5(writeRegister[0],instruction[16],instruction[11],regdest);
	
	mips_registers mr1(read_data_1,read_data_2,write_data,instruction[25:21],instruction[20:16],writeRegister,regwrite,clock );
	
	extend ex1(extend_out,instruction[15:0],extend);
	
	lui_unit lui1(write_data,instruction[15:0],last_write_data,lui_control);
	
	//mux that is after the data memory **hw4
	mux2to1_32bit bigmux2(last_write_data,alu_out,memoryOut,memtoreg);
	
	//mux that is before the main alu **hw4
	mux2to1_32bit bigmux1(alu_input,read_data_2,extend_out,alusrc);
	
	//alu_control **hw4
	alu_control ac1(aluctr,aluop,instruction[5:0]);
	
	//aluctr **hw4
	big_alu ba1(read_data_1,alu_input,aluctr,cout,alu_out,v,zero);
	
	and (pcsrc,zero,branch);
	
	//program counter's increasing
	always @(negedge clock) begin
		//BRANCH instruction
		if(pcsrc)begin
			PC = PC+1;
			PC=PC+extend_out;
		end
		//JUMP instruction
		else if(jump)
			PC={2'b0,PC[31:28],instruction[25:0]};
		//JAL instruction
		else if(jal) begin
			$readmemb("registers.txt",registers);
			registers[31] = PC+1;
			PC={2'b0,PC[31:28],instruction[25:0]};
			$writememb("registers.txt", registers);
			$display("register 31 is:%32b",registers[31]); 
		end
		//JR instruction
		else if(jr)
			PC=read_data_1;
		else
			PC = PC+1;
	end 
	
	mips_memory mema(read_data_mem,alu_out,read_data_2,store_control,memread,memwrite,clock);
	
	load_unit lu1(memoryOut,read_data_mem,load_control);
	
	
	initial begin
		$monitor(" PC: %2d, instruction: %32b \n opcode: %6b, rs: %5b, rt: %5b, rd:%5b func:%6b immediate: %16b \n sig_reg_write: %1b, sig_mem_write: %1b, sig_mem_read: %1b, extend: %1b, load: %2b, clock: %1b \n Memory: read_data: %32b, address: %32b, write_data: %32b \n Register: read_data_1: %32b, read_data_2: %32b, write_data: %32b \n", PC, instruction,instruction[31:26],instruction[25:21],instruction[20:16],instruction[15:11],instruction[5:0],instruction[15:0],regwrite,memwrite,memtoread, extend, load_control[1:0], clock,read_data_mem,alu_out,read_data_2, read_data_1, read_data_2, write_data);
	end

endmodule