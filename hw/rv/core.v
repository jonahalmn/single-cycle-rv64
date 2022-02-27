module core(
    input wire clk,
    output wire[63:0] pc,
    output wire[63:0] memory_address,
    input wire[63:0] memory_data,
    input wire[31:0] instruction
);
    wire[4:0] rs1;
    wire[4:0] rs2;
    wire[4:0] rd;
    wire[3:0] aluOp;
    wire regWrite;
    wire immediate;

    wire[11:0] immOp; // immediate operand
    wire[63:0] immOffset; // immediate offset for JAL

    wire[63:0] gprOut1;
    wire[63:0] gprOut2;
    wire[63:0] aluOut;

    wire[63:0] aluIn;

    wire jumpCtrl;

    controller controller_0(
        .clk(clk),
        .instruction(instruction),
        .aluOp(aluOp),
        .regWrite(regWrite),
        .immediate(immediate),
        .jump(jumpCtrl)
    );

    decoder decoder_0(
        .instruction(instruction),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .immOp(immOp),
        .immOffset(immOffset)
    );

    gpr gpregisters(
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .immediate(immediate),
        .out1(gprOut1),
        .out2(gprOut2),
        .wData(aluOut),
        .wEn(regWrite)
    );

    mux #(.ARCH_WIDTH(64), .INPUT_QUANTITY(2), .SEL_WIDTH(1)) mux_1(
        .in({ {{52{immOp[11]}}, immOp}, gprOut2}),
        .out(aluIn),
        .sel(immediate)
    );

    alu alu_0(
        .rs1(gprOut1),
        .rs2(aluIn),
        .aluOp(aluOp),
        .out(aluOut)
    );

    pc pc_0(
        .clk(clk),
        .pc(pc),
        .offset(immOffset),
        .jump(jumpCtrl)
    );

endmodule