module pc(
    input wire clk,
    output reg[63:0] pc
);

initial begin
    pc = 0;

end

always @(posedge clk ) begin
    pc++;
end

endmodule