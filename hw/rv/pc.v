module pc(
    input wire clk,
    output reg[63:0] pc,
    input wire jump,
    input wire[63:0] offset
);

initial begin
    pc = 0;

end

always @(posedge clk ) begin
    if(jump) pc = pc + offset;
    else pc+=4;
end

endmodule