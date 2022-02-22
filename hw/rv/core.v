module core(
    input wire clk,
    output wire[63:0] pc,
    input wire[31:0] instruction
);
    wire[4:0] rs1;
    wire[4:0] rs2;
    wire[4:0] rd;
    wire[3:0] aluOp;
    wire regWrite;
    wire immediate;

    wire[63:0] gprOut1;
    wire[63:0] gprOut2;

    controller controller_0(
        .clk(clk),
        .instruction(instruction),
        .aluOp(aluOp),
        .regWrite(regWrite),
        .immediate(immediate)
    );

    decoder decoder_0(
        .instruction(instruction),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd)
    );

    gpr gpregisters(
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .immediate(immediate),
        .out1(gprOut1),
        .out2(gprOut2)
    );

    alu alu_0(
        .rs1(gprOut1),
        .rs2(gprOut2),
        .aluOp(aluOp)
    );

    pc pc_0(
        .clk(clk),
        .pc(pc)
    );

endmodule