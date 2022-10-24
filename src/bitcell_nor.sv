/*
* Structure of NAND SR latch
*/
module sr_latch_nor(q, not_q, s, r);
    input s, r; 
    output q, not_q; 
    nand(q, s, not_q);
    nand(not_q, r, q);
endmodule

/*
* Structure of bitcell based on NAND D flip flop
*/
module bitcell_nor(out, in, sel, rw);
    input in, sel, rw; 
    output out;
    wire q, not_q, s, r, not_sel; 
	nand(s, in, sel, rw);
    nand(r, s, sel, rw);
    sr_latch_nor latch(q, not_q, s, r);
    not(not_sel, sel);
    nor(out, not_q, not_sel, rw);
endmodule				   	