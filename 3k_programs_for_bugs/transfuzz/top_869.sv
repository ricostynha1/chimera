/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [6:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [14:0] celloutsig_0_26z;
  reg [4:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [16:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [4:0] celloutsig_0_38z;
  reg [23:0] celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire [10:0] celloutsig_0_40z;
  wire [14:0] celloutsig_0_41z;
  wire [9:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [8:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [9:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [11:0] celloutsig_0_50z;
  wire [8:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [7:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [4:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [17:0] celloutsig_1_4z;
  wire celloutsig_1_7z;
  wire [13:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_14z = celloutsig_0_12z[4] ? in_data[8] : celloutsig_0_10z;
  assign celloutsig_1_2z = !(celloutsig_1_0z[3] ? celloutsig_1_1z : celloutsig_1_1z);
  assign celloutsig_1_7z = !(celloutsig_1_0z[0] ? celloutsig_1_0z[1] : in_data[108]);
  assign celloutsig_0_1z = !(celloutsig_0_0z[4] ? in_data[53] : in_data[28]);
  assign celloutsig_0_4z = ~(celloutsig_0_1z | celloutsig_0_1z);
  assign celloutsig_0_22z = ~(celloutsig_0_6z[0] | celloutsig_0_1z);
  assign celloutsig_0_2z = ~(celloutsig_0_1z | in_data[86]);
  assign celloutsig_0_17z = ~celloutsig_0_1z;
  assign celloutsig_0_49z = celloutsig_0_26z[8] | celloutsig_0_6z[0];
  assign celloutsig_0_33z = ~(celloutsig_0_21z ^ celloutsig_0_28z);
  assign celloutsig_0_19z = ~(celloutsig_0_2z ^ celloutsig_0_9z);
  assign celloutsig_0_9z = { celloutsig_0_0z[5:1], celloutsig_0_0z[6:3], celloutsig_0_0z[0] } === { in_data[30:28], celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_6z[0] };
  assign celloutsig_0_29z = { celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_19z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_17z } === { in_data[24:23], celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_25z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_15z };
  assign celloutsig_0_36z = { celloutsig_0_0z, celloutsig_0_32z } <= celloutsig_0_31z[15:8];
  assign celloutsig_0_55z = { celloutsig_0_39z[14:7], celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_34z, celloutsig_0_51z, celloutsig_0_33z, celloutsig_0_49z } <= { celloutsig_0_41z[14:8], celloutsig_0_34z, celloutsig_0_12z, celloutsig_0_52z, celloutsig_0_51z };
  assign celloutsig_1_3z = { in_data[124:122], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z } <= { in_data[188:182], celloutsig_1_1z };
  assign celloutsig_0_28z = { celloutsig_0_12z[3:2], celloutsig_0_21z } <= { celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_20z };
  assign celloutsig_0_34z = { celloutsig_0_17z, celloutsig_0_29z, celloutsig_0_5z } && { celloutsig_0_4z, celloutsig_0_25z, celloutsig_0_20z };
  assign celloutsig_0_37z = { celloutsig_0_22z, celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_29z, celloutsig_0_9z, celloutsig_0_19z, celloutsig_0_6z } && { in_data[6:3], celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_20z };
  assign celloutsig_0_11z = { in_data[45], celloutsig_0_7z, celloutsig_0_6z } && { celloutsig_0_0z[4], celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_21z = { celloutsig_0_0z[3:0], celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_12z } && { celloutsig_0_18z[1:0], celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_13z };
  assign celloutsig_0_23z = { celloutsig_0_0z[2:1], celloutsig_0_21z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_8z } && { celloutsig_0_12z[4:1], celloutsig_0_3z };
  assign celloutsig_0_25z = { celloutsig_0_24z[2], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_23z, celloutsig_0_15z } && { in_data[81:67], celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_5z };
  assign celloutsig_0_32z = { celloutsig_0_26z[12:10], celloutsig_0_27z } && { in_data[31], celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_16z };
  assign celloutsig_0_45z = { celloutsig_0_7z, celloutsig_0_32z, celloutsig_0_17z, celloutsig_0_37z } || { celloutsig_0_8z[2], celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_13z };
  assign celloutsig_0_7z = celloutsig_0_6z || { celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_1_1z = celloutsig_1_0z[2:0] < in_data[98:96];
  assign celloutsig_1_18z = { in_data[116:106], celloutsig_1_3z, celloutsig_1_2z } < celloutsig_1_8z[12:0];
  assign celloutsig_0_10z = { celloutsig_0_0z[6:1], celloutsig_0_1z, celloutsig_0_1z } < { in_data[21], celloutsig_0_0z };
  assign celloutsig_0_16z = { celloutsig_0_12z[4:2], celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_2z } < { celloutsig_0_3z[4:0], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_12z };
  assign celloutsig_0_20z = { in_data[79:76], celloutsig_0_18z } < { celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_12z, celloutsig_0_10z };
  assign celloutsig_0_52z = celloutsig_0_48z[5] & ~(celloutsig_0_41z[9]);
  assign celloutsig_0_5z = celloutsig_0_4z & ~(celloutsig_0_1z);
  assign celloutsig_0_13z = celloutsig_0_7z & ~(celloutsig_0_11z);
  assign celloutsig_0_15z = celloutsig_0_1z & ~(celloutsig_0_7z);
  assign celloutsig_0_18z = celloutsig_0_8z[4:1] % { 1'h1, celloutsig_0_12z[3:1] };
  assign celloutsig_1_0z = in_data[146:143] % { 1'h1, in_data[155:153] };
  assign celloutsig_1_8z = { celloutsig_1_4z[14:5], celloutsig_1_0z } % { 1'h1, in_data[121:113], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_0_40z = { celloutsig_0_12z[2:0], celloutsig_0_27z, celloutsig_0_23z, celloutsig_0_28z, celloutsig_0_21z } * { in_data[64:59], celloutsig_0_27z };
  assign celloutsig_0_44z = celloutsig_0_40z[8:0] * { celloutsig_0_24z[2], celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_22z, celloutsig_0_23z, celloutsig_0_33z, celloutsig_0_15z };
  assign celloutsig_0_48z = { celloutsig_0_26z[12:7], celloutsig_0_34z, celloutsig_0_43z, celloutsig_0_14z, celloutsig_0_45z } * { celloutsig_0_42z[5:4], celloutsig_0_1z, celloutsig_0_36z, celloutsig_0_9z, celloutsig_0_12z };
  assign celloutsig_0_31z = { celloutsig_0_8z[3:2], celloutsig_0_28z, celloutsig_0_28z, celloutsig_0_8z, celloutsig_0_20z, celloutsig_0_23z, celloutsig_0_21z, celloutsig_0_20z, celloutsig_0_6z, celloutsig_0_23z } * { in_data[55:49], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_27z, celloutsig_0_28z, celloutsig_0_22z, celloutsig_0_10z };
  assign celloutsig_0_41z = - { celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_25z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_0_42z = - { celloutsig_0_31z[9:3], celloutsig_0_23z, celloutsig_0_37z, celloutsig_0_22z };
  assign celloutsig_1_19z = - { in_data[109:105], celloutsig_1_3z };
  assign celloutsig_0_8z = - { celloutsig_0_0z[6:3], celloutsig_0_1z };
  assign celloutsig_0_26z = - { celloutsig_0_8z[4:3], celloutsig_0_25z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_16z, celloutsig_0_22z, celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_2z, celloutsig_0_25z };
  assign celloutsig_0_43z = | celloutsig_0_26z[12:1];
  assign celloutsig_0_35z = ~^ { celloutsig_0_12z[1:0], celloutsig_0_17z, celloutsig_0_26z };
  assign celloutsig_0_38z = { celloutsig_0_24z[1:0], celloutsig_0_22z, celloutsig_0_33z, celloutsig_0_35z } >> { celloutsig_0_28z, celloutsig_0_22z, celloutsig_0_5z, celloutsig_0_28z, celloutsig_0_25z };
  assign celloutsig_0_3z = in_data[78:73] >> celloutsig_0_0z[5:0];
  assign celloutsig_0_51z = { celloutsig_0_50z[11:4], celloutsig_0_37z } >> { celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_45z, celloutsig_0_36z, celloutsig_0_5z, celloutsig_0_34z, celloutsig_0_9z, celloutsig_0_20z };
  assign celloutsig_0_54z = { celloutsig_0_38z[2:1], celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_18z } >> celloutsig_0_44z[8:1];
  assign celloutsig_0_6z = celloutsig_0_0z[4:2] >> { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_24z = { celloutsig_0_9z, celloutsig_0_21z, celloutsig_0_5z, celloutsig_0_21z } >> { celloutsig_0_18z[2:1], celloutsig_0_4z, celloutsig_0_23z };
  assign celloutsig_0_50z = celloutsig_0_26z[13:2] ~^ { celloutsig_0_33z, celloutsig_0_48z, celloutsig_0_33z };
  assign celloutsig_0_12z = celloutsig_0_0z[5:1] ~^ { celloutsig_0_3z[5], celloutsig_0_7z, celloutsig_0_6z };
  always_latch
    if (clkin_data[32]) celloutsig_0_0z = 7'h00;
    else if (celloutsig_1_18z) celloutsig_0_0z = in_data[14:8];
  always_latch
    if (clkin_data[32]) celloutsig_0_39z = 24'h000000;
    else if (celloutsig_1_18z) celloutsig_0_39z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_23z, celloutsig_0_3z, celloutsig_0_35z, celloutsig_0_25z, celloutsig_0_27z };
  always_latch
    if (clkin_data[64]) celloutsig_1_4z = 18'h00000;
    else if (clkin_data[0]) celloutsig_1_4z = { celloutsig_1_0z[1], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_27z = 5'h00;
    else if (celloutsig_1_18z) celloutsig_0_27z = { celloutsig_0_8z[4:1], celloutsig_0_21z };
  assign { out_data[128], out_data[101:96], out_data[39:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_54z, celloutsig_0_55z };
endmodule
