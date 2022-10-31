module memory_unit(
        input i0, i1, i2, i3, i4, i5, i6, i7,
        input adr2, adr1, adr0,
        input rw,
        output o0, o1, o2, o3, o4, o5, o6, o7
    );
    wire sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7;

    decoder decoder(adr2, adr1, adr0, sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7);

    word word0(i0, i1, i2, i3, i4, i5, i6, i7, sel0, rw, o0, o1, o2, o3, o4, o5, o6, o7);
    word word1(i0, i1, i2, i3, i4, i5, i6, i7, sel1, rw, o0, o1, o2, o3, o4, o5, o6, o7);
    word word2(i0, i1, i2, i3, i4, i5, i6, i7, sel2, rw, o0, o1, o2, o3, o4, o5, o6, o7);
    word word3(i0, i1, i2, i3, i4, i5, i6, i7, sel3, rw, o0, o1, o2, o3, o4, o5, o6, o7);
    word word4(i0, i1, i2, i3, i4, i5, i6, i7, sel4, rw, o0, o1, o2, o3, o4, o5, o6, o7);
    word word5(i0, i1, i2, i3, i4, i5, i6, i7, sel5, rw, o0, o1, o2, o3, o4, o5, o6, o7);
    word word6(i0, i1, i2, i3, i4, i5, i6, i7, sel6, rw, o0, o1, o2, o3, o4, o5, o6, o7);
    word word7(i0, i1, i2, i3, i4, i5, i6, i7, sel7, rw, o0, o1, o2, o3, o4, o5, o6, o7);
endmodule