// This program was cloned from: https://github.com/chipsalliance/yosys-f4pga-plugins
// License: Apache License 2.0

// Copyright 2020-2022 F4PGA Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

module af1024x18_1024x18 (DIN,PUSH,POP,clock0,clock1,Async_Flush,Almost_Full,Almost_Empty,Full,Empty,Full_Watermark,Empty_Watermark,Overrun_Error,Underrun_Error,DOUT);

parameter WR_DATA_WIDTH = 18;
parameter RD_DATA_WIDTH = 18;
parameter UPAE_DBITS = 11'd10;
parameter UPAF_DBITS = 11'd10;

input clock0,clock1;
input PUSH,POP;
input [WR_DATA_WIDTH-1:0] DIN;
input Async_Flush;
output [RD_DATA_WIDTH-1:0] DOUT;
output Almost_Full,Almost_Empty;
output Full, Empty;
output Full_Watermark, Empty_Watermark;
output Overrun_Error, Underrun_Error;

AFIFO_18K_BLK  # (.WR_DATA_WIDTH(WR_DATA_WIDTH),.RD_DATA_WIDTH(RD_DATA_WIDTH),.UPAE_DBITS(UPAE_DBITS),.UPAF_DBITS(UPAF_DBITS)
                  )
  FIFO_INST    (
                .DIN(DIN),
                .PUSH(PUSH),
                .POP(POP),
                .Push_Clk(clock0),
                .Pop_Clk(clock1),
                .Async_Flush(Async_Flush),
                
                .Overrun_Error(Overrun_Error),
                .Full_Watermark(Full_Watermark),
                .Almost_Full(Almost_Full),
                .Full(Full),
                
                .Underrun_Error(Underrun_Error),
                .Empty_Watermark(Empty_Watermark),
                .Almost_Empty(Almost_Empty),
                .Empty(Empty),

                .DOUT(DOUT)
                );
endmodule

module af1024x16_1024x16 (DIN,PUSH,POP,clock0,clock1,Async_Flush,Almost_Full,Almost_Empty,Full,Empty,Full_Watermark,Empty_Watermark,Overrun_Error,Underrun_Error,DOUT);

parameter WR_DATA_WIDTH = 16;
parameter RD_DATA_WIDTH = 16;
parameter UPAE_DBITS = 11'd10;
parameter UPAF_DBITS = 11'd10;

input clock0,clock1;
input PUSH,POP;
input [WR_DATA_WIDTH-1:0] DIN;
input Async_Flush;
output [RD_DATA_WIDTH-1:0] DOUT;
output Almost_Full,Almost_Empty;
output Full, Empty;
output Full_Watermark, Empty_Watermark;
output Overrun_Error, Underrun_Error;

AFIFO_18K_BLK  # (.WR_DATA_WIDTH(WR_DATA_WIDTH),.RD_DATA_WIDTH(RD_DATA_WIDTH),.UPAE_DBITS(UPAE_DBITS),.UPAF_DBITS(UPAF_DBITS)
                  )
  FIFO_INST    (
                .DIN(DIN),
                .PUSH(PUSH),
                .POP(POP),
                .Push_Clk(clock0),
                .Pop_Clk(clock1),
                .Async_Flush(Async_Flush),
                
                .Overrun_Error(Overrun_Error),
                .Full_Watermark(Full_Watermark),
                .Almost_Full(Almost_Full),
                .Full(Full),
                
                .Underrun_Error(Underrun_Error),
                .Empty_Watermark(Empty_Watermark),
                .Almost_Empty(Almost_Empty),
                .Empty(Empty),

                .DOUT(DOUT)
                );
endmodule

module af2048x9_2048x9 (DIN,PUSH,POP,clock0,clock1,Async_Flush,Almost_Full,Almost_Empty,Full,Empty,Full_Watermark,Empty_Watermark,Overrun_Error,Underrun_Error,DOUT);

parameter WR_DATA_WIDTH = 9;
parameter RD_DATA_WIDTH = 9;
parameter UPAE_DBITS = 11'd10;
parameter UPAF_DBITS = 11'd10;

input clock0,clock1;
input PUSH,POP;
input [WR_DATA_WIDTH-1:0] DIN;
input Async_Flush;
output [RD_DATA_WIDTH-1:0] DOUT;
output Almost_Full,Almost_Empty;
output Full, Empty;
output Full_Watermark, Empty_Watermark;
output Overrun_Error, Underrun_Error;

AFIFO_18K_BLK  # (.WR_DATA_WIDTH(WR_DATA_WIDTH),.RD_DATA_WIDTH(RD_DATA_WIDTH),.UPAE_DBITS(UPAE_DBITS),.UPAF_DBITS(UPAF_DBITS)
                  )
  FIFO_INST    (
                .DIN(DIN),
                .PUSH(PUSH),
                .POP(POP),
                .Push_Clk(clock0),
                .Pop_Clk(clock1),
                .Async_Flush(Async_Flush),
                
                .Overrun_Error(Overrun_Error),
                .Full_Watermark(Full_Watermark),
                .Almost_Full(Almost_Full),
                .Full(Full),
                
                .Underrun_Error(Underrun_Error),
                .Empty_Watermark(Empty_Watermark),
                .Almost_Empty(Almost_Empty),
                .Empty(Empty),

                .DOUT(DOUT)
                );
endmodule

module af2048x8_2048x8 (DIN,PUSH,POP,clock0,clock1,Async_Flush,Almost_Full,Almost_Empty,Full,Empty,Full_Watermark,Empty_Watermark,Overrun_Error,Underrun_Error,DOUT);

parameter WR_DATA_WIDTH = 8;
parameter RD_DATA_WIDTH = 8;
parameter UPAE_DBITS = 11'd10;
parameter UPAF_DBITS = 11'd10;

input clock0,clock1;
input PUSH,POP;
input [WR_DATA_WIDTH-1:0] DIN;
input Async_Flush;
output [RD_DATA_WIDTH-1:0] DOUT;
output Almost_Full,Almost_Empty;
output Full, Empty;
output Full_Watermark, Empty_Watermark;
output Overrun_Error, Underrun_Error;

AFIFO_18K_BLK  # (.WR_DATA_WIDTH(WR_DATA_WIDTH),.RD_DATA_WIDTH(RD_DATA_WIDTH),.UPAE_DBITS(UPAE_DBITS),.UPAF_DBITS(UPAF_DBITS)
                  )
  FIFO_INST    (
                .DIN(DIN),
                .PUSH(PUSH),
                .POP(POP),
                .Push_Clk(clock0),
                .Pop_Clk(clock1),
                .Async_Flush(Async_Flush),
                
                .Overrun_Error(Overrun_Error),
                .Full_Watermark(Full_Watermark),
                .Almost_Full(Almost_Full),
                .Full(Full),
                
                .Underrun_Error(Underrun_Error),
                .Empty_Watermark(Empty_Watermark),
                .Almost_Empty(Almost_Empty),
                .Empty(Empty),

                .DOUT(DOUT)
                );
endmodule