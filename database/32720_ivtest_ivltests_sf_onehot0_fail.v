// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg result;

  initial begin

    result = $onehot0(top);
    result = $onehot0("a string");
    result = $onehot0(4'b001, 1'b0);

  end

endmodule
