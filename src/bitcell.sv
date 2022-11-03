/**********************************************************************
 * @brief Structure of NAND SR latch
 * @param q, output
 * @param _q, inverted output
 * @param s, set
 * @param r, reset
 **********************************************************************/
module sr_latch (
        output q, _q, 
        input s, r
    );
    nand(q, s, _q);
    nand(_q, r, q);
endmodule

/**********************************************************************
 * @brief Structure of bitcell based on NAND D flip flop
 * @param out, output bit to read
 * @param in, input bit to write
 * @param sel, active low select
 * @param rw, write when high, read when low
 **********************************************************************/
module bitcell (
        output out, 
        input in, sel, rw
    );
    wire q, _q, s, r, _sel;
    not(_sel, sel);
	nand(s, in, _sel, rw);
    nand(r, s, _sel, rw);
    sr_latch latch(q, _q, s, r);
    nor(out, _q, sel, rw);
endmodule				   	