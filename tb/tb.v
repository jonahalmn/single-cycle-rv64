`timescale 1ps/1ps
`define ARCH_WIDTH 64
`define ALU_OP_WIDTH 4

module tb ();

    wire clk;
    reg[0:7] cycles = 8'b0;
    wire[63:0] counter;
    wire[31:0] current_instruction;

    clock clock_0(
        .clock(clk)
    );

    core core_0(
        .clk(clk),
        .pc(counter),
        .instruction(current_instruction)
    );

    program_memory memory_0(
        .address(counter),
        .instruction(current_instruction)
    );
    
    always @(posedge clk ) begin
        cycles++;
        if(cycles > 8) $finish;
    end

    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0,clk);
        $dumpvars(0,core_0);
        $dumpvars(0,memory_0);
    end

endmodule