module controller(
    input wire clk,
    input wire[31:0] instruction,
    output reg[3:0] aluOp,
    output reg regWrite,
    output reg immediate,
    output reg jump,
    output reg jalr,
    // 0 : ALU, 1 : Memory, 2 : PC
    output reg[3:0] regSrc
);

reg[2:0] func3;
reg[6:0] func7;

always @(instruction) begin
    #1

    func3 = instruction[14:12];
    func7 = instruction[31:25];

    // reset all controls
    aluOp = 'b0;
    immediate = 'b0;
    regWrite = 'b0;
    jump = 'b0;
    jalr = 'b0;
    regSrc = 'b0;

    case (instruction[6:0])
        'b0010011: begin
            if (func3 == 'b0) begin
                // addi
                $display("addi");
                aluOp = 'b1;
                immediate = 'b1;
                regWrite = 'b1;
                regSrc = 0;
            end
        end
        'b0110011: begin
            if (func3 == 'b0 && func7 == 'b0) begin
                // add
                $display("add");
                aluOp = 'b1;
                immediate = 'b0;
                regWrite = 'b1;
                regSrc = 0;
            end
        end
        'b1101111: begin
            // JAL
            $display("JAL");
            jump = 'b1;
            regWrite = 'b1;
            regSrc = 2;
        end
        'b1100111: begin
            // JALR
            $display("JALR");
            jump = 'b1;
            regWrite = 'b1;
            jalr = 'b1;
            regSrc = 2;
        end
        default: begin
            aluOp = 'b0;
            $display("unknown instruction");
        end

    endcase
end

endmodule