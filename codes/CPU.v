module CPU
(
    clk_i, 
    start_i,
		rst_i
);

input clk_i, start_i, rst_i;

PC PC(
	.clk_i (clk_i),
	.rst_i (rst_i),
	.start_i (start_i),
	.PCWrite_i (),
	.pc_i (),
	.pc_o ()
);

Instruction_Memory Instruction_Memory(
	.addr_i (),
	.instr_o ()
);

Data_Memory Data_Memory(
	.clk_i (clk_i), 
	.addr_i (), 
	.MemRead_i (),
	.MemWrite_i (),
	.data_i (),
	.data_o ()
);

And And(
	.data1_i (),
	.data2_i (),
	.data_o ()
);

Sign_Extend Sign_Extend(
	.data_i (),
	.data_o ()
);

Control Control(
	.Op_i (),
	.NoOp_i (),
	.ALUOp_o (),
	.ALUSrc_o (),
	.Branch_o (),
	.MemRead_o (),
	.MemWrite_o (),
	.RegWrite_o (),
	.MemtoReg_o ()
);
ALU_Control ALU_Control(
	.funct_i (),
	.ALUOp_i (),
	.ALUCtrl_o ()
);

ALU ALU(
	.data1_i (),
	.data2_i (),
	.ALUCtrl_i (),
	.data_o (),
	.Zero_o ()
);

Hazard Hazard(
	.IDEX_MemRead_i (),
	.IDEX_RDaddr_i (),

	.IFID_RSaddr1_i (),
	.IFID_RSaddr2_i (),

	.PCwrite_o (),
	.Stall_o (),
	.NoOp_o ()
);

Adder Adder_PC(
	.data1_in (),
	.data2_in (),
	.data_o ()
);

Adder Adder_Branch(
	.data1_in (),
	.data2_in (),
	.data_o ()
);

MUX32 MUX_PC(
	.data1_i (),
	.data2_i (),
	.select_i (),
	.data_o ()
);

MUX32 MUX_ALU(
	.data1_i (),
	.data2_i (),
	.select_i (),
	.data_o ()
);

MUX32 MUX_Mem(
	.data1_i (),
	.data2_i (),
	.select_i (),
	.data_o ()
);

MUX3 MUX3A(
	.data1_i (),
	.data2_i (),
	.data3_i (),
	.select_i (),
	.data_o ()
);

MUX3 MUX3B(
	.data1_i (),
	.data2_i (),
	.data3_i (),
	.select_i (),
	.data_o ()
);

IF_ID IF_ID(
	.clk_i (clk_i),
	.start_i (start_i),
	.Stall_i (),
	.Flush_i (),
	.PC_i (),
	.PC_o (),
	.instr_i (),
	.instr_o () 
);

ID_EX ID_EX(
	.clk_i (clk_i),
	.start_i (start_i),

	.instr_i (),
	.instr_o (),

	.RegWrite_i (),
	.RegWrite_o (),
	.MemtoReg_i (),
	.MemtoReg_o (),
	.MemRead_i (),
	.MemRead_o (),
	.MemWrite_i (),
	.MemWrite_o (),
	.ALUOp_i (),
	.ALUOp_o (),
	.ALUSrc_i (),
	.ALUSrc_o (),

	.imm_i (),
	.imm_o (),

	.RDdata1_i (),
	.RDdata1_o (),
	.RDdata2_i (),
	.RDdata2_o (),

	.RSaddr1_i (),
	.RSaddr1_o (),
	.RSaddr2_i (),
	.RSaddr2_o (),
	.RDaddr_i (),
	.RDaddr_o ()
);

EX_MEM EX_MEM(
	.clk_i (clk_i),
	.start_i (start_i),

	.RegWrite_i (),
	.RegWrite_o (),
	.MemtoReg_i (),
	.MemtoReg_o (),
	.MemRead_i (),
	.MemRead_o (),
	.MemWrite_i (),
	.MemWrite_o (),

	.ALU_i (),
	.ALU_o (),

	.MemWriteData_i (),
	.MemWriteData_o (),

	.RDaddr_i (),
	.RDaddr_o ()
);

MEM_WB MEM_WB(
	.clk_i (clk_i),
	.start_i (start_i),

	.RegWrite_i (),
	.RegWrite_o (),
	.MemtoReg_i (),
	.MemtoReg_o (),

	.ALU_i (),
	.ALU_o (),
	.MemReadData_i (),
	.MemReadData_o (),

	.RDaddr_i (),
	.RDaddr_o ()
);

endmodule 
