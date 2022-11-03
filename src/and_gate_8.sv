/**********************************************************************
 * @brief Structure of 8 fan-in OR-gate
 * @param o, output
 * @param i0...i7, inputs
 **********************************************************************/
module and_gate_8(
        output o,
        input i0, i1, i2, i3, i4, i5, i6, i7
    );
    wire internal_0123, internal_4567;
    nand(o, internal_0123, internal_4567);
    nor(internal_0123, i0, i1, i2, i3);
    nor(internal_4567, i4, i5, i6, i7); 
endmodule