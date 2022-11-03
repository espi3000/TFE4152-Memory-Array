`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module and_gate_8_tb;
    reg [7:0] in;
    wire out;

    localparam period = 20;  

    and_gate_8 DUT(out, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]);

    initial
    begin  
        for (int i = 0; i < 256; i = i + 1)
        begin
            in = i;
            #period;
        end
    end
endmodule