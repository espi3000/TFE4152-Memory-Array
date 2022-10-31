`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module word_tb;
    reg [7:0] in, sel, rw;
    wire [7:0] out;
    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  
    word DUT(.out(out), .in(in), .sel(sel), .rw(rw));
    initial // initial block executes only once
        begin  
			in = 00001111; sel = 1; rw = 1; #period;
			in = 0; sel = 1; rw = 0; #period;
			in = 1; sel = 1; rw = 1; #period;
			in = 1; sel = 1; rw = 0; #period;
        end
endmodule