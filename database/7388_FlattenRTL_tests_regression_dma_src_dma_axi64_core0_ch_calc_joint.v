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
//-- Source file: dma_ch_calc_joint.v
//---------------------------------------------------------



module dma_axi64_core0_ch_calc_joint(clk,reset,joint_update,ch_end,ch_end_flush,joint_line_req_clr,wr_cmd_pending,burst_size_pre2,burst_max_size,fifo_not_ready,outs_empty,x_remain,fifo_wr_ready,fifo_remain,joint,page_cross,joint_cross,joint_ready_in,joint_ready_out,joint_line_req,joint_burst_req,joint_wait,joint_flush,joint_flush_in,joint_buffer_small);


   parameter               READ          = 0;
   parameter            WRITE         = !READ;
   
   input                   clk;
   input            reset;

   input            joint_update;
   input            ch_end;
   input            ch_end_flush;

   input            joint_line_req_clr;
   input            wr_cmd_pending;
   input [8-1:0]  burst_size_pre2;
   input [8-1:0]  burst_max_size;
   input            fifo_not_ready;
   input            outs_empty;
   input [10-1:0]   x_remain;
   input            fifo_wr_ready;
   input [5:0]        fifo_remain;
   
   input            joint;
   input            page_cross;
   input            joint_cross;
   input            joint_ready_in;
   output            joint_ready_out;
   output            joint_line_req;
   output            joint_burst_req;
   output            joint_wait;
   output            joint_flush;
   input            joint_flush_in;
   output            joint_buffer_small;
   
   
   

   parameter            IDLE        = 3'd0;
   parameter            REQ_LINE    = 3'd1;
   parameter            READY_OUT   = 3'd2;
   parameter            READY       = 3'd3;
   parameter            CROSS       = 3'd4;
   parameter            BURST_REQ   = 3'd5;
   parameter            RECHK       = 3'd6;
   parameter            FLUSH       = 3'd7;


   
   reg [2:0]            ps;
   reg [2:0]            ns;

   wire            joint_ready_out_pre;
   reg                joint_ready_out;
   reg                joint_line_req;
   reg                joint_burst_req;
   reg                joint_flush;
   reg                joint_wait;
   wire            joint_buffer_small;
   
   
   
   
   assign            joint_ready_out_pre = joint & (burst_size_pre2 == burst_max_size) & (|burst_max_size) & 
                                                 (~joint_line_req) & (~joint_burst_req);

   assign            joint_buffer_small = (burst_max_size > x_remain) | (x_remain < 'd8);
   
   
   always @(posedge clk or posedge reset)
     if (reset)
       joint_ready_out <= #1 1'b0;
     else if ((page_cross | ch_end_flush | joint_flush | joint_wait) & (~ch_end))
       joint_ready_out <= #1 1'b0;
     else if ((~ch_end) & (~wr_cmd_pending))
       joint_ready_out <= #1 joint_ready_out_pre;
   
   
   always @(/*AUTOSENSE*/ch_end_flush or fifo_not_ready or fifo_remain
        or fifo_wr_ready or joint_buffer_small or joint_cross
        or joint_flush_in or joint_line_req_clr or joint_ready_in
        or joint_ready_out or outs_empty or page_cross or ps)
     begin
    ns              = IDLE;
    joint_line_req  = 1'b0;
    joint_burst_req = 1'b0;
    joint_flush     = 1'b0;
    joint_wait      = 1'b0;
    
    case (ps)
      
      IDLE :
        begin
           if (joint_flush_in | joint_buffer_small)
         ns = FLUSH;
           else if (joint_ready_out & joint_ready_in & outs_empty)
         ns = READY;
           else if (joint_ready_out)
         begin
            joint_wait = 1'b1;
            ns = READY_OUT;
         end
           else if (fifo_not_ready & joint_ready_in & outs_empty)
         if (WRITE)
           begin
              joint_line_req = 1'b1; //from write to read - fill fifo at begining
              ns = REQ_LINE;
           end
         else
           begin
              joint_burst_req = 1'b1; //from read to write - empty fifo after cross
              ns = REQ_LINE; //1 cycle pulse
           end
           else
         ns = IDLE;
        end
      
      REQ_LINE :
        begin
           if (joint_flush_in)
         ns = FLUSH;
           else if (joint_line_req_clr)
         begin
            ns = IDLE;
            joint_wait = 1'b0;
         end
           else
         begin
            ns = REQ_LINE;
            joint_wait = 1'b1;
         end
        end

      READY_OUT :
        begin
           joint_wait = 1'b1;

           if (joint_cross | page_cross)
         ns = CROSS;
           else if ((~joint_ready_out) | joint_flush_in | joint_buffer_small)
         ns = FLUSH;
           else if (joint_ready_in & outs_empty)
         begin
            joint_wait = 1'b0;
            ns = RECHK;
         end
           else
         ns = READY_OUT;
        end

      RECHK :
        begin
           if (joint_flush_in | joint_buffer_small)
         ns = FLUSH;
           else if (joint_ready_in & joint_ready_out)
         ns = READY;
           else if (WRITE)
         begin
            joint_line_req = 1'b1; //from write to read - read more data when AHB gets out of align address
            ns = REQ_LINE;
         end
           else if (READ)
         ns = RECHK;
        end
      
      READY :
        begin
           if (joint_cross)
         begin
            joint_wait = 1'b1;
            ns = READY_OUT;
         end
           else if ((~joint_ready_out) | (~joint_ready_in) | ch_end_flush)
           ns = FLUSH;
           else
         ns = READY;
        end

      CROSS :
        begin
           if (joint_buffer_small)
         ns = FLUSH;
           else if (joint_ready_out & (~joint_cross) & outs_empty)
         begin
            if (fifo_wr_ready & (fifo_remain <= 'd16)) //rd_gap
              begin
             joint_burst_req = 1'b1; //from read to write - empty fifo after cross
             
             if (fifo_remain == 'd0)
               ns = BURST_REQ; //2 cycles pulse
             else
               ns = REQ_LINE; //1 cycle pulse
              end
            else
              ns = IDLE;
         end
           else
         ns = CROSS;
        end

      BURST_REQ :
        begin
           joint_burst_req = 1'b1; //from read to write - empty fifo after cross
           ns = REQ_LINE;
        end
      
      FLUSH :
        begin
           joint_flush = 1'b1;
           ns = FLUSH;
        end

      default :
        ns = IDLE;
      
    endcase
     end
   
        
   
   always @(posedge clk or posedge reset)
     if (reset)
       ps <= #1 IDLE;
     else if (joint_update)
       ps <= #1 IDLE;
     else
       ps <= #1 ns;

   
endmodule

   


