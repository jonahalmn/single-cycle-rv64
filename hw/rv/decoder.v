module decoder(
    input wire[31:0] instruction,
    output wire[4:0] rs1,
    output wire[4:0] rs2,
    output wire[4:0] rd,
    output wire[11:0] immOp,
    output wire[63:0] immOffset
);

    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    assign rd = instruction[11:7];
    assign immOp = instruction[31:20];
    // Sign bit extend
    assign immOffset = {{42{instruction[31]}},
                    instruction[31], 
                    instruction[19:12],
                    instruction[20],
                    instruction[30:21],
                    2'b0
                };


    
    always @(immOp) $display("0x%h", immOp);
    always @(immOffset) $display("imm offset : 0x%h", immOffset);
    always @(immOffset) $display("sign bit : 0x%h",  {instruction[31], 
                    instruction[19:12],
                    instruction[20],
                    instruction[30:21]
                });

endmodule