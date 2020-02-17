module control_unit(output memread,
						  output memtoreg,
						  output memwrite,
						  output regwrite,
						  output [1:0] store_control,
						  output extend,
						  output lui_control,
						  output [1:0] load_control,
						  //**hw4
						  output regdest,
						  output branch,
						  output alusrc,
						  output [1:0] aluop,
						  output jumpControl,
						  output jalControl,
						  output jrControl,
						  input [5:0] opcode);
	
	wire [5:0] lw,sw,lb,lbu,lh,lhu,lui,sb,sh,rtype,jump,jal,jr,beq;
	wire sw_wire,sb_wire,sh_wire,lh_wire,lhu_wire,lb_wire,lw_wire,lbu_wire,lui_wire,rtype_wire,jump_wire,jal_wire,jr_wire,beq_wire;
	
	or(sw[5],opcode[5],1'b0); not(sw[4],opcode[4]); or(sw[3],opcode[3],1'b0); not(sw[2],opcode[2]); or(sw[1],opcode[1],1'b0); or(sw[0],opcode[0],1'b0);
	and(sw_wire,sw[5],sw[4],sw[3],sw[2],sw[1],sw[0]);
	
	or(sb[5],opcode[5],1'b0); not(sb[4],opcode[4]); or(sb[3],opcode[3],1'b0); not(sb[2],opcode[2]); not(sb[1],opcode[1]); not(sb[0],opcode[0]);
	and(sb_wire,sb[5],sb[4],sb[3],sb[2],sb[1],sb[0]);
	
	or(sh[5],opcode[5],1'b0); not(sh[4],opcode[4]); or(sh[3],opcode[3],1'b0); not(sh[2],opcode[2]); not(sh[1],opcode[1]); or(sh[0],opcode[0],1'b0);
	and(sh_wire,sh[5],sh[4],sh[3],sh[2],sh[1],sh[0]);
	
	or(lh[5],opcode[5],1'b0); not(lh[4],opcode[4]); not(lh[3],opcode[3]); not(lh[2],opcode[2]); not(lh[1],opcode[1]); or(lh[0],opcode[0],1'b0);
	and(lh_wire,lh[5],lh[4],lh[3],lh[2],lh[1],lh[0]);
	
	or(lhu[5],opcode[5],1'b0); not(lhu[4],opcode[4]); not(lhu[3],opcode[3]); or(lhu[2],opcode[2],1'b0); not(lhu[1],opcode[1]); or(lhu[0],opcode[0],1'b0);
	and(lhu_wire,lhu[5],lhu[4],lhu[3],lhu[2],lhu[1],lhu[0]);
	
	or(lb[5],opcode[5],1'b0); not(lb[4],opcode[4]); not(lb[3],opcode[3]); not(lb[2],opcode[2]); not(lb[1],opcode[1]); not(lb[0],opcode[0]);
	and(lb_wire,lb[5],lb[4],lb[3],lb[2],lb[1],lb[0]);
	
	or(lw[5],opcode[5],1'b0); not(lw[4],opcode[4]); not(lw[3],opcode[3]); not(lw[2],opcode[2]); or(lw[1],opcode[1],1'b0); or(lw[0],opcode[0],1'b0);
	and(lw_wire,lb[5],lw[4],lw[3],lw[2],lw[1],lw[0]);
	//**hw4
	or(lbu[5],opcode[5],1'b0); not(lbu[4],opcode[4]); not(lbu[3],opcode[3]); or(lbu[2],opcode[2],1'b0); not(lbu[1],opcode[1]); not(lbu[0],opcode[0]);
	and(lbu_wire,lbu[5],lbu[4],lbu[3],lbu[2],lbu[1],lbu[0]);
	
	not(lui[5],opcode[5]); not(lui[4],opcode[4]); or(lui[3],opcode[3],1'b0); or(lui[2],opcode[2],1'b0); or(lui[1],opcode[1],1'b0); or(lui[0],opcode[0],1'b0);
	and(lui_wire,lui[5],lui[4],lui[3],lui[2],lui[1],lui[0]);
	
	not(rtype[5],opcode[5]); not(rtype[4],opcode[4]); not(rtype[3],opcode[3]); not(rtype[2],opcode[2]); not(rtype[1],opcode[1]); not(rtype[0],opcode[0]);
	and(rtype_wire,rtype[5],rtype[4],rtype[3],rtype[2],rtype[1],rtype[0]);
	
	not(jump[5],opcode[5]); not(jump[4],opcode[4]); not(jump[3],opcode[3]); not(jump[2],opcode[2]); or(jump[1],opcode[1],1'b0); not(jump[0],opcode[0]);
	and(jump_wire,jump[5],jump[4],jump[3],jump[2],jump[1],jump[0]);
	
	not(jal[5],opcode[5]); not(jal[4],opcode[4]); not(jal[3],opcode[3]); not(jal[2],opcode[2]); or(jal[1],opcode[1],1'b0); or(jal[0],opcode[0],1'b0);
	and(jal_wire,jal[5],jal[4],jal[3],jal[2],jal[1],jal[0]);
	
	not(jr[5],opcode[5]); not(jr[4],opcode[4]); or(jr[3],opcode[3],1'b0); not(jr[2],opcode[2]); not(jr[1],opcode[1]); not(jr[0],opcode[0]);
	and(jr_wire,jr[5],jr[4],jr[3],jr[2],jr[1],jr[0]);
	
	not(beq[5],opcode[5]); not(beq[4],opcode[4]); not(beq[3],opcode[3]); or(beq[2],opcode[2],1'b0); not(beq[1],opcode[1]); not(beq[0],opcode[0]);
	and(beq_wire,beq[5],beq[4],beq[3],beq[2],beq[1],beq[0]);
	
	//lui
	or(lui_control,lui_wire,1'b0);
	//memtoreg
	or(memtoreg,lw_wire,lbu_wire,lb_wire,lh_wire,lhu_wire);
	//memread
	or(memread,lw_wire,lbu_wire,lb_wire,lh_wire,lhu_wire);
	//memwrite
	or(memwrite,sw_wire,sb_wire,sh_wire);
	//regwrite
	or(regwrite,rtype_wire,lw_wire,lb_wire,lbu_wire,lh_wire,lhu_wire,lui_wire);
	//store_control
	or(store_control[1],sb_wire,1'b0);
	or(store_control[0],sh_wire,1'b0);
	//extend
	or(extend,lw_wire,sw_wire,lbu_wire,lhu_wire,sb_wire,sh_wire);
	//load_control
	or(load_control[1],lw_wire,1'b0);
	or(load_control[0],lh_wire,lhu_wire);
	//regdest
	or(regdest,rtype_wire,1'b0);
	//beq
	or(branch,beq_wire,1'b0);
	//ALUSrc
	or(alusrc,lw_wire,sw_wire,lb_wire,lbu_wire,lh_wire,lhu_wire,sb_wire,sh_wire);
	//ALUOp
	or(aluop[1],rtype_wire);
	or(aluop[0],beq_wire);
	//jump
	or(jumpControl,jump_wire,1'b0);
	//jal
	or(jalControl,jal_wire,1'b0);
	//jr
	or(jrControl,jr_wire,1'b0);
	
	
endmodule