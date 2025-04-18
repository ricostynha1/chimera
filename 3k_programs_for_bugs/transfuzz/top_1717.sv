/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [8:0] celloutsig_0_0z;
  reg [7:0] celloutsig_0_10z;
  reg [5:0] celloutsig_0_11z;
  wire [12:0] celloutsig_0_13z;
  reg [3:0] celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire [4:0] celloutsig_0_1z;
  reg [18:0] celloutsig_0_22z;
  wire [7:0] celloutsig_0_24z;
  wire [12:0] celloutsig_0_28z;
  wire [6:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_3z;
  wire [4:0] celloutsig_0_41z;
  wire [12:0] celloutsig_0_4z;
  wire [6:0] celloutsig_0_50z;
  wire [7:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire [14:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_81z;
  wire [12:0] celloutsig_0_82z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_18z;
  wire [6:0] celloutsig_1_19z;
  wire [25:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [14:0] celloutsig_1_3z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = ~(in_data[135] & celloutsig_1_1z[10]);
  assign celloutsig_0_8z = ~((celloutsig_0_0z[6] | celloutsig_0_6z[6]) & celloutsig_0_7z[11]);
  assign celloutsig_0_17z = ~((celloutsig_0_10z[6] | celloutsig_0_0z[8]) & celloutsig_0_5z[4]);
  assign celloutsig_0_24z = celloutsig_0_22z[11:4] % { 1'h1, celloutsig_0_4z[10:4] };
  assign celloutsig_0_0z = - in_data[28:20];
  assign celloutsig_0_4z = - { celloutsig_0_2z[6:1], celloutsig_0_2z };
  assign celloutsig_0_7z = - { in_data[14:9], celloutsig_0_0z };
  assign celloutsig_0_81z = - celloutsig_0_0z[4:2];
  assign celloutsig_1_1z = - { in_data[184:183], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_19z = - celloutsig_1_3z[13:7];
  assign celloutsig_0_82z = ~ { in_data[83:78], celloutsig_0_50z };
  assign celloutsig_1_0z = ~ in_data[177:170];
  assign celloutsig_0_9z = ~ celloutsig_0_0z[6:2];
  assign celloutsig_1_18z = ~ celloutsig_1_0z[7:2];
  assign celloutsig_0_18z = ~ celloutsig_0_4z[9:6];
  assign celloutsig_0_2z = ~ celloutsig_0_0z[8:2];
  assign celloutsig_0_5z = celloutsig_0_4z[11:4] >> in_data[32:25];
  assign celloutsig_0_50z = celloutsig_0_28z[11:5] >> { celloutsig_0_10z[2:1], celloutsig_0_41z };
  assign celloutsig_0_13z = { celloutsig_0_2z[6:4], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_8z } >> { celloutsig_0_4z[12:1], celloutsig_0_8z };
  assign celloutsig_0_3z = celloutsig_0_1z[3:1] >> in_data[32:30];
  assign celloutsig_0_28z = { celloutsig_0_24z[6:1], celloutsig_0_8z, celloutsig_0_11z } >> celloutsig_0_13z;
  assign celloutsig_0_1z = in_data[90:86] >>> in_data[7:3];
  assign celloutsig_0_41z = { celloutsig_0_9z[0], celloutsig_0_15z } ~^ { celloutsig_0_18z, celloutsig_0_17z };
  assign celloutsig_0_6z = { celloutsig_0_4z[5:2], celloutsig_0_3z } ~^ celloutsig_0_5z[7:1];
  assign celloutsig_1_3z = in_data[155:141] ~^ { celloutsig_1_1z[21:10], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_10z = 8'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_10z = in_data[48:41];
  always_latch
    if (!clkin_data[0]) celloutsig_0_11z = 6'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_11z = celloutsig_0_4z[7:2];
  always_latch
    if (clkin_data[0]) celloutsig_0_15z = 4'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_15z = celloutsig_0_13z[6:3];
  always_latch
    if (clkin_data[0]) celloutsig_0_22z = 19'h00000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_22z = { celloutsig_0_11z, celloutsig_0_4z };
  assign { out_data[133:128], out_data[102:96], out_data[34:32], out_data[12:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_81z, celloutsig_0_82z };
endmodule
