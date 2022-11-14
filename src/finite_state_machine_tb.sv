`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps 

module finite_state_machine_tb;
    reg [7:0] name_in [7:0] = "Karl!!!!";
    reg [7:0] name_out [7:0];
    reg [7:0] in;
    reg [2:0] addr;
    reg r, w, clk;
    wire rw;
    wire [7:0] out;
    
    localparam period = 20;  

    finite_state_machine fsm(rw, sleep, r, w, clk);

    memory_unit memory_unit(
        in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], 
        addr[2], addr[1], addr[0], 
        rw, 
        out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]
    );

    always #(period/2) clk = ~clk;

    initial begin
        clk = 0;
        r = 0;
        w = 1;
        #period;

        for (int i = 0; i < 8; i++) begin
            addr = i;
            #(period*0.1);
            in = name_in[i];
            #(period*0.9);
        end

        w = 0;
        #(period*10);
        r = 1;

        for (int i = 0; i < 8; i++) begin
            addr = i;
            #(period*0.1);
            name_out[i] = out;
            #(period*0.9);
        end

        $finish;
    end
endmodule