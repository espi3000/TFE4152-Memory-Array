`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module decoder_tb;
    reg [2:0] addr;
    wire [7:0] sel;
    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  
    decoder DUT(.addr(addr), .sel(sel));
    initial // initial block executes only once
        begin 
            addr = 'd0; #period; 
			addr = 'd1; #period;
			addr = 'd2; #period;
			addr = 'd3; #period;
			addr = 'd4; #period;
            addr = 'd5; #period;
			addr = 'd6; #period;
			addr = 'd7; #period;
        end
endmodule