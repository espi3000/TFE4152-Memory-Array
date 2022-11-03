`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module bitcell_tb;
    reg in, sel, rw;
    wire out;

    localparam period = 20;  

    bitcell DUT(out, in, sel, rw);

    initial
    begin 
        // Following code is for testing write/read operation
		sel = 0; in = 0; rw = 1; #period;
		sel = 0; in = 0; rw = 0; #period;
		sel = 0; in = 1; rw = 1; #period;
		sel = 0; in = 1; rw = 0; #period;
        // Following code is for testing the select function
        sel = 1; in = 0; rw = 1; #period;
		sel = 1; in = 0; rw = 0; #period;
		sel = 1; in = 1; rw = 1; #period;
		sel = 1; in = 1; rw = 0; #period;
    end
endmodule