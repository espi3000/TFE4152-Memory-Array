/**********************************************************************
 * @brief Structure finite state machine
 * @param r, high when read request
 * @param w, high when write request
 * @param clk, clock
 * @param rw, high for write, low for read
 **********************************************************************/
module finite_state_machine (
        output rw,
        input r, w, clk
    );
    wire _r, _w;
    wire da, db;
    wire a, _a, b, _b;

    not(_a, a);
    not(_b, b);
    not(_r, r);
    not(_w, w);

    and(da, _b, r, _w);
    and(db, _a, _r, w);
    and(rw, _a, b);

    d_flipflop ff_a(a, da, clk);
    d_flipflop ff_b(b, db, clk);
endmodule

/**********************************************************************
 * @brief Structure of NAND D flip flop
 * @param q, output bit to read
 * @param d, input bit to write
 * @param clk, clock activation on negative edge
 **********************************************************************/
module d_flipflop (
        output q, 
        input d, clk
    );
    wire _q, s, r;
    //not(_clk, clk);
	nand(s, d, clk);
    nand(r, s, clk);
    sr_latch latch(q, _q, s, r);
endmodule