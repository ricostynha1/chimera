// This program was cloned from: https://github.com/3442/conspiracion
// License: GNU General Public License v3.0

// verilator lint_off WIDTHEXPAND
// verilator lint_off WIDTHTRUNC
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
//-- Invoked Fri Mar 25 23:34:51 2011
//--
//-- Source file: dma_core_arbiter.v
//---------------------------------------------------------



module dma_axi32_core0_arbiter(clk,reset,enable,joint_mode,page_cross,joint_req,prio_top,prio_high,prio_top_num,prio_high_num,hold,ch_ready,ch_active,finish,ch_go_out,ch_num,ch_last);
   
   parameter                CH_LAST       = 1-1;
   
   input             clk;
   input             reset;

   input             enable;

   input             joint_mode;
   input             page_cross;
   input             joint_req;
   input             prio_top;
   input             prio_high;
   input [2:0]             prio_top_num;
   input [2:0]             prio_high_num;
   input             hold;
   
   input [7:0]             ch_ready;
   input [7:0]             ch_active;
   input             finish;
   output             ch_go_out;
   output [2:0]         ch_num;
   output             ch_last;
   

   
   reg [7:0]             current_active;
   wire             current_ready_only;
   wire             ch_last_pre;
   wire             ch_last;
   wire             ready;
   wire             next_ready;
   wire             next_ready0;
   wire             next_ready1;
   wire             prio_top_ready;
   wire             prio_high_ready;
   reg                 in_prog;
   wire             ch_go_pre;
   wire             ch_go_pre_d;
   wire             ch_go_top_pre;
   wire             ch_go_high_pre;
   wire             ch_go;
   wire             ch_go_d;
   wire             ch_go_top;
   wire             ch_go_high;
   wire             ch_go_next;
   wire             hold_d;
   wire             advance_next;
   wire [2:0]             ch_num_pre;
   wire [3:0]             next_ch_num0_pre;
   wire [3:0]             next_ch_num0_pre2;
   wire [2:0]             next_ch_num0;
   wire [3:0]             next_ch_num1_pre;
   wire [3:0]             next_ch_num1_pre2;
   wire [2:0]             next_ch_num1;
   wire [2:0]             next_ch_num_pre;

   assign             ch_go_out = 'd1;
   assign             ch_num    = 'd0;
   assign             ch_last   = 'd1;
   
   
   
endmodule


   


// verilator lint_on WIDTHEXPAND
// verilator lint_on WIDTHTRUNC
