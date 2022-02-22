// 
module register #(parameter START_VAL = 0)(
    input wire clk,
    input wire[63:0] writeData,
    input wire writeEnable,
    input wire readOnly,
    output wire[63:0] readData
);

reg [63:0] data;

initial data = START_VAL;
assign readData = data;



always @(posedge clk ) begin
    if(~readOnly & writeEnable) data = writeData;
end


endmodule