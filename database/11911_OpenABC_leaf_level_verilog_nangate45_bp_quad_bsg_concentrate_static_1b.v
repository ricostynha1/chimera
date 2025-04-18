// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module bsg_concentrate_static_1b
(
  i,
  o
);

  input [4:0] i;
  output [3:0] o;
  wire [3:0] o;
  assign o[3] = i[4];
  assign o[2] = i[3];
  assign o[1] = i[1];
  assign o[0] = i[0];

endmodule