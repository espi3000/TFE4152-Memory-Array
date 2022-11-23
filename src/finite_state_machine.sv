/**********************************************************************
 * @brief Structure finite state machine
 * @param r, high when read request
 * @param w, high when write request
 * @param clk, clock
 * @param rw, high for write, low for read
 * @param sleep, signal for turning off power rails
 **********************************************************************/
module finite_state_machine (
        output rw, sleep,
        input r, w, clk
    );
    wire _r, _w;
    wire da, db;
    wire a, b, _b;

    not(_b, b);
    not(_r, r);
    not(_w, w);

    nor(da, b, _r, w);
    nor(db, a, r, _w);
    nor(rw, a, _b);
    nor(sleep, a, b);

    d_flipflop ff_a(a, da, clk);
    d_flipflop ff_b(b, db, clk);
endmodule

/**********************************************************************
 * @brief Structure of NAND D flip flop
 * @param q, output bit to read
 * @param d, input bit to write
 * @param clk, clock activation on positive edge
 **********************************************************************/
module d_flipflop (
        output q, 
        input d, clk
    );
    wire _q, s, r;
    not(_clk, clk);
	nand(s, d, _clk);
    nand(r, s, _clk);
    sr_latch latch(q, _q, s, r);
endmodule