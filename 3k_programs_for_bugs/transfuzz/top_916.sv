/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [3:0] _02_;
  wire [12:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_4z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
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
  assign celloutsig_0_29z = in_data[93] ? celloutsig_0_12z : celloutsig_0_21z;
  assign celloutsig_0_30z = celloutsig_0_27z ? celloutsig_0_27z : celloutsig_0_11z;
  assign celloutsig_0_31z = celloutsig_0_2z ? celloutsig_0_21z : celloutsig_0_30z;
  assign celloutsig_0_32z = celloutsig_0_0z ? _00_ : celloutsig_0_16z;
  assign celloutsig_0_33z = celloutsig_0_27z ? celloutsig_0_15z : celloutsig_0_26z;
  assign celloutsig_0_34z = celloutsig_0_26z ? celloutsig_0_4z : celloutsig_0_18z;
  assign celloutsig_0_35z = celloutsig_0_24z ? celloutsig_0_27z : celloutsig_0_31z;
  assign celloutsig_0_37z = in_data[73] ? celloutsig_0_34z : celloutsig_0_24z;
  assign celloutsig_0_4z = celloutsig_0_0z ? celloutsig_0_3z : in_data[77];
  assign celloutsig_0_42z = celloutsig_0_12z ? celloutsig_0_24z : celloutsig_0_40z;
  assign celloutsig_1_0z = in_data[182] ? in_data[112] : in_data[142];
  assign celloutsig_1_1z = celloutsig_1_0z ? in_data[139] : in_data[150];
  assign celloutsig_1_2z = celloutsig_1_0z ? celloutsig_1_0z : in_data[135];
  assign celloutsig_1_3z = celloutsig_1_0z ? in_data[137] : celloutsig_1_0z;
  assign celloutsig_1_4z = celloutsig_1_2z ? celloutsig_1_1z : celloutsig_1_0z;
  assign celloutsig_1_5z = celloutsig_1_2z ? in_data[97] : celloutsig_1_1z;
  assign celloutsig_1_6z = celloutsig_1_3z ? in_data[155] : celloutsig_1_1z;
  assign celloutsig_1_19z = celloutsig_1_4z ? in_data[170] : celloutsig_1_2z;
  assign celloutsig_1_8z = celloutsig_1_4z ? celloutsig_1_19z : celloutsig_1_3z;
  assign celloutsig_1_9z = celloutsig_1_4z ? in_data[123] : celloutsig_1_19z;
  assign celloutsig_1_10z = celloutsig_1_6z ? in_data[126] : celloutsig_1_8z;
  assign celloutsig_1_11z = celloutsig_1_2z ? celloutsig_1_9z : in_data[124];
  assign celloutsig_1_12z = celloutsig_1_4z ? celloutsig_1_8z : celloutsig_1_5z;
  assign celloutsig_1_13z = celloutsig_1_12z ? in_data[133] : celloutsig_1_4z;
  assign celloutsig_0_6z = celloutsig_0_4z ? celloutsig_0_0z : celloutsig_0_4z;
  assign celloutsig_1_18z = celloutsig_1_15z ? celloutsig_1_11z : celloutsig_1_13z;
  assign celloutsig_0_11z = celloutsig_0_7z ? celloutsig_0_8z : celloutsig_0_2z;
  assign celloutsig_0_1z = celloutsig_0_0z ? in_data[26] : in_data[28];
  assign celloutsig_0_15z = celloutsig_0_4z ? celloutsig_0_6z : celloutsig_0_10z;
  assign celloutsig_0_16z = celloutsig_0_12z ? celloutsig_0_13z : _01_;
  assign celloutsig_0_21z = celloutsig_0_1z ? celloutsig_0_2z : celloutsig_0_13z;
  assign celloutsig_0_24z = celloutsig_0_2z ? celloutsig_0_22z : celloutsig_0_19z;
  assign celloutsig_0_25z = _01_ ? celloutsig_0_7z : celloutsig_0_22z;
  assign celloutsig_0_27z = celloutsig_0_26z ? celloutsig_0_13z : celloutsig_0_6z;
  reg [3:0] _38_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _38_ <= 4'h0;
    else _38_ <= { celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_3z };
  assign { _02_[3:2], _01_, _02_[0] } = _38_;
  reg [12:0] _39_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _39_ <= 13'h0000;
    else _39_ <= { celloutsig_0_19z, celloutsig_0_17z, _02_[3:2], _01_, _02_[0], celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_9z };
  assign { _03_[12:7], _00_, _03_[5:0] } = _39_;
  assign celloutsig_0_0z = in_data[65:56] == in_data[79:70];
  assign celloutsig_0_28z = { _00_, _03_[5:1], celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_1z } == { in_data[76:70], celloutsig_0_27z, celloutsig_0_0z, celloutsig_0_19z, celloutsig_0_8z, celloutsig_0_22z, celloutsig_0_10z, celloutsig_0_10z };
  assign celloutsig_0_3z = in_data[17:12] == { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_36z = { celloutsig_0_16z, celloutsig_0_28z, celloutsig_0_26z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_24z, in_data[93], _02_[3:2], _01_, _02_[0], celloutsig_0_34z, celloutsig_0_32z } == { _03_[12:7], _00_, _03_[5:2], celloutsig_0_27z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_22z };
  assign celloutsig_0_38z = { celloutsig_0_27z, celloutsig_0_23z, celloutsig_0_0z, celloutsig_0_29z } == { celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_35z, celloutsig_0_6z };
  assign celloutsig_0_39z = { in_data[45:41], celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_38z, celloutsig_0_19z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_25z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_31z, celloutsig_0_33z, celloutsig_0_6z, celloutsig_0_28z } == { celloutsig_0_11z, celloutsig_0_30z, celloutsig_0_3z, celloutsig_0_32z, celloutsig_0_30z, celloutsig_0_4z, celloutsig_0_26z, celloutsig_0_31z, celloutsig_0_22z, celloutsig_0_37z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_35z, celloutsig_0_34z, celloutsig_0_31z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_38z, celloutsig_0_3z, celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_16z };
  assign celloutsig_0_40z = { _03_[11:7], _00_, _03_[5:4], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_36z } == { in_data[93], celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_3z, celloutsig_0_32z, celloutsig_0_24z, celloutsig_0_12z, celloutsig_0_29z, celloutsig_0_39z, celloutsig_0_33z, celloutsig_0_31z };
  assign celloutsig_0_41z = { _03_[8:7], _00_, _03_[5:3], celloutsig_0_19z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_35z, celloutsig_0_8z, celloutsig_0_39z, celloutsig_0_40z, celloutsig_0_36z, celloutsig_0_37z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_21z, in_data[93], celloutsig_0_3z, celloutsig_0_39z, celloutsig_0_15z, celloutsig_0_33z, celloutsig_0_31z, celloutsig_0_33z, celloutsig_0_36z, celloutsig_0_0z } == { in_data[65:42], celloutsig_0_11z, celloutsig_0_38z, celloutsig_0_9z };
  assign celloutsig_0_44z = { _03_[11:7], _00_, celloutsig_0_32z, celloutsig_0_35z, celloutsig_0_4z, celloutsig_0_42z } == { celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_2z, in_data[93], celloutsig_0_40z, celloutsig_0_42z, celloutsig_0_38z, celloutsig_0_8z, in_data[93] };
  assign celloutsig_0_45z = { _03_[8:7], _00_, celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_41z } == { celloutsig_0_13z, celloutsig_0_39z, celloutsig_0_26z, celloutsig_0_16z, celloutsig_0_26z, celloutsig_0_10z };
  assign celloutsig_1_14z = { in_data[184], celloutsig_1_2z, celloutsig_1_8z } == { celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_9z };
  assign celloutsig_1_15z = { in_data[131:123], celloutsig_1_14z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_19z, celloutsig_1_10z } == { celloutsig_1_13z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_19z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_2z };
  assign celloutsig_0_7z = { in_data[14:7], celloutsig_0_2z, celloutsig_0_3z } == { in_data[32:30], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_8z = { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z } == { in_data[52], in_data[93], in_data[93] };
  assign celloutsig_0_9z = { celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_0z } == { in_data[59:58], celloutsig_0_1z };
  assign celloutsig_0_10z = in_data[10:8] == { celloutsig_0_3z, in_data[93], celloutsig_0_3z };
  assign celloutsig_0_12z = { celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_7z } == { celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_13z = { in_data[60:59], celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_2z, in_data[93], celloutsig_0_0z, celloutsig_0_1z, in_data[93], celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_10z } == { in_data[61:50], celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_17z = { in_data[14:12], celloutsig_0_13z } == { _02_[2], _01_, _02_[0], celloutsig_0_10z };
  assign celloutsig_0_18z = in_data[76:46] == { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_1z, _02_[3:2], _01_, _02_[0], celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_1z, in_data[93], _02_[3:2], _01_, _02_[0], celloutsig_0_2z, _02_[3:2], _01_, _02_[0], celloutsig_0_2z, celloutsig_0_12z, in_data[93], celloutsig_0_13z, celloutsig_0_17z };
  assign celloutsig_0_19z = in_data[82:79] == { celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_11z };
  assign celloutsig_0_22z = { celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_21z } == { celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_13z };
  assign celloutsig_0_2z = { in_data[38:36], celloutsig_0_0z } == in_data[47:44];
  assign celloutsig_0_23z = { _03_[12:11], in_data[93], celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_22z } == { celloutsig_0_6z, in_data[93], celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_19z };
  assign celloutsig_0_26z = { in_data[39:35], celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_0z } == { in_data[93], celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_4z, celloutsig_0_25z, celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_19z };
  assign _02_[1] = _01_;
  assign _03_[6] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_44z, celloutsig_0_45z };
endmodule
