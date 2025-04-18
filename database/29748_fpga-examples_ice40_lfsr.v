// This program was cloned from: https://github.com/sehugg/fpga-examples
// License: Creative Commons Zero v1.0 Universal


`ifndef LFSR_V
`define LFSR_V

/*
Configurable Linear Feedback Shift Register.
*/

module LFSR(clk, reset, enable, lfsr);
  
  parameter NBITS  = 8;         // bit width
  parameter TAPS   = 8'b11101;	// bitmask for taps
  parameter INVERT = 0;		// invert feedback bit?
  
  input clk, reset;
  input enable;			// only perform shift when enable=1
  output reg [NBITS-1:0] lfsr;  // shift register

  wire feedback = lfsr[NBITS-1] ^ INVERT;

  always @(posedge clk)
  begin
    if (reset)
      lfsr <= {lfsr[NBITS-2:0], 1'b1}; // reset loads with all 1s
    else if (enable)
      lfsr <= {lfsr[NBITS-2:0], 1'b0} ^ (feedback ? TAPS : 0);
  end

endmodule

`endif
