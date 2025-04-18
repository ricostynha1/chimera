// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * Copyright (c) 2014 Stephen Williams (steve@icarus.com)
 *
 *    This source code is free software; you can redistribute it
 *    and/or modify it in source code form under the terms of the GNU
 *    General Public License as published by the Free Software
 *    Foundation; either version 2 of the License, or (at your option)
 *    any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program; if not, write to the Free Software
 *    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

`default_nettype none

module main;

   string words [$];
   int    nums[$];

   initial begin
      words.push_back("Hello, World!");
      nums.push_back(42);

      words = {};
      if (words.size != 0) begin
	 $display("FAILED -- words.size=%0d after clear", words.size);
	 $finish;
      end

      nums = {};
      if (nums.size != 0) begin
	 $display("FAILED -- nums.size=%0d after clear", nums.size);
	 $finish;
      end

      $display("PASSED");
   end

endmodule // main
