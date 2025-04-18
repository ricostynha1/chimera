// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

localparam [7:0] dly1 = 1;
wire       [7:0] dly2 = 2;
reg        [7:0] dly3 = 3;

reg        i;
wire [6:1] o;

buf #(dly1, dly2)   buf1(o[1], i);
buf #(dly2, dly1)   buf2(o[2], i);
buf #(dly1, dly3)   buf3(o[3], i);
buf #(dly3, dly1)   buf4(o[4], i);
buf #(dly2, dly3+1) buf5(o[5], i);
buf #(4,    2)      buf6(o[6], i);

function check(input o1, input o2, input o3, input o4, input o5, input o6);

begin
  check = (o[1] == o1) && (o[2] == o2) && (o[3] == o3)
       && (o[4] == o4) && (o[5] == o5) && (o[6] == o6);
end

endfunction

reg failed = 0;

initial begin
  #1 $monitor($time,,i,,o[1],,o[2],,o[3],,o[4],,o[5],,o[6]);

  i = 1'b1;
  #0      if (!check(1'bx, 1'bx, 1'bx, 1'bx, 1'bx, 1'bx)) failed = 1;
  #1;  #0 if (!check(1'b1, 1'bx, 1'b1, 1'bx, 1'bx, 1'bx)) failed = 1;
  #1;  #0 if (!check(1'b1, 1'b1, 1'b1, 1'bx, 1'b1, 1'bx)) failed = 1;
  #1;  #0 if (!check(1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'bx)) failed = 1;
  #1;  #0 if (!check(1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1)) failed = 1;

  i = 1'b0;
  #0      if (!check(1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1)) failed = 1;
  #1;  #0 if (!check(1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1)) failed = 1;
  #1;  #0 if (!check(1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0)) failed = 1;
  #1;  #0 if (!check(1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0)) failed = 1;
  #1;  #0 if (!check(1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0)) failed = 1;

  i = 1'bx;
  #0      if (!check(1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0)) failed = 1;
  #1;  #0 if (!check(1'bx, 1'bx, 1'bx, 1'bx, 1'b0, 1'b0)) failed = 1;
  #1;  #0 if (!check(1'bx, 1'bx, 1'bx, 1'bx, 1'bx, 1'bx)) failed = 1;

  i = 1'bz;
  #0      if (!check(1'bx, 1'bx, 1'bx, 1'bx, 1'bx, 1'bx)) failed = 1;
  #1;  #0 if (!check(1'bz, 1'bz, 1'bz, 1'bz, 1'bx, 1'bx)) failed = 1;
  #1;  #0 if (!check(1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz)) failed = 1;

  #1;
  if (failed)
    $display("FAILED");
  else
    $display("PASSED");
end

endmodule
