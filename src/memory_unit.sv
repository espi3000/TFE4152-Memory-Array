/**********************************************************************
 * @brief 8x8 byte memory unit
 * @param i0...i7, inputs bits to write
 * @param adr2...adr0, address bits
 * @param rw, write when high, read when low
 * @param o0...o7, outputs bits to read
 **********************************************************************/
module memory_unit(
        input i0, i1, i2, i3, i4, i5, i6, i7,
        input adr2, adr1, adr0,
        input rw,
        output o0, o1, o2, o3, o4, o5, o6, o7
    );
    wire sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7;
    wire o0_0, o0_1, o0_2, o0_3, o0_4, o0_5, o0_6, o0_7; // output bits from word0
    wire o1_0, o1_1, o1_2, o1_3, o1_4, o1_5, o1_6, o1_7; // output bits from word1
    wire o2_0, o2_1, o2_2, o2_3, o2_4, o2_5, o2_6, o2_7; // output bits from word2
    wire o3_0, o3_1, o3_2, o3_3, o3_4, o3_5, o3_6, o3_7; // output bits from word3
    wire o4_0, o4_1, o4_2, o4_3, o4_4, o4_5, o4_6, o4_7; // output bits from word4
    wire o5_0, o5_1, o5_2, o5_3, o5_4, o5_5, o5_6, o5_7; // output bits from word5
    wire o6_0, o6_1, o6_2, o6_3, o6_4, o6_5, o6_6, o6_7; // output bits from word6
    wire o7_0, o7_1, o7_2, o7_3, o7_4, o7_5, o7_6, o7_7; // output bits from word7

    decoder decoder(adr2, adr1, adr0, sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7); // address decoding

    word word0(i0, i1, i2, i3, i4, i5, i6, i7, sel0, rw, o0_0, o0_1, o0_2, o0_3, o0_4, o0_5, o0_6, o0_7);
    word word1(i0, i1, i2, i3, i4, i5, i6, i7, sel1, rw, o1_0, o1_1, o1_2, o1_3, o1_4, o1_5, o1_6, o1_7);
    word word2(i0, i1, i2, i3, i4, i5, i6, i7, sel2, rw, o2_0, o2_1, o2_2, o2_3, o2_4, o2_5, o2_6, o2_7);
    word word3(i0, i1, i2, i3, i4, i5, i6, i7, sel3, rw, o3_0, o3_1, o3_2, o3_3, o3_4, o3_5, o3_6, o3_7);
    word word4(i0, i1, i2, i3, i4, i5, i6, i7, sel4, rw, o4_0, o4_1, o4_2, o4_3, o4_4, o4_5, o4_6, o4_7);
    word word5(i0, i1, i2, i3, i4, i5, i6, i7, sel5, rw, o5_0, o5_1, o5_2, o5_3, o5_4, o5_5, o5_6, o5_7);
    word word6(i0, i1, i2, i3, i4, i5, i6, i7, sel6, rw, o6_0, o6_1, o6_2, o6_3, o6_4, o6_5, o6_6, o6_7);
    word word7(i0, i1, i2, i3, i4, i5, i6, i7, sel7, rw, o7_0, o7_1, o7_2, o7_3, o7_4, o7_5, o7_6, o7_7);

    and_gate_8 output_gate0(o0, o0_0, o1_0, o2_0, o3_0, o4_0, o5_0, o6_0, o7_0); // 0th output bit
    and_gate_8 output_gate1(o1, o0_1, o1_1, o2_1, o3_1, o4_1, o5_1, o6_1, o7_1); // 1th output bit 
    and_gate_8 output_gate2(o2, o0_2, o1_2, o2_2, o3_2, o4_2, o5_2, o6_2, o7_2); // 2th output bit
    and_gate_8 output_gate3(o3, o0_3, o1_3, o2_3, o3_3, o4_3, o5_3, o6_3, o7_3); // 3th output bit
    and_gate_8 output_gate4(o4, o0_4, o1_4, o2_4, o3_4, o4_4, o5_4, o6_4, o7_4); // 4th output bit
    and_gate_8 output_gate5(o5, o0_5, o1_5, o2_5, o3_5, o4_5, o5_5, o6_5, o7_5); // 5th output bit
    and_gate_8 output_gate6(o6, o0_6, o1_6, o2_6, o3_6, o4_6, o5_6, o6_6, o7_6); // 6th output bit
    and_gate_8 output_gate7(o7, o0_7, o1_7, o2_7, o3_7, o4_7, o5_7, o6_7, o7_7); // 7th output bit
endmodule