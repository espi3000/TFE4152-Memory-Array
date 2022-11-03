`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module memory_unit_tb;
    reg [7:0] in;
    //reg i0, i1, i2, i3, i4, i5, i6, i7,
    //reg adr2, adr1, adr0,
    reg [2:0] addr;
    reg rw;
    //wire o0, o1, o2, o3, o4, o5, o6, o7
    wire [7:0] out;
    
    localparam period = 20;  

    memory_unit memory_unit(
        in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], 
        addr[2], addr[1], addr[0], 
        rw, 
        out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]
    );

    initial // initial block executes only once
        begin 
            addr = 3'b000;
            rw   = 1'b0;        // write
            in   = 8'b00000000; // write 0 to memory
            #period;
            rw   = 1'b1;        // read
            #period;

            addr = 3'b001;
            rw   = 1'b0;        // write
            in   = 8'b00000001; // write 1 to memory
            #period;
            rw   = 1'b1;        // read
            #period;

            addr = 3'b010;
            rw   = 1'b0;        // write
            in   = 8'b00000010; // write 2 to memory
            #period;
            rw   = 1'b1;        // read
            #period;

            addr = 3'b011;
            rw   = 1'b0;        // write
            in   = 8'b00000011; // write 3 to memory
            #period;
            rw   = 1'b1;        // read
            #period;

            addr = 3'b100;
            rw   = 1'b0;        // write
            in   = 8'b00000100; // write 0 to memory
            #period;
            rw   = 1'b1;        // read
            #period;

            addr = 3'b101;
            rw   = 1'b0;        // write
            in   = 8'b00000101; // write 0 to memory
            #period;
            rw   = 1'b1;        // read
            #period;

            addr = 3'b110;
            rw   = 1'b0;        // write
            in   = 8'b00000110; // write 0 to memory
            #period;
            rw   = 1'b1;        // read
            #period;

            addr = 3'b111;
            rw   = 1'b0;        // write
            in   = 8'b00000111; // write 0 to memory
            #period;
            rw   = 1'b1;        // read
            #period;
        end
endmodule