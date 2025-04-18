// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

reg [1:0] src;
reg [1:0] dst;

initial begin
  assign dst = src + 1;
  src = 2'b01;
  #1 $display("%b", dst);
  if (dst === 2'b10)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
