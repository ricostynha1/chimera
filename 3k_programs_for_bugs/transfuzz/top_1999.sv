/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  reg [8:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_54z;
  wire celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_82z;
  wire celloutsig_0_87z;
  reg [4:0] celloutsig_0_88z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  reg [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_20z = 9'h000;
    else if (clkin_data[0]) celloutsig_0_20z = { celloutsig_0_17z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_19z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_88z = 5'h00;
    else if (!clkin_data[0]) celloutsig_0_88z = { celloutsig_0_66z, celloutsig_0_79z, celloutsig_0_32z, celloutsig_0_25z, celloutsig_0_82z };
  always_latch
    if (clkin_data[64]) celloutsig_1_10z = 4'h0;
    else if (!clkin_data[32]) celloutsig_1_10z = { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_8z };
  assign celloutsig_0_0z = ~((in_data[63] & in_data[40]) | (in_data[59] & in_data[73]));
  assign celloutsig_0_21z = ~((celloutsig_0_19z & celloutsig_0_8z) | (celloutsig_0_19z & celloutsig_0_3z));
  assign celloutsig_0_2z = ~((in_data[13] & in_data[46]) | (celloutsig_0_1z & celloutsig_0_1z));
  assign celloutsig_0_22z = ~((celloutsig_0_3z & celloutsig_0_14z) | (celloutsig_0_2z & celloutsig_0_10z));
  assign celloutsig_0_23z = ~((celloutsig_0_17z & celloutsig_0_22z) | (celloutsig_0_8z & celloutsig_0_17z));
  assign celloutsig_0_25z = ~((celloutsig_0_18z & celloutsig_0_22z) | (celloutsig_0_2z & celloutsig_0_11z));
  assign celloutsig_0_26z = ~((celloutsig_0_23z & celloutsig_0_2z) | (celloutsig_0_18z & celloutsig_0_4z));
  assign celloutsig_0_27z = ~((celloutsig_0_17z & celloutsig_0_22z) | (celloutsig_0_9z & celloutsig_0_17z));
  assign celloutsig_0_29z = ~((celloutsig_0_26z & celloutsig_0_18z) | (in_data[74] & celloutsig_0_8z));
  assign celloutsig_0_30z = ~((celloutsig_0_29z & celloutsig_0_19z) | (celloutsig_0_26z & celloutsig_0_17z));
  assign celloutsig_0_3z = ~((celloutsig_0_2z & celloutsig_0_0z) | (in_data[39] & celloutsig_0_2z));
  assign celloutsig_0_32z = ~((celloutsig_0_30z & celloutsig_0_6z) | (celloutsig_0_0z & celloutsig_0_10z));
  assign celloutsig_0_34z = ~((celloutsig_0_19z & celloutsig_0_22z) | (celloutsig_0_10z & celloutsig_0_17z));
  assign celloutsig_0_35z = ~((celloutsig_0_23z & celloutsig_0_21z) | (celloutsig_0_6z & celloutsig_0_22z));
  assign celloutsig_0_39z = ~((celloutsig_0_5z & celloutsig_0_34z) | (celloutsig_0_7z & celloutsig_0_7z));
  assign celloutsig_0_4z = ~((celloutsig_0_2z & in_data[44]) | (celloutsig_0_0z & celloutsig_0_3z));
  assign celloutsig_0_43z = ~((in_data[46] & celloutsig_0_27z) | (celloutsig_0_7z & celloutsig_0_2z));
  assign celloutsig_0_45z = ~((celloutsig_0_7z & celloutsig_0_12z) | (celloutsig_0_2z & celloutsig_0_16z));
  assign celloutsig_0_47z = ~((celloutsig_0_20z[3] & celloutsig_0_21z) | (celloutsig_0_3z & celloutsig_0_35z));
  assign celloutsig_0_50z = ~((celloutsig_0_12z & celloutsig_0_22z) | (celloutsig_0_6z & celloutsig_0_22z));
  assign celloutsig_0_5z = ~((celloutsig_0_4z & in_data[27]) | (celloutsig_0_0z & celloutsig_0_1z));
  assign celloutsig_0_54z = ~((in_data[76] & celloutsig_0_34z) | (celloutsig_0_13z & celloutsig_0_50z));
  assign celloutsig_0_6z = ~((in_data[27] & celloutsig_0_5z) | (celloutsig_0_0z & celloutsig_0_2z));
  assign celloutsig_0_63z = ~((celloutsig_0_1z & celloutsig_0_39z) | (celloutsig_0_4z & celloutsig_0_47z));
  assign celloutsig_0_66z = ~((celloutsig_0_12z & celloutsig_0_2z) | (celloutsig_0_27z & celloutsig_0_15z));
  assign celloutsig_0_7z = ~((celloutsig_0_1z & celloutsig_0_6z) | (celloutsig_0_0z & celloutsig_0_2z));
  assign celloutsig_0_73z = ~((celloutsig_0_2z & celloutsig_0_43z) | (celloutsig_0_14z & celloutsig_0_23z));
  assign celloutsig_0_79z = ~((celloutsig_0_45z & celloutsig_0_4z) | (celloutsig_0_66z & celloutsig_0_73z));
  assign celloutsig_0_82z = ~((celloutsig_0_10z & celloutsig_0_54z) | (celloutsig_0_11z & celloutsig_0_25z));
  assign celloutsig_0_8z = ~((celloutsig_0_3z & celloutsig_0_2z) | (celloutsig_0_6z & celloutsig_0_1z));
  assign celloutsig_0_87z = ~((celloutsig_0_20z[3] & celloutsig_0_63z) | (celloutsig_0_26z & celloutsig_0_13z));
  assign celloutsig_1_0z = ~((in_data[163] & in_data[136]) | (in_data[125] & in_data[100]));
  assign celloutsig_1_1z = ~((celloutsig_1_0z & in_data[171]) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_2z = ~((celloutsig_1_0z & celloutsig_1_1z) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_3z = ~((celloutsig_1_1z & celloutsig_1_1z) | (celloutsig_1_0z & in_data[131]));
  assign celloutsig_0_9z = ~((celloutsig_0_1z & celloutsig_0_1z) | (celloutsig_0_5z & celloutsig_0_1z));
  assign celloutsig_1_5z = ~((celloutsig_1_3z & celloutsig_1_3z) | (in_data[141] & in_data[133]));
  assign celloutsig_1_6z = ~((celloutsig_1_2z & celloutsig_1_1z) | (celloutsig_1_0z & celloutsig_1_3z));
  assign celloutsig_1_7z = ~((celloutsig_1_3z & celloutsig_1_3z) | (in_data[112] & celloutsig_1_5z));
  assign celloutsig_1_8z = ~((in_data[104] & celloutsig_1_6z) | (celloutsig_1_1z & celloutsig_1_2z));
  assign celloutsig_1_11z = ~((celloutsig_1_8z & celloutsig_1_7z) | (celloutsig_1_3z & celloutsig_1_0z));
  assign celloutsig_1_12z = ~((celloutsig_1_11z & celloutsig_1_7z) | (celloutsig_1_7z & celloutsig_1_8z));
  assign celloutsig_0_10z = ~((celloutsig_0_9z & celloutsig_0_3z) | (celloutsig_0_7z & celloutsig_0_3z));
  assign celloutsig_1_18z = ~((celloutsig_1_11z & celloutsig_1_10z[3]) | (in_data[103] & celloutsig_1_3z));
  assign celloutsig_1_19z = ~((celloutsig_1_0z & celloutsig_1_12z) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_0_11z = ~((celloutsig_0_5z & celloutsig_0_1z) | (celloutsig_0_3z & celloutsig_0_10z));
  assign celloutsig_0_1z = ~((in_data[37] & in_data[56]) | (in_data[51] & in_data[67]));
  assign celloutsig_0_12z = ~((celloutsig_0_8z & celloutsig_0_8z) | (celloutsig_0_1z & celloutsig_0_6z));
  assign celloutsig_0_13z = ~((celloutsig_0_12z & celloutsig_0_3z) | (in_data[67] & celloutsig_0_3z));
  assign celloutsig_0_14z = ~((celloutsig_0_0z & celloutsig_0_10z) | (celloutsig_0_12z & celloutsig_0_13z));
  assign celloutsig_0_15z = ~((celloutsig_0_13z & celloutsig_0_2z) | (celloutsig_0_8z & celloutsig_0_7z));
  assign celloutsig_0_16z = ~((celloutsig_0_0z & celloutsig_0_5z) | (celloutsig_0_5z & celloutsig_0_12z));
  assign celloutsig_0_17z = ~((celloutsig_0_7z & celloutsig_0_13z) | (celloutsig_0_8z & celloutsig_0_15z));
  assign celloutsig_0_18z = ~((celloutsig_0_0z & celloutsig_0_9z) | (celloutsig_0_17z & celloutsig_0_2z));
  assign celloutsig_0_19z = ~((celloutsig_0_17z & celloutsig_0_1z) | (celloutsig_0_11z & celloutsig_0_14z));
  assign { out_data[128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_87z, celloutsig_0_88z };
endmodule
