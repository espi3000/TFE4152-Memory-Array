`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module word_tb;
    reg [7:0] in;
    reg sel, rw;
    wire [7:0] out;

    localparam period = 20;  

    word DUT(
        in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], 
        sel, 
        rw, 
        out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]
    );

    initial // initial block executes only once
        begin  
			sel = 1'b0;        // select on
            rw  = 1'b0;        // write
            in  = 8'b10101010; // write to word
            #period;
            rw  = 1'b1;        // read
            #period;

            sel = 1'b0;        // select off
            rw  = 1'b0;        // write
            in  = 8'b11111111; // write to word
            #period;
            rw  = 1'b1;        // read
            #period;
        end
endmodule