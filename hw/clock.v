module clock (
    output wire clock
);
    reg clock_r = 1'b1;

    assign clock = clock_r;

    always begin
        #10 clock_r = ~clock_r;
    end

endmodule