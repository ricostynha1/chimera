/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  reg [4:0] _01_;
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire [3:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_1z;
  wire [11:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [4:0] celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [7:0] celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [12:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [17:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [9:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire [7:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~(in_data[93] | in_data[63]);
  assign celloutsig_0_24z = ~celloutsig_0_0z;
  assign celloutsig_1_14z = ~((celloutsig_1_12z[6] | celloutsig_1_8z) & celloutsig_1_3z);
  assign celloutsig_0_6z = ~((celloutsig_0_2z | celloutsig_0_0z) & celloutsig_0_1z);
  assign celloutsig_0_17z = ~((celloutsig_0_5z | celloutsig_0_16z[1]) & (celloutsig_0_7z | celloutsig_0_7z));
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _01_ <= 5'h00;
    else _01_ <= in_data[69:65];
  always_ff @(posedge clkin_data[32], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 3'h0;
    else _00_ <= { celloutsig_1_6z[6:5], celloutsig_1_3z };
  assign celloutsig_1_16z = { celloutsig_1_6z[6:3], celloutsig_1_4z, celloutsig_1_12z } / { 1'h1, celloutsig_1_6z[6:1], celloutsig_1_2z, celloutsig_1_13z, celloutsig_1_9z, celloutsig_1_5z };
  assign celloutsig_0_11z = celloutsig_0_9z[3:1] / { 1'h1, celloutsig_0_9z[1:0] };
  assign celloutsig_1_0z = in_data[110:103] / { 1'h1, in_data[179:173] };
  assign celloutsig_0_4z = { in_data[39:29], celloutsig_0_1z } >= { in_data[84:76], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_7z = { celloutsig_0_4z, celloutsig_0_1z, _01_ } >= { _01_[3:0], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_1_3z = in_data[167:163] >= celloutsig_1_0z[5:1];
  assign celloutsig_1_4z = { in_data[139], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_3z } >= { celloutsig_1_0z[4:0], celloutsig_1_1z };
  assign celloutsig_1_1z = in_data[185:183] || in_data[191:189];
  assign celloutsig_0_9z = { in_data[92:90], celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z } % { 1'h1, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_13z = celloutsig_0_8z[6:4] % { 1'h1, celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_23z = { _01_, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_11z } % { 1'h1, celloutsig_0_11z[0], celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_17z };
  assign celloutsig_0_25z = - { celloutsig_0_23z[11:8], celloutsig_0_0z };
  assign celloutsig_1_13z = { celloutsig_1_0z[4:1], celloutsig_1_4z } !== { celloutsig_1_12z[10:7], celloutsig_1_3z };
  assign celloutsig_1_18z = { celloutsig_1_16z[16:5], celloutsig_1_11z, celloutsig_1_5z } !== { celloutsig_1_8z, celloutsig_1_6z, _00_ };
  assign celloutsig_1_2z = { celloutsig_1_0z[3], celloutsig_1_1z, celloutsig_1_0z } !== { in_data[126:118], celloutsig_1_1z };
  assign celloutsig_1_9z = { celloutsig_1_6z[7:1], celloutsig_1_4z } | { in_data[172:166], celloutsig_1_8z };
  assign celloutsig_0_16z = { celloutsig_0_15z[3:2], celloutsig_0_6z } | _01_[4:2];
  assign celloutsig_0_1z = | in_data[75:70];
  assign celloutsig_1_8z = celloutsig_1_6z[3] & celloutsig_1_6z[1];
  assign celloutsig_0_12z = celloutsig_0_5z & _01_[3];
  assign celloutsig_0_5z = | in_data[79:61];
  assign celloutsig_1_11z = ^ { in_data[188:185], celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_2z };
  assign celloutsig_1_5z = ^ { celloutsig_1_0z[7:5], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_12z = { celloutsig_1_9z[4:3], celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_9z } >> { in_data[102:99], celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_6z = { in_data[122], celloutsig_1_0z, celloutsig_1_5z } <<< { in_data[123:116], celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_15z = { celloutsig_0_9z[4:2], celloutsig_0_12z } ^ { celloutsig_0_8z[1], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_4z };
  assign celloutsig_1_19z = ~((celloutsig_1_9z[0] & celloutsig_1_14z) | celloutsig_1_0z[4]);
  assign celloutsig_0_2z = ~((in_data[73] & celloutsig_0_0z) | celloutsig_0_1z);
  assign { celloutsig_0_8z[3], celloutsig_0_8z[1], celloutsig_0_8z[7:4], celloutsig_0_8z[2] } = { celloutsig_0_5z, celloutsig_0_2z, in_data[62:60], celloutsig_0_0z, celloutsig_0_0z } ^ { _01_[1], celloutsig_0_0z, _01_[2], _01_[4:2], _01_[0] };
  assign celloutsig_0_8z[0] = celloutsig_0_8z[1];
  assign { out_data[128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_24z, celloutsig_0_25z };
endmodule
