// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

//
// Copyright (c) 2004 Stephen Williams <steve@icarus.com>
//
//    This source code is free software; you can redistribute it
//    and/or modify it in source code form under the terms of the GNU
//    General Public License as published by the Free Software
//    Foundation; either version 2 of the License, or (at your option)
//    any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program; if not, write to the Free Software
//    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
//

module main;

   reg C;
   reg [1:0] in;
   wire [1:0] out;

   DFF u [1:0] (out, in, C);

   initial begin
      C <= 0;
      in <= 2'b00;

      #10 C <= 1;
      #10 if (out !== 2'b00) begin
	 $display("FAILED -- out=%b, in=%b", out, in);
	 $finish;
      end

      C <= 0;
      in <= 2'b10;
      #10 C <= 1;
      #10 if (out !== 2'b10) begin
	 $display("FAILED -- out=%b, in=%b", out, in);
	 $finish;
      end

      C <= 0;
      in <= 2'b01;
      #10 C <= 1;
      #10 if (out !== 2'b01) begin
	 $display("FAILED -- out=%b, in=%b", out, in);
	 $finish;
      end

      $display("PASSED");
   end // initial begin

endmodule // main

module DFF(output reg Q, input D, input C);

   always @(posedge C)
     Q <= D;

endmodule // DFF
