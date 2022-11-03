/*
* Structure of byte-sized word
*/
module memory_unit(
        input i0, i1, i2, i3, i4, i5, i6, i7,
        input sel,
        input rw,
        output o0, o1, o2, o3, o4, o5, o6, o7
    );

    bitcell bitcell0(o0, i0, sel, rw);
    bitcell bitcell1(o1, i1, sel, rw);
    bitcell bitcell2(o2, i2, sel, rw);
    bitcell bitcell3(o3, i3, sel, rw);
    bitcell bitcell4(o4, i4, sel, rw);
    bitcell bitcell5(o5, i5, sel, rw);
    bitcell bitcell6(o6, i6, sel, rw);
    bitcell bitcell7(o7, i7, sel, rw);
endmodule