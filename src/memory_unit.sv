module memory_unit(

    );
    
    generate
        for (genvar i = 0; i < 8; i = i + 1) begin
            word word(.in(in), .out(out[i]), .sel(sel[i]), rw);
        end 
    endgenerate
endmodule