// This program was cloned from: https://github.com/tinyfpga/TinyFPGA-B-Series
// License: GNU General Public License v3.0

module rising_edge_detector ( 
  input clk,
  input in,
  output out
);
  reg in_q;

  always @(posedge clk) begin
    in_q <= in;
  end

  assign out = !in_q && in;
endmodule

module falling_edge_detector ( 
  input clk,
  input in,
  output out
);
  reg in_q;

  always @(posedge clk) begin
    in_q <= in;
  end

  assign out = in_q && !in;
endmodule
