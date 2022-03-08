module pc(
    input wire clk,
    output reg[63:0] pc,
    input wire jump,
    input wire jalr,
    input wire[63:0] offset,
    output reg[63:0] nextPc,
    input wire[63:0] rs1
);


initial begin
    pc = 0;
end

// here there is a pb
always @(posedge clk ) begin
    if(jump) pc = pc + offset;
    else pc+=4;
end

always @(pc, offset, jump, jalr) begin
    if(jalr) begin 
        pc = rs1;
    end
    if(jump) nextPc = pc + offset;
    else nextPc=pc + 4;
end

endmodule