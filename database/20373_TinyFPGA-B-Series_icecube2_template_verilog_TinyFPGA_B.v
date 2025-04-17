// This program was cloned from: https://github.com/tinyfpga/TinyFPGA-B-Series
// License: GNU General Public License v3.0

module TinyFPGA_B (
  inout pin1_usb_dp,
  inout pin2_usb_dn,
  input pin3_clk_16mhz,
  inout pin4,
  inout pin5,
  inout pin6,
  inout pin7,
  inout pin8,
  inout pin9,
  inout pin10,
  inout pin11,
  inout pin12,
  inout pin13,
  inout pin14_sdo,
  inout pin15_sdi,
  inout pin16_sck,
  inout pin17_ss,
  inout pin18,
  inout pin19,
  inout pin20,
  inout pin21,
  inout pin22,
  inout pin23,
  inout pin24
);

  // left side of board
  assign pin1_usb_dp = 1'bz;
  assign pin2_usb_dn = 1'bz;
  assign pin4 = 1'bz;
  assign pin5 = 1'bz;
  assign pin6 = 1'bz;
  assign pin7 = 1'bz;
  assign pin8 = 1'bz;
  assign pin9 = 1'bz;
  assign pin10 = 1'bz;
  assign pin11 = 1'bz;
  assign pin12 = 1'bz;
  assign pin13 = 1'bz;

  // right side of board
  assign pin14_sdo = 1'bz;
  assign pin15_sdi = 1'bz;
  assign pin16_sck = 1'bz;
  assign pin17_ss =  1'bz;
  assign pin18 =     1'bz;
  assign pin19 =     1'bz;
  assign pin20 =     1'bz;
  assign pin21 =     1'bz;
  assign pin22 =     1'bz;
  assign pin23 =     1'bz;
  assign pin24 =     1'bz;

endmodule
