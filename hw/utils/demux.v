module demux #(parameter ARCH_WIDTH = 64, parameter INPUT_QUANTITY = 2, parameter SEL_WIDTH = 4) (
    output wire[ARCH_WIDTH-1:0][INPUT_QUANTITY - 1:0] out,
    input wire[ARCH_WIDTH-1:0] in,
    input wire[SEL_WIDTH - 1:0] sel
);

// always @(sel, in) begin
//     out[sel] = in;
// end

endmodule