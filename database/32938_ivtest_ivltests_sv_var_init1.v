// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top();

integer i = 1;
integer j = 0;

always @(i) j = i;

initial begin
  #0 $display("%0d %0d", i, j);
  if ((i === 1) && (j === 0))
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule // main
