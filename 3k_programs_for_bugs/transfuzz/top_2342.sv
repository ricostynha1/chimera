/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [8:0] _01_;
  wire [11:0] _02_;
  reg [5:0] _03_;
  reg [6:0] _04_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_17z;
  wire [4:0] celloutsig_0_18z;
  wire [14:0] celloutsig_0_19z;
  wire [50:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [7:0] celloutsig_0_22z;
  wire [5:0] celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [2:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [3:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [2:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [7:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_53z;
  wire [15:0] celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire [19:0] celloutsig_0_73z;
  wire celloutsig_0_74z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [9:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [17:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire [3:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_35z = ~((celloutsig_0_4z | celloutsig_0_1z[45]) & celloutsig_0_24z[6]);
  assign celloutsig_0_68z = ~((celloutsig_0_53z[2] | celloutsig_0_40z) & celloutsig_0_4z);
  assign celloutsig_1_2z = ~((celloutsig_1_0z | celloutsig_1_0z) & in_data[146]);
  assign celloutsig_1_8z = ~((celloutsig_1_2z | celloutsig_1_4z[6]) & _00_);
  assign celloutsig_0_14z = ~((celloutsig_0_7z | in_data[8]) & celloutsig_0_0z[0]);
  assign celloutsig_0_20z = ~((celloutsig_0_0z[3] | celloutsig_0_17z[0]) & celloutsig_0_2z);
  assign celloutsig_0_58z = celloutsig_0_28z ^ celloutsig_0_20z;
  assign celloutsig_1_13z = celloutsig_1_5z ^ celloutsig_1_12z;
  assign celloutsig_0_29z = celloutsig_0_5z ^ celloutsig_0_12z[4];
  always_ff @(posedge celloutsig_1_19z[0], posedge clkin_data[32])
    if (clkin_data[32]) _01_ <= 9'h000;
    else _01_ <= { celloutsig_0_38z, celloutsig_0_20z, celloutsig_0_35z, celloutsig_0_0z, celloutsig_0_43z, celloutsig_0_46z };
  reg [11:0] _15_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _15_ <= 12'h000;
    else _15_ <= celloutsig_1_4z[11:0];
  assign { _02_[11:5], _00_, _02_[3:0] } = _15_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _03_ <= 6'h00;
    else _03_ <= _02_[11:6];
  always_ff @(posedge celloutsig_1_19z[0], posedge clkin_data[32])
    if (clkin_data[32]) _04_ <= 7'h00;
    else _04_ <= { celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_0_37z = { celloutsig_0_1z[25:21], celloutsig_0_10z, celloutsig_0_35z } == { celloutsig_0_11z, celloutsig_0_36z, celloutsig_0_26z };
  assign celloutsig_0_44z = { celloutsig_0_1z[43:40], celloutsig_0_31z } == celloutsig_0_1z[27:23];
  assign celloutsig_0_74z = { celloutsig_0_19z[9], _01_ } == { celloutsig_0_54z[8:0], celloutsig_0_63z };
  assign celloutsig_1_1z = { in_data[137:133], celloutsig_1_0z } == in_data[153:148];
  assign celloutsig_1_12z = { celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_6z } == { _02_[8:7], celloutsig_1_2z };
  assign celloutsig_1_18z = { _03_[4], celloutsig_1_9z, celloutsig_1_14z, _03_, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_16z, celloutsig_1_14z, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z } == { _02_[9:5], _00_, _02_[3:1], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_16z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_16z, celloutsig_1_4z };
  assign celloutsig_0_25z = in_data[24:21] == celloutsig_0_19z[6:3];
  assign celloutsig_0_43z = { celloutsig_0_22z[5], celloutsig_0_2z, celloutsig_0_35z } >= { celloutsig_0_19z[7], celloutsig_0_2z, celloutsig_0_9z };
  assign celloutsig_0_47z = { _04_[4:2], celloutsig_0_43z, celloutsig_0_26z } >= celloutsig_0_19z[6:0];
  assign celloutsig_1_16z = { celloutsig_1_15z[5:2], celloutsig_1_9z, celloutsig_1_12z } >= { celloutsig_1_15z[7:1], celloutsig_1_13z, celloutsig_1_0z };
  assign celloutsig_0_28z = celloutsig_0_1z[29:9] >= { celloutsig_0_12z[4:0], celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_15z };
  assign celloutsig_0_3z = { celloutsig_0_1z[14:13], celloutsig_0_2z } > in_data[16:14];
  assign celloutsig_1_6z = { celloutsig_1_4z[17:10], celloutsig_1_1z, celloutsig_1_0z } > in_data[162:153];
  assign celloutsig_1_17z = { celloutsig_1_16z, celloutsig_1_8z, celloutsig_1_6z } > { in_data[160:159], celloutsig_1_14z };
  assign celloutsig_0_15z = { celloutsig_0_1z[36:35], celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_0z } > { celloutsig_0_1z[48:34], celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_0_21z = celloutsig_0_1z[23:21] > celloutsig_0_13z;
  assign celloutsig_0_4z = ! { in_data[72:63], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_46z = ! { celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_43z, celloutsig_0_35z };
  assign celloutsig_0_64z = ! { celloutsig_0_19z[8], celloutsig_0_62z };
  assign celloutsig_1_5z = ! { in_data[169:159], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_11z = ! { celloutsig_0_1z[30:20], celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_30z = celloutsig_0_0z[2] & ~(celloutsig_0_22z[3]);
  assign celloutsig_0_5z = celloutsig_0_0z[0] & ~(celloutsig_0_3z);
  assign celloutsig_0_8z = in_data[53] & ~(in_data[13]);
  assign celloutsig_0_0z = in_data[28:25] % { 1'h1, in_data[65:63] };
  assign celloutsig_0_34z = _04_[4:1] % { 1'h1, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_0_42z = { celloutsig_0_22z[6:0], celloutsig_0_8z } % { 1'h1, celloutsig_0_34z, celloutsig_0_20z, celloutsig_0_9z, in_data[0] };
  assign celloutsig_0_53z = { celloutsig_0_26z[0], celloutsig_0_34z } % { 1'h1, celloutsig_0_1z[15:14], celloutsig_0_11z, celloutsig_0_29z };
  assign celloutsig_0_54z = { celloutsig_0_24z[8:0], celloutsig_0_44z, celloutsig_0_18z[4:1], celloutsig_0_15z, celloutsig_0_7z } % { 1'h1, celloutsig_0_19z[10:8], celloutsig_0_31z, celloutsig_0_29z, celloutsig_0_23z, celloutsig_0_43z, celloutsig_0_37z, celloutsig_0_15z, celloutsig_0_29z };
  assign celloutsig_0_73z = { celloutsig_0_25z, celloutsig_0_37z, celloutsig_0_14z, celloutsig_0_68z, celloutsig_0_19z, celloutsig_0_64z } % { 1'h1, celloutsig_0_42z[3:0], celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_57z, celloutsig_0_65z, celloutsig_0_27z, celloutsig_0_58z, celloutsig_0_68z, celloutsig_0_47z, celloutsig_0_63z };
  assign celloutsig_1_4z = in_data[180:163] % { 1'h1, in_data[178:163], celloutsig_1_2z };
  assign celloutsig_1_9z = { _00_, _02_[3:1] } % { 1'h1, in_data[112:111], celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_4z[6:1], celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_0z } % { 1'h1, celloutsig_1_18z, celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_18z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z, in_data[96] };
  assign celloutsig_0_13z = { in_data[32], celloutsig_0_9z, celloutsig_0_6z } % { 1'h1, celloutsig_0_11z, in_data[0] };
  assign celloutsig_0_22z = { celloutsig_0_0z[3:2], celloutsig_0_13z, celloutsig_0_17z } % { 1'h1, _04_[5:1], celloutsig_0_11z, celloutsig_0_10z };
  assign celloutsig_0_62z = { celloutsig_0_13z[1], celloutsig_0_5z, celloutsig_0_10z } % { 1'h1, celloutsig_0_37z, celloutsig_0_29z };
  assign celloutsig_1_15z = { celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_9z } % { 1'h1, in_data[107:105], _03_ };
  assign celloutsig_0_1z = { in_data[46:0], celloutsig_0_0z } % { 1'h1, in_data[76:27] };
  assign celloutsig_0_23z = { celloutsig_0_19z[5:1], celloutsig_0_4z } % { 1'h1, celloutsig_0_18z[2:1], celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_36z = celloutsig_0_1z[32] ? { in_data[58:57], celloutsig_0_20z } : { celloutsig_0_24z[4], celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_12z = celloutsig_0_2z ? { celloutsig_0_1z[37:32], celloutsig_0_5z } : { in_data[31:26], celloutsig_0_7z };
  assign celloutsig_0_17z = celloutsig_0_2z ? _04_[4:2] : in_data[13:11];
  assign celloutsig_0_18z[4:1] = _04_[6] ? { celloutsig_0_5z, celloutsig_0_13z } : { celloutsig_0_0z[3], celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_15z };
  assign celloutsig_0_19z = celloutsig_0_1z[10] ? { celloutsig_0_12z[3:2], celloutsig_0_18z[4:1], celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_7z } : { celloutsig_0_1z[47:42], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_10z };
  assign celloutsig_0_24z = celloutsig_0_15z ? { celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_23z } : celloutsig_0_19z[14:5];
  assign celloutsig_0_26z = celloutsig_0_25z ? { celloutsig_0_13z[2:1], celloutsig_0_6z } : { celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_11z };
  assign celloutsig_0_31z = { celloutsig_0_1z[44:43], celloutsig_0_30z, celloutsig_0_24z } != { celloutsig_0_23z[2:1], celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_22z };
  assign celloutsig_0_40z = celloutsig_0_12z != { celloutsig_0_1z[21:17], celloutsig_0_21z, celloutsig_0_31z };
  assign celloutsig_0_6z = celloutsig_0_0z[3:1] != { celloutsig_0_1z[7:6], celloutsig_0_2z };
  assign celloutsig_0_7z = { in_data[82:81], celloutsig_0_0z } != { celloutsig_0_0z[3:1], celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_65z = celloutsig_0_54z[14:12] != celloutsig_0_17z;
  assign celloutsig_1_0z = in_data[189:186] != in_data[190:187];
  assign celloutsig_1_11z = { in_data[160:123], celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_2z } != { _03_[3:0], celloutsig_1_2z, celloutsig_1_0z, _02_[11:5], _00_, _02_[3:0], celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_9z };
  assign celloutsig_1_14z = { celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_11z } != { _03_[1], celloutsig_1_11z, celloutsig_1_9z };
  assign celloutsig_0_2z = in_data[31:26] != { celloutsig_0_0z[3:2], celloutsig_0_0z };
  assign celloutsig_0_27z = celloutsig_0_1z[18:6] != { celloutsig_0_1z[22:21], celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_22z };
  assign celloutsig_0_38z = ~((celloutsig_0_11z & celloutsig_0_21z) | celloutsig_0_17z[2]);
  assign celloutsig_0_57z = ~((celloutsig_0_13z[1] & celloutsig_0_21z) | celloutsig_0_13z[1]);
  assign celloutsig_0_63z = ~((celloutsig_0_0z[1] & celloutsig_0_47z) | celloutsig_0_26z[0]);
  assign celloutsig_1_3z = ~((celloutsig_1_1z & in_data[109]) | celloutsig_1_2z);
  assign celloutsig_0_9z = ~((celloutsig_0_3z & celloutsig_0_0z[3]) | celloutsig_0_7z);
  assign celloutsig_0_10z = ~((in_data[25] & celloutsig_0_2z) | celloutsig_0_6z);
  assign _02_[4] = _00_;
  assign celloutsig_0_18z[0] = celloutsig_0_15z;
  assign { out_data[128], out_data[104:96], out_data[51:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_73z, celloutsig_0_74z };
endmodule
