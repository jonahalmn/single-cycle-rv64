module alu #(parameter ARCH_WIDTH=64, parameter ALU_OP_WIDTH=4) (
    input wire[ALU_OP_WIDTH - 1:0] aluOp,
    input wire[ARCH_WIDTH - 1:0] rs1,
    input wire[ARCH_WIDTH - 1:0] rs2,
    output reg[ARCH_WIDTH - 1:0] out
);

always @(aluOp, rs1, rs2) begin
    if(aluOp) case (aluOp)
        1'b1: out = rs1 + rs2;
        default: $display("alu null");
    endcase 
end

endmodule