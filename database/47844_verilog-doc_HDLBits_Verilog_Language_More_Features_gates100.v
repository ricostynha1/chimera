// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    assign out_and = &in[99:0];
    assign out_or = |in[99:0];
    assign out_xor = ^in[99:0];
endmodule

