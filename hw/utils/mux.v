module mux #(parameter ARCH_WIDTH = 64, parameter INPUT_QUANTITY = 2, parameter SEL_WIDTH = 4) (
    input wire[INPUT_QUANTITY - 1:0][ARCH_WIDTH-1:0] in,
    output reg[ARCH_WIDTH-1:0] out,
    input wire[SEL_WIDTH - 1:0] sel
);

always @(sel, in) begin
    out = in[sel];
end

endmodule