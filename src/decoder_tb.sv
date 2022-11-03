`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module decoder_tb;
    reg [2:0] addr;
    wire [7:0] sel;
    
    localparam period = 20;  

    decoder DUT(
        addr[2], addr[1], addr[0], 
        sel[0], sel[1], sel[2], sel[3], sel[4], sel[5], sel[6], sel[7]
    );

    initial
    begin
        for (int i = 0; i < 8; i = i + 1)
        begin
            addr = i;
            #period;
        end
    end
endmodule