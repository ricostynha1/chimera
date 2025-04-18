// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Author: Eyal Hochberg                                      ////
////          eyal@provartec.com                                 ////
////                                                             ////
////  Downloaded from: http://www.opencores.org                  ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2010 Provartec LTD                            ////
//// www.provartec.com                                           ////
//// info@provartec.com                                          ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
//// This source file is free software; you can redistribute it  ////
//// and/or modify it under the terms of the GNU Lesser General  ////
//// Public License as published by the Free Software Foundation.////
////                                                             ////
//// This source is distributed in the hope that it will be      ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied  ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR     ////
//// PURPOSE.  See the GNU Lesser General Public License for more////
//// details. http://www.gnu.org/licenses/lgpl.html              ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:36:57 2011
//--
//-- Source file: prgen_swap64.v
//---------------------------------------------------------


  
module  prgen_swap64 (end_swap,data_in,data_out,bsel_in,bsel_out);
   
   input [1:0]            end_swap;
   input [63:0]        data_in;
   output [63:0]       data_out;
   input [7:0]            bsel_in;
   output [7:0]        bsel_out;


   wire [31:0]            data_in_low;
   wire [31:0]            data_in_high;
   wire [31:0]            data_out_low;
   wire [31:0]            data_out_high;
   wire [3:0]            bsel_in_low;
   wire [3:0]            bsel_in_high;
   wire [3:0]            bsel_out_low;
   wire [3:0]            bsel_out_high;

   

   assign            data_in_low  = end_swap == 2'b11 ? data_in[63:32] : data_in[31:0];
   assign            data_in_high = end_swap == 2'b11 ? data_in[31:0]  : data_in[63:32];

   assign            bsel_in_low  = end_swap == 2'b11 ? bsel_in[7:4] : bsel_in[3:0];
   assign            bsel_in_high = end_swap == 2'b11 ? bsel_in[3:0] : bsel_in[7:4];

   prgen_swap32 swap32_low(
               .end_swap(end_swap),
               .data_in(data_in_low),
               .data_out(data_out_low),
               .bsel_in(bsel_in_low),
               .bsel_out(bsel_out_low)
               );
   
   prgen_swap32 swap32_high(
                .end_swap(end_swap),
                .data_in(data_in_high),
                .data_out(data_out_high),
                .bsel_in(bsel_in_high),
                .bsel_out(bsel_out_high)
               );

   assign            data_out = {data_out_high, data_out_low};
   assign            bsel_out = {bsel_out_high, bsel_out_low};
   
endmodule
   


