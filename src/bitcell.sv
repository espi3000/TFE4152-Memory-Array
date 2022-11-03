/*
* Structure of NAND SR latch
*/
module sr_latch(q, _q, s, r);
    input s, r; 
    output q, _q; 
    nand(q, s, _q);
    nand(_q, r, q);
endmodule

/*
* Structure of bitcell based on NAND D flip flop
*/
module bitcell(out, in, sel, rw);
    input in, sel, rw; 
    output out;
    wire q, _q, s, r, _sel; 
    not(_sel, sel);
	nand(s, in, _sel, rw);
    nand(r, s, _sel, rw);
    sr_latch latch(q, _q, s, r);
    nor(out, _q, sel, rw);
endmodule				   	