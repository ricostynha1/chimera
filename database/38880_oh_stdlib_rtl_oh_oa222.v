// This program was cloned from: https://github.com/aolofsson/oh
// License: MIT License

//#############################################################################
//# Function: Or-And (oa222) Gate                                             #
//# Copyright: OH Project Authors. ALl rights Reserved.                       #
//# License:  MIT (see LICENSE file in OH repository)                         # 
//#############################################################################

module oh_oa222 #(parameter DW = 1 ) // array width
   (
    input [DW-1:0]  a0,
    input [DW-1:0]  a1,
    input [DW-1:0]  b0,
    input [DW-1:0]  b1,
    input [DW-1:0]  c0,
    input [DW-1:0]  c1,
    output [DW-1:0] z
    );
   
   assign z = (a0 | a1) & (b0 | b1) & (c0 | c1);
   
endmodule
