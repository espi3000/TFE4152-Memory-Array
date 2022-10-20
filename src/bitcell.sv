/*
* Structure of NAND SR latch
*/
module sr_latch(q, not_q, s, r);
    input s, r; 
    output q, not_q; 
    nand(q, s, not_q);
    nand(not_q, r, q);
endmodule

/*
* Structure of bitcell based on NAND D flip flop
*/
module bitcell(out, in, sel, rw);
    input in, sel, rw; 
    output out;
    wire q, not_q, s, r, not_rw; 
    not(not_rw, rw);
	nand(s, in, sel, not_rw);
    nand(r, s, sel, not_rw);
    sr_latch latch(q, not_q, s, r);
    and(out, q, sel, rw);
endmodule				   	