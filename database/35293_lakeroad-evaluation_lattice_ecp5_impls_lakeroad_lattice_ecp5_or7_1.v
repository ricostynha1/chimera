// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

/* Generated by Yosys 0.19 (git sha1 a45c131b37c, clang 13.1.6 -fPIC -Os) */

module lakeroad_lattice_ecp5_or7_1(a, b, out0);
  wire _0_;
  input [6:0] a;
  wire [6:0] a;
  input [6:0] b;
  wire [6:0] b;
  output [6:0] out0;
  wire [6:0] out0;
  LUT4 #(
    .INIT(16'hefff)
  ) A_LUT_0 (
    .A(a[0]),
    .B(b[0]),
    .C(1'h1),
    .D(1'h1),
    .Z(out0[0])
  );
  LUT4 #(
    .INIT(16'hefff)
  ) B_LUT_1 (
    .A(a[1]),
    .B(b[1]),
    .C(1'h1),
    .D(1'h1),
    .Z(out0[1])
  );
  LUT4 #(
    .INIT(16'hefff)
  ) C_LUT_2 (
    .A(a[2]),
    .B(b[2]),
    .C(1'h1),
    .D(1'h1),
    .Z(out0[2])
  );
  LUT4 #(
    .INIT(16'hefff)
  ) D_LUT_3 (
    .A(a[3]),
    .B(b[3]),
    .C(1'h1),
    .D(1'h1),
    .Z(out0[3])
  );
  LUT4 #(
    .INIT(16'hefff)
  ) E_LUT_4 (
    .A(a[4]),
    .B(b[4]),
    .C(1'h1),
    .D(1'h1),
    .Z(out0[4])
  );
  LUT4 #(
    .INIT(16'hefff)
  ) F_LUT_5 (
    .A(a[5]),
    .B(b[5]),
    .C(1'h1),
    .D(1'h1),
    .Z(out0[5])
  );
  LUT4 #(
    .INIT(16'hefff)
  ) G_LUT_6 (
    .A(a[6]),
    .B(b[6]),
    .C(1'h1),
    .D(1'h1),
    .Z(out0[6])
  );
  LUT4 #(
    .INIT(16'h0000)
  ) H_LUT_7 (
    .A(1'h0),
    .B(1'h0),
    .C(1'h1),
    .D(1'h1),
    .Z(_0_)
  );
endmodule

