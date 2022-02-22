module controller(
    input wire clk,
    input wire[31:0] instruction,
    output reg[3:0] aluOp,
    output reg regWrite,
    output reg immediate
);

reg[2:0] func3;
reg[6:0] func7;

always @(instruction) begin
    #1
    $display("current : %h", instruction);
    $display("current : %h", instruction[5:0]);

    func3 = instruction[14:12];
    func7 = instruction[31:25];

    case (instruction[6:0])
        'b0010011: begin
            if (func3 == 'b0) begin
                // addi
                aluOp = 'b1;
                immediate = 'b1;
            end
        end
        'b0110011: begin
            if (func3 == 'b0 && func7 == 'b0) begin
                // add
                aluOp = 'b1;
                immediate = 'b0;
            end
        end
        default: begin
            aluOp = 'b0;
            $display("unknown instruction");
        end

    endcase
end

endmodule