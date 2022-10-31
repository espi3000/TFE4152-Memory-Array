module decoder(
        input [2:0] addr,
        output [7:0] sel
    );
    generate
        for (genvar i = 0; i < 8; i = i + 1) begin
            assign sel = 1 << addr;
        end 
    endgenerate
endmodule