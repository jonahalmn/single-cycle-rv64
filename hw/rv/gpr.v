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
//wire [ARCH_WIDTH-1:0] wData;
reg [31:0] regsReadOnly = 32'h0000;
reg [31:0] regsWriteEnable = 32'h0000;

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
        register #(.START_VAL(64'b0)) regi(.clk(clk), .writeEnable(regsWriteEnable[i]), .writeData(wData), .readOnly(regsReadOnly[i]), .readData(regsData[i]));
    end
endgenerate

always @(wData, wEn) begin
    regsWriteEnable = 32'h0000;
    if(wEn) begin
        regsWriteEnable[rd] = 'b1;
    end
end

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

debug_gpr readable_registers(.regsData(regsData));



endmodule