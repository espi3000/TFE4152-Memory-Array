module word(
    input [7:0] in, 
    output [7:0] out, 
    input sel, 
    input rw
    );
    generate
        for (genvar i = 0; i < 8; i = i + 1) begin
            bitcell_nor bitcell(.out(out[i]), .in(in[i]), .sel(sel), .rw(rw));
        end
    endgenerate
endmodule