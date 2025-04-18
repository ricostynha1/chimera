// This program was cloned from: https://github.com/chipsalliance/UHDM-integration-tests
// License: Apache License 2.0

/* Generated by Yosys 0.27+9 (git sha1 101d19bb6, gcc 11.2.0-7ubuntu2 -fPIC -Os) */

(* top =  1  *)

module bsg_transpose(i, o);
  
  input [255:0] i;
  wire [255:0] i;
  
  output [255:0] o;
  wire [255:0] o;
  assign o = { i[255], i[239], i[223], i[207], i[191], i[175], i[159], i[143], i[127], i[111], i[95], i[79], i[63], i[47], i[31], i[15], i[254], i[238], i[222], i[206], i[190], i[174], i[158], i[142], i[126], i[110], i[94], i[78], i[62], i[46], i[30], i[14], i[253], i[237], i[221], i[205], i[189], i[173], i[157], i[141], i[125], i[109], i[93], i[77], i[61], i[45], i[29], i[13], i[252], i[236], i[220], i[204], i[188], i[172], i[156], i[140], i[124], i[108], i[92], i[76], i[60], i[44], i[28], i[12], i[251], i[235], i[219], i[203], i[187], i[171], i[155], i[139], i[123], i[107], i[91], i[75], i[59], i[43], i[27], i[11], i[250], i[234], i[218], i[202], i[186], i[170], i[154], i[138], i[122], i[106], i[90], i[74], i[58], i[42], i[26], i[10], i[249], i[233], i[217], i[201], i[185], i[169], i[153], i[137], i[121], i[105], i[89], i[73], i[57], i[41], i[25], i[9], i[248], i[232], i[216], i[200], i[184], i[168], i[152], i[136], i[120], i[104], i[88], i[72], i[56], i[40], i[24], i[8], i[247], i[231], i[215], i[199], i[183], i[167], i[151], i[135], i[119], i[103], i[87], i[71], i[55], i[39], i[23], i[7], i[246], i[230], i[214], i[198], i[182], i[166], i[150], i[134], i[118], i[102], i[86], i[70], i[54], i[38], i[22], i[6], i[245], i[229], i[213], i[197], i[181], i[165], i[149], i[133], i[117], i[101], i[85], i[69], i[53], i[37], i[21], i[5], i[244], i[228], i[212], i[196], i[180], i[164], i[148], i[132], i[116], i[100], i[84], i[68], i[52], i[36], i[20], i[4], i[243], i[227], i[211], i[195], i[179], i[163], i[147], i[131], i[115], i[99], i[83], i[67], i[51], i[35], i[19], i[3], i[242], i[226], i[210], i[194], i[178], i[162], i[146], i[130], i[114], i[98], i[82], i[66], i[50], i[34], i[18], i[2], i[241], i[225], i[209], i[193], i[177], i[161], i[145], i[129], i[113], i[97], i[81], i[65], i[49], i[33], i[17], i[1], i[240], i[224], i[208], i[192], i[176], i[160], i[144], i[128], i[112], i[96], i[80], i[64], i[48], i[32], i[16], i[0] };
endmodule

