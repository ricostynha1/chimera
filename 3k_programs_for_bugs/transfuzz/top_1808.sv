/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [31:0] _00_;
  wire [21:0] _01_;
  reg [11:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [32:0] celloutsig_0_18z;
  wire [9:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [6:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire [6:0] celloutsig_0_30z;
  wire [26:0] celloutsig_0_32z;
  wire [6:0] celloutsig_0_33z;
  wire [10:0] celloutsig_0_35z;
  wire [5:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [2:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire [2:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [3:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [8:0] celloutsig_0_4z;
  wire celloutsig_0_55z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [4:0] celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_76z;
  wire [4:0] celloutsig_0_78z;
  wire [2:0] celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [22:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [8:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_6z = ~celloutsig_0_3z;
  assign celloutsig_1_5z = ~celloutsig_1_0z;
  assign celloutsig_0_21z = ~celloutsig_0_7z[2];
  assign celloutsig_0_11z = ~((celloutsig_0_9z | celloutsig_0_0z) & in_data[34]);
  assign celloutsig_0_15z = ~((celloutsig_0_1z | celloutsig_0_14z) & celloutsig_0_5z);
  assign celloutsig_1_8z = celloutsig_1_5z | ~(celloutsig_1_2z);
  assign celloutsig_1_11z = celloutsig_1_2z | ~(celloutsig_1_5z);
  assign celloutsig_0_1z = in_data[8] | ~(celloutsig_0_0z);
  assign celloutsig_0_14z = in_data[9] | ~(celloutsig_0_9z);
  assign celloutsig_0_5z = celloutsig_0_0z | celloutsig_0_3z;
  assign celloutsig_0_13z = celloutsig_0_0z | celloutsig_0_6z;
  assign celloutsig_0_17z = celloutsig_0_9z | celloutsig_0_15z;
  assign celloutsig_0_41z = ~(celloutsig_0_15z ^ celloutsig_0_28z[4]);
  assign celloutsig_0_25z = ~(celloutsig_0_19z[0] ^ celloutsig_0_4z[4]);
  reg [21:0] _17_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _17_ <= 22'h000000;
    else _17_ <= { celloutsig_0_25z, celloutsig_0_55z, celloutsig_0_10z, celloutsig_0_48z, _01_[14:10], celloutsig_0_27z, celloutsig_0_43z, celloutsig_0_60z, celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_76z, celloutsig_0_7z, celloutsig_0_21z };
  assign out_data[53:32] = _17_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _00_ <= 32'd0;
    else _00_ <= { in_data[61:35], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _02_ <= 12'h000;
    else _02_ <= { celloutsig_0_19z[9:3], celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_0z };
  reg [4:0] _20_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _20_ <= 5'h00;
    else _20_ <= { celloutsig_0_22z[4:1], celloutsig_0_16z };
  assign _01_[14:10] = _20_;
  assign celloutsig_0_46z = celloutsig_0_18z[19:17] / { 1'h1, celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_48z = { celloutsig_0_28z[4:3], celloutsig_0_14z, celloutsig_0_9z } / { 1'h1, celloutsig_0_33z[5:3] };
  assign celloutsig_1_3z = { in_data[131:130], celloutsig_1_0z, celloutsig_1_1z } == { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_6z = { in_data[127:121], celloutsig_1_3z } == { celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_1_10z = { in_data[113], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_5z } == { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_15z = in_data[160:157] === { celloutsig_1_14z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_6z };
  assign celloutsig_1_16z = { in_data[147], celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_15z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_6z } === { celloutsig_1_13z[11:2], celloutsig_1_4z };
  assign celloutsig_0_20z = { _00_[28:23], celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_3z } === { celloutsig_0_4z[7:0], celloutsig_0_13z };
  assign celloutsig_0_59z = { in_data[87:81], celloutsig_0_43z } <= in_data[78:71];
  assign celloutsig_1_1z = in_data[179:168] <= { in_data[107:97], celloutsig_1_0z };
  assign celloutsig_0_0z = in_data[57:41] && in_data[81:65];
  assign celloutsig_0_37z = _00_[17:14] && { celloutsig_0_19z[7], celloutsig_0_16z, celloutsig_0_3z, celloutsig_0_27z };
  assign celloutsig_0_60z = { celloutsig_0_11z, celloutsig_0_37z, celloutsig_0_27z } && { celloutsig_0_35z[1], celloutsig_0_59z, celloutsig_0_49z };
  assign celloutsig_0_16z = in_data[62:59] && { celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_27z = { in_data[51:44], celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_1z } && { _00_[24:19], celloutsig_0_20z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_13z };
  assign celloutsig_0_47z = _02_[4:0] < { celloutsig_0_18z[22], celloutsig_0_46z, celloutsig_0_41z };
  assign celloutsig_1_19z = { in_data[119:112], celloutsig_1_6z, celloutsig_1_6z } < { celloutsig_1_13z[17:9], celloutsig_1_12z };
  assign celloutsig_0_32z = { celloutsig_0_18z[6:1], celloutsig_0_24z, celloutsig_0_30z, celloutsig_0_9z, celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_0z } % { 1'h1, _00_[28:14], celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_7z, _01_[14:10], celloutsig_0_16z };
  assign celloutsig_1_13z = in_data[128:106] % { 1'h1, in_data[170:154], celloutsig_1_11z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_0_19z = celloutsig_0_18z[9:0] % { 1'h1, celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_11z };
  assign celloutsig_0_55z = { celloutsig_0_28z[2:0], celloutsig_0_12z, celloutsig_0_47z, celloutsig_0_7z, celloutsig_0_36z } != celloutsig_0_18z[19:6];
  assign celloutsig_1_17z = { in_data[136:135], celloutsig_1_0z } != { celloutsig_1_13z[12], celloutsig_1_3z, celloutsig_1_12z };
  assign celloutsig_0_3z = { _00_[7:4], celloutsig_0_1z, celloutsig_0_0z } !== { in_data[56:52], celloutsig_0_1z };
  assign celloutsig_1_12z = in_data[179:169] !== { in_data[113:104], celloutsig_1_10z };
  assign celloutsig_0_12z = { in_data[42:41], celloutsig_0_7z } !== in_data[7:3];
  assign celloutsig_0_23z = _00_[23:20] !== { in_data[9:7], celloutsig_0_21z };
  assign celloutsig_0_66z = ~ { celloutsig_0_4z[3], celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_14z };
  assign celloutsig_0_22z = ~ celloutsig_0_4z[7:1];
  assign celloutsig_0_76z = & { celloutsig_0_60z, celloutsig_0_55z, celloutsig_0_46z, celloutsig_0_32z[14:8], celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_8z[0], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_2z = & { celloutsig_1_1z, celloutsig_1_0z, in_data[187:182] };
  assign celloutsig_0_9z = & { celloutsig_0_5z, _00_[5:4] };
  assign celloutsig_0_10z = & { celloutsig_0_8z[0], celloutsig_0_0z };
  assign celloutsig_0_49z = | { celloutsig_0_4z[2], celloutsig_0_17z, celloutsig_0_39z, celloutsig_0_25z, celloutsig_0_14z };
  assign celloutsig_0_43z = ~^ { celloutsig_0_41z, celloutsig_0_39z, celloutsig_0_4z, celloutsig_0_28z };
  assign celloutsig_1_0z = ~^ in_data[101:99];
  assign celloutsig_1_4z = ~^ { in_data[112:110], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_1_9z = ~^ { celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_14z = ~^ { celloutsig_1_13z[12:5], celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_12z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_4z };
  assign celloutsig_0_33z = celloutsig_0_4z[8:2] >> { celloutsig_0_25z, celloutsig_0_28z };
  assign celloutsig_0_78z = celloutsig_0_66z >> celloutsig_0_19z[8:4];
  assign celloutsig_1_18z = { celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_17z, celloutsig_1_1z, celloutsig_1_16z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_0z } >> { celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_17z, celloutsig_1_10z, celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_6z, celloutsig_1_15z, celloutsig_1_5z };
  assign celloutsig_0_18z = { _00_[30:0], celloutsig_0_9z, celloutsig_0_13z } >> in_data[53:21];
  assign celloutsig_0_35z = { in_data[17:14], celloutsig_0_8z, celloutsig_0_16z } << { celloutsig_0_19z, celloutsig_0_25z };
  assign celloutsig_0_36z = celloutsig_0_18z[28:23] << { celloutsig_0_24z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_25z };
  assign celloutsig_0_8z = { celloutsig_0_4z[7:4], celloutsig_0_6z, celloutsig_0_1z } << { celloutsig_0_4z[3], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_28z = _02_[11:6] << _00_[30:25];
  assign celloutsig_0_30z = { celloutsig_0_19z[6:1], celloutsig_0_1z } << { celloutsig_0_19z[5:2], celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_15z };
  assign celloutsig_0_7z = { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z } >> celloutsig_0_4z[8:6];
  assign celloutsig_0_24z = celloutsig_0_22z[2:0] <<< { celloutsig_0_15z, celloutsig_0_3z, celloutsig_0_21z };
  assign celloutsig_0_39z = celloutsig_0_28z[5:3] ^ celloutsig_0_30z[6:4];
  assign celloutsig_0_4z = { in_data[85:79], celloutsig_0_1z, celloutsig_0_3z } ^ _00_[19:11];
  assign { _01_[21:15], _01_[9:0] } = { celloutsig_0_25z, celloutsig_0_55z, celloutsig_0_10z, celloutsig_0_48z, celloutsig_0_27z, celloutsig_0_43z, celloutsig_0_60z, celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_76z, celloutsig_0_7z, celloutsig_0_21z };
  assign { out_data[136:128], out_data[96], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z };
endmodule
