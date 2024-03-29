/**********************************************************************
 * @brief Structure of 3-to-8 decoder
 * @param adr2...adr0, address inputs
 * @param sel0...sel7, word select outputs
 **********************************************************************/
module decoder (
        input adr2, adr1, adr0,
        output sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7
    );
    wire _adr2, _adr1, _adr0;

    not(_adr2, adr2);
    not(_adr1, adr1);
    not(_adr0, adr0);

    nand(sel0, _adr2, _adr1, _adr0);
    nand(sel1, _adr2, _adr1,  adr0);
    nand(sel2, _adr2,  adr1, _adr0);
    nand(sel3, _adr2,  adr1,  adr0);
    nand(sel4,  adr2, _adr1, _adr0);
    nand(sel5,  adr2, _adr1,  adr0);
    nand(sel6,  adr2,  adr1, _adr0);
    nand(sel7,  adr2,  adr1,  adr0);
endmodule