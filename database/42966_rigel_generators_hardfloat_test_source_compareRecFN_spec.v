// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License


/*============================================================================

This Verilog source file is part of the Berkeley HardFloat IEEE Floating-Point
Arithmetic Package, Release 1, by John R. Hauser.

Copyright 2019 The Regents of the University of California.  All rights
reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice,
    this list of conditions, and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions, and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

 3. Neither the name of the University nor the names of its contributors may
    be used to endorse or promote products derived from this software without
    specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=============================================================================*/

module
    compareRecF16 (
        input [16:0] a,
        input [16:0] b,
        input signaling,
        output lt,
        output eq,
        output gt,
        output unordered,
        output [4:0] exceptionFlags
    );

    compareRecFN#(5, 11)
        compareRecFN(a, b, signaling, lt, eq, gt, unordered, exceptionFlags);

endmodule

module
    compareRecF32 (
        input [32:0] a,
        input [32:0] b,
        input signaling,
        output lt,
        output eq,
        output gt,
        output unordered,
        output [4:0] exceptionFlags
    );

    compareRecFN#(8, 24)
        compareRecFN(a, b, signaling, lt, eq, gt, unordered, exceptionFlags);

endmodule

module
    compareRecF64 (
        input [64:0] a,
        input [64:0] b,
        input signaling,
        output lt,
        output eq,
        output gt,
        output unordered,
        output [4:0] exceptionFlags
    );

    compareRecFN#(11, 53)
        compareRecFN(a, b, signaling, lt, eq, gt, unordered, exceptionFlags);

endmodule

module
    compareRecF128 (
        input [128:0] a,
        input [128:0] b,
        input signaling,
        output lt,
        output eq,
        output gt,
        output unordered,
        output [4:0] exceptionFlags
    );

    compareRecFN#(15, 113)
        compareRecFN(a, b, signaling, lt, eq, gt, unordered, exceptionFlags);

endmodule

