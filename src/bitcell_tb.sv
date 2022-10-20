`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module bitcell_tb;
    reg in, sel, rw;
    wire out;
    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  
    bitcell DUT(.out(out), .in(in), .sel(sel), .rw(rw));
    initial // initial block executes only once
        begin  
			//Select bitcell
            in = 1;
            sel = 1;
            rw = 0;
            #period; // wait for period 

			//Store value in bitcell
            in = 1;
            sel = 1;
            rw = 0;
            #period;
			
			//read from bitcell
			in = 0;
            sel = 1;
            rw = 1;
            #period;
        end
endmodule