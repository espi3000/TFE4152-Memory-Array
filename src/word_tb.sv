`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module word_tb;
    reg [7:0] in;
    reg sel, rw;
    wire [7:0] out;

    localparam period = 20;  

    word DUT(out, in, sel, rw);

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