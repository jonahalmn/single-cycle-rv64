module decoder(
    input wire[31:0] instruction,
    output wire[4:0] rs1,
    output wire[4:0] rs2,
    output wire[4:0] rd,
    output wire[11:0] immOp
);

    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    assign rd = instruction[11:7];
    assign immOp = instruction[31:20];

    always @(immOp) $display("0x%h", immOp);

endmodule