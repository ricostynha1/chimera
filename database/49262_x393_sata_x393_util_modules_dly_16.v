// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: dly_16
 * Date:2014-05-30  
 * Author: Andrey Filippov
 * Description: Synchronous delay by 1-16 clock cycles with reset (will map to primitives)
 *
 * Copyright (c) 2014 Elphel, Inc.
 * dly_16.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dly_16.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 *******************************************************************************/
`timescale 1ns/1ps

module  dly_16 #(
    parameter WIDTH=1
    )(
    input               clk,
    input               rst,
    input         [3:0] dly,
    input   [WIDTH-1:0] din,
    output  [WIDTH-1:0] dout
);
  generate
    genvar i;
    for (i=0; i < WIDTH; i=i+1) begin: bit_block
        dly01_16 dly01_16_i (
            .clk(clk), // input
            .rst(rst), // input
            .dly(dly), // input[3:0] 
            .din(din[i]), // input
            .dout(dout[i]) // output reg 
        );
    end
  endgenerate
endmodule

