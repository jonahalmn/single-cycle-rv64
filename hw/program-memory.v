
module program_memory(
    input wire[63:0] address,
    output wire[31:0] instruction
);

    reg [31:0] data[0:4095];

    integer data_file;
    integer i = 0;
    reg[31:0] line;

    initial begin
        
        //data = $readmemh("sw/build/add.hex", data);
        data_file = $fopen("sw/build/add.hex", "r");
        if (data_file == 0) begin
            $display("data_file handle was NULL");
            $finish;
        end else begin
            $display("initializing data from sw/build/add.hex file");
            while ($fscanf(data_file, "%h", line)) begin
                data[i] = line[31:0];
                i++;
            end
        end
    
    end

    assign instruction = data[address];
    

endmodule