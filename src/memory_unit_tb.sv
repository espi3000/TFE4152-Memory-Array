`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module memory_unit_tb;
    reg [7:0] in;
    reg [2:0] addr;
    reg rw;
    wire [7:0] out;
    
    localparam period = 20;  

    memory_unit memory_unit(
        in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], 
        addr[2], addr[1], addr[0], 
        rw, 
        out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]
    );

    initial
    begin 
        for (int i = 0; i < 8; i = i + 1)
        begin
            addr = i;
            rw   = 1'b1; // write
            in   = i;    // write i to memory
            #period;
            rw   = 1'b0; // read
            #period;
        end
    end
endmodule