// Seed: 2353029660
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31
);
  input wire id_31;
  input wire id_30;
  output wire id_29;
  output wire id_28;
  input wire id_27;
  output wire id_26;
  input wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_26 = id_23 ? {1{1}} : 1;
  wire id_32;
  assign id_10 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(*)
    if (id_3 + id_6) begin
      id_2 <= id_6;
    end else id_2 <= 1;
  wire id_10;
  module_0(
      id_10,
      id_8,
      id_10,
      id_10,
      id_9,
      id_8,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_3,
      id_3,
      id_10,
      id_9,
      id_3,
      id_4,
      id_3,
      id_10,
      id_3,
      id_3,
      id_1,
      id_10,
      id_1,
      id_9,
      id_4,
      id_8,
      id_10,
      id_3,
      id_8,
      id_9
  ); id_11(
      .id_0(id_7), .id_1(id_9), .id_2(id_1), .id_3(1'h0 * 1), .id_4(1), .id_5(id_9), .id_6(1'h0)
  );
endmodule
