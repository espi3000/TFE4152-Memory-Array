`timescale 1ns/10ps  // time-unit = 1 ns, precision = 10 ps

module decoder_tb;
    reg adr2, adr1, adr0;
    wire sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7;
    
    localparam period = 20;  

    decoder DUT(adr2, adr1, adr0, sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7);

    initial // initial block executes only once
        begin 
            adr2 = 1'b0; adr1 = 1'b0; adr0 = 1'b0; #period; 
			adr2 = 1'b0; adr1 = 1'b0; adr0 = 1'b1; #period;
			adr2 = 1'b0; adr1 = 1'b1; adr0 = 1'b0; #period;
			adr2 = 1'b0; adr1 = 1'b1; adr0 = 1'b1; #period;
			adr2 = 1'b1; adr1 = 1'b0; adr0 = 1'b0; #period;
            adr2 = 1'b1; adr1 = 1'b0; adr0 = 1'b1; #period;
			adr2 = 1'b1; adr1 = 1'b1; adr0 = 1'b0; #period;
			adr2 = 1'b1; adr1 = 1'b1; adr0 = 1'b1; #period;
        end
endmodule