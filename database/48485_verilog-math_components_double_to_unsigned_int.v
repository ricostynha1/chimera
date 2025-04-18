// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

//This file was automatically generated by the python 'pipeliner' script
//This module has a latency of 1 clocks
module dq (clk, q, d);
  input  clk;
  input  [width-1:0] d;
  output [width-1:0] q;
  parameter width=8;
  parameter depth=2;
  integer i;
  reg [width-1:0] delay_line [depth-1:0];
  always @(posedge clk) begin
    delay_line[0] <= d;
    for(i=1; i<depth; i=i+1) begin
      delay_line[i] <= delay_line[i-1];
    end
  end
  assign q = delay_line[depth-1];
endmodule

module double_to_unsigned_int(clk, double_to_unsigned_int_a, double_to_unsigned_int_z);
  input clk;
  input [63:0] double_to_unsigned_int_a;
  output [63:0] double_to_unsigned_int_z;
  wire [63:0] s_0;
  wire [63:0] s_1;
  wire [63:0] s_2;
  wire [52:0] s_3;
  wire [0:0] s_4;
  wire [0:0] s_5;
  wire [0:0] s_6;
  wire [0:0] s_7;
  wire [10:0] s_8;
  wire [10:0] s_9;
  wire [63:0] s_10;
  wire [9:0] s_11;
  wire [10:0] s_12;
  wire [51:0] s_13;
  wire [10:0] s_14;
  wire [10:0] s_15;
  wire [10:0] s_16;
  wire [10:0] s_17;
  wire [10:0] s_18;
  wire [10:0] s_19;
  wire [0:0] s_20;

  dq #(64, 1) dq_s_0 (clk, s_0, s_1);
  assign s_1 = s_2 >> s_15;
  assign s_2 = {s_3,s_14};
  assign s_3 = {s_4,s_13};
  assign s_4 = s_7?s_5:s_6;
  assign s_5 = 1'd0;
  assign s_6 = 1'd1;
  assign s_7 = s_8 == s_12;
  assign s_8 = s_9 - s_11;
  assign s_9 = s_10[62:52];
  assign s_10 = double_to_unsigned_int_a;
  assign s_11 = 10'd1023;
  assign s_12 = -11'd1023;
  assign s_13 = s_10[51:0];
  assign s_14 = 11'd0;
  assign s_15 = s_16 - s_20;
  assign s_16 = s_17 - s_18;
  assign s_17 = 11'd64;
  assign s_18 = s_7?s_19:s_8;
  assign s_19 = -11'd1022;
  assign s_20 = 1'd1;
  assign double_to_unsigned_int_z = s_0;
endmodule
