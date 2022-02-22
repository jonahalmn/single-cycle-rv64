module decoder(
    input wire[31:0] instruction,
    output wire[4:0] rs1,
    output wire[4:0] rs2,
    output wire[4:0] rd
);

    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    assign rd = instruction[11:7];

endmodule