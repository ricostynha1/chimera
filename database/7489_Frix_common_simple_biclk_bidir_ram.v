// This program was cloned from: https://github.com/archlabo/Frix
// License: BSD 2-Clause "Simplified" License

/*
 * Copyright (c) 2014, Aleksander Osman
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module simple_biclk_bidir_ram
  #(parameter width = 1,
    parameter widthad = 1)

    (
     input                  clk,

     input [widthad-1:0]    address_a,
     input                  wren_a,
     input [width-1:0]      data_a,
     output reg [width-1:0] q_a,

     input                  clk2,
     input [widthad-1:0]    address_b,
     output reg [width-1:0] q_b
     );

    reg [width-1:0]         mem [(2**widthad)-1:0];

    always @(posedge clk) begin
        if(wren_a) mem[address_a] <= data_a;

        q_a <= mem[address_a];
    end

    always @(posedge clk2) begin
        q_b <= mem[address_b];
    end

endmodule
