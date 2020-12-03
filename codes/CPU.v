module CPU
(
    clk_i, 
    start_i,
);

input clk_i, start_i, rst_i;

Instruction_Memory Instruction_Memory(
	.addr_i (),
	.instr_o (),
);

MUX3 MUX3A(
	.data1_i,
	.data2_i,
	.data3_i,
	.select_i,
	.data_o
);

MUX3 MUX3B(
	.data1_i,
	.data2_i,
	.data3_i,
	.select_i,
	.data_o
);

IF_ID IF_ID(
	.clk_i (clk_i),
	.start_i (start_i),
	.IFIDwrite_i (),
	.IFIDflush_i (),
	.PC_i (),
	.PC_o (),
	.instr_i 
	.instr_o 
);

ID_EX ID_EX(
	.clk_i (clk_i),
	.start_i (start_i),

	.instr_i,
	.instr_o,

	.RegWrite_i,
	.RegWrite_o,
	.MemtoReg_i,
	.MemtoReg_o,
	.MemRead_i,
	.MemRead_o,
	.MemWrite_i,
	.MemWrite_o,
	.ALUOp_i,
	.ALUOp_o,
	.ALUSrc_i,
	.ALUSrc_o,

	.imm_i,
	.imm_o,

	.RDdata1_i,
	.RDdata1_o,
	.RDdata2_i,
	.RDdata2_o,

	.RSaddr1_i,
	.RSaddr1_o,
	.RSaddr2_i,
	.RSaddr2_o,
	.RDaddr_i,
	.RDaddr_o
);

EX_MEM EX_MEM(
	.clk_i (clk_i),
	.start_i (start_i),

	.RegWrite_i,
	.RegWrite_o,
	.MemtoReg_i,
	.MemtoReg_o,
	.MemRead_i,
	.MemRead_o,
	.MemWrite_i,
	.MemWrite_o,

	.ALU_i,
	.ALU_o,

	.MemWriteData_i,
	.MemWriteData_o,

	.RDaddr_i,
	.RDaddr_o,
);

MEM_WB MEM_WB(
	.clk_i (clk_i),
	.start_i (start_i),

	.RegWrite_i,
	.RegWrite_o,
	.MemtoReg_i,
	.MemtoReg_o,

	.ALU_i,
	.ALU_o,
	.MemReadData_i,
	.MemReadData_o,

	.RDaddr_i,
	.RDaddr_o
);
endmodule 
