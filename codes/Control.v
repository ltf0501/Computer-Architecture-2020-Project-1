module Control
(
	Op_i,
	ALUOp_o,
	ALUSrc_o,
	Branch_o,
	MemRead_o,
	MemWrite_o,
	RegWrite_o,
	MemtoReg_o
);

input  [6 : 0] Op_i;
output [1 : 0] ALUOp_o;
output         ALUSrc_o;
output         Branch_o;
output         MemRead_o;
output         MemWrite_o;
output         RegWrite_o;
output         MemtoReg_o;

reg [1:0]      ALUOp_reg;
reg            MemtoReg_reg;

assign ALUOp_o      = ALUOp_reg;
assign MemtoReg_o = MemtoReg_reg;

always@(*) begin
    case (Op_i)
        7'b0010011: begin // addi srai
            ALUOp_reg   = 2'b01;
            //MemtoReg_reg = 
        end
        7'b0110011: begin // and xor sll add sub mul
            ALUOp_reg   = 2'b00;
            //MemtoReg_reg = 
        end
        // lw
        // sw
        default: begin
            ALUOp_reg   = 2'b00;
            //MemtoReg_reg = 
        end
    endcase
end

endmodule
