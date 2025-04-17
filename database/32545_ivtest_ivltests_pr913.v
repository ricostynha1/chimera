// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * This test is based on PR#913 in the test suite. The
 * idea is to wait for the start integer to become true.
 */
module test();
   integer start;

   initial
     #900000 begin $display("FAILED"); $finish; end

   initial
     #100000 start = 1;

   initial
     begin
	wait (start) $display("PASSED");
	$finish;
     end
endmodule // test
