module gpr #(parameter ARCH_WIDTH = 64) (
    input wire[4:0] rs1,
    input wire[4:0] rs2,
    input wire[4:0] rd,
    input wire wEn,
    input wire immediate,
    input wire[ARCH_WIDTH - 1:0] wData,
    input wire clk,
    output wire[ARCH_WIDTH - 1:0] out1,
    output wire[ARCH_WIDTH - 1:0] out2
);

//register registers[31:0];

wire [31:0][ARCH_WIDTH-1:0] regsData;
reg [31:0] regsReadOnly;
reg [31:0] regsRriteEnable;

mux #(.ARCH_WIDTH(64), .INPUT_QUANTITY(32), .SEL_WIDTH(5)) mux_0(
    .in(regsData),
    .sel(rs1),
    .out(out1)
);

mux #(.ARCH_WIDTH(64), .INPUT_QUANTITY(32), .SEL_WIDTH(5)) mux_1(
    .in(regsData),
    .sel(rs2),
    .out(out2)
);


initial begin 
    regsReadOnly[0] = 'b1;
end


genvar i; 
generate
    for (i = 0; i < 32; i = i + 1) begin
        register #(.START_VAL(i)) regi(.clk(clk), .writeEnable(1'b0), .writeData(64'b0), .readOnly(1'b0), .readData(regsData[i]));
    end
endgenerate

// reg     [31:0]  registers [31:0];
// generate
//   genvar idx;
//   for(idx = 0; idx < 32; idx = idx+1) begin: register
//     wire [31:0] tmp;
//     assign tmp = registers[idx];
//   end
// // endgenerate
// genvar idx;
// generate
//     for (idx = 0; idx < 32 * 64; idx = idx + 64) begin
//         wire[64:0] dbg_regi;
//         assign dbg_regi = regsData[i:i+63];
//     end
// endgenerate

//always @(rs1, rs2) begin 
   // out1 = registers[rs1].readData;
  //  if(~immediate) out2 = registers[rs2].readData;
//end



// reg[WIDTH - 1:0] zero = 'b0;
// reg[WIDTH - 1:0] ra = 'b0;
// reg[WIDTH - 1:0] sp = 'b0;
// reg[WIDTH - 1:0] gp = 'b0;
// reg[WIDTH - 1:0] tp = 'b0;
// reg[WIDTH - 1:0] t0 = 'b0;
// reg[WIDTH - 1:0] t1 = 'b0;
// reg[WIDTH - 1:0] t2 = 'b0;
// reg[WIDTH - 1:0] s0 = 'b0;
// reg[WIDTH - 1:0] s1 = 'b0;
// reg[WIDTH - 1:0] a0 = 'b0;
// reg[WIDTH - 1:0] a1 = 'b0;
// reg[WIDTH - 1:0] a2 = 'b0;
// reg[WIDTH - 1:0] a3 = 'b0;
// reg[WIDTH - 1:0] a4 = 'b0;
// reg[WIDTH - 1:0] a5 = 'b0;
// reg[WIDTH - 1:0] a6 = 'b0;
// reg[WIDTH - 1:0] a7 = 'b0;
// reg[WIDTH - 1:0] s2 = 'b0;
// reg[WIDTH - 1:0] s3 = 'b0;
// reg[WIDTH - 1:0] s4 = 'b0;
// reg[WIDTH - 1:0] s5 = 'b0;
// reg[WIDTH - 1:0] s6 = 'b0;
// reg[WIDTH - 1:0] s7 = 'b0;
// reg[WIDTH - 1:0] s8 = 'b0;
// reg[WIDTH - 1:0] s9 = 'b0;
// reg[WIDTH - 1:0] s10 = 'b0;
// reg[WIDTH - 1:0] s11 = 'b0;
// reg[WIDTH - 1:0] t3 = 'b0;
// reg[WIDTH - 1:0] t4 = 'b0;
// reg[WIDTH - 1:0] t5 = 'b0;
// reg[WIDTH - 1:0] t6 = 'b0;

endmodule