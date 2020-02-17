module control_unit_testbench();
	  wire memread;
	  wire memtoreg;
	  wire memwrite;
	  wire regwrite;
	  wire [1:0] store_control;
	  wire extend;
	  wire lui_control;
	  wire [1:0] load_control;
	  //**hw4
	  wire regdest;
	  wire branch;
	  wire alusrc;
	  wire [1:0] aluop;
	  wire jumpControl;
	  wire jalControl;
	  wire jrControl;
	  reg [5:0] opcode;
	  
	  control_unit cu(memread,memtoreg,memwrite,regwrite,store_control,extend,lui_control,load_control,regdest,branch,alusrc,aluop,jumpControl,jalControl,jrControl,opcode);
	  
	  initial begin
			opcode=6'b100011;
			#20;
			opcode=6'b101011;
			#20;
			opcode=6'b100000;
			#20;
			opcode=6'b100100;
			#20;
			opcode=6'b100001;
			#20;
			opcode=6'b100101;
			#20;
			opcode=6'b001111;
			#20;
			opcode=6'b101000;
			#20;
			opcode=6'b101001;
			#20;
			opcode=6'b000000;
			#20;
			opcode=6'b000010;
			#20;
			opcode=6'b000011;
			#20;
			opcode=6'b001000;
			#20;
			opcode=6'b000100;
	  end
	  
	  initial begin
			$monitor("opcode=%6b memread=%1b memtoreg=%1b memwrite=%1b regwrite=%1b store_control=%2b extend=%1b lui_control=%1b load_control=%2b regdest=%1b branch=%1b alusrc=%1b aluop=%2b jump=%1b jal=%1b jr=%1b",opcode,memread,memtoreg,memwrite,regwrite,store_control,extend,lui_control,load_control,regdest,branch,alusrc,aluop,jumpControl,jalControl,jrControl);
	  end

endmodule