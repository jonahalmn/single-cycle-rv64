
module program_memory(
    input wire[63:0] address,
    output wire[31:0] instruction
);

    reg[7:0] data[0:2*4095];

    integer data_file;
    integer i = 0;
    reg[31:0] line;

    initial begin
        data_file = $fopen("sw/build/jmpr.hex", "r");
        if (data_file == 0) begin
            $display("data_file handle was NULL");
            $finish;
        end else begin
            $display("initializing data from sw/build/add.hex file");
            while ($fscanf(data_file, "%h", line)) begin
                data[i] = line[31:24];
                data[i + 1] = line[23:16];
                data[i + 2] = line[15:8];
                data[i + 3] = line[7:0];
                i+=4;
            end
        end
    
    end

    assign instruction = {data[address], data[address+1], data[address+2], data[address+3]};
    

endmodule