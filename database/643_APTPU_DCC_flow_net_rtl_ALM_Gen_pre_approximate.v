// This program was cloned from: https://github.com/iCAS-Lab/APTPU
// License: MIT License

// MIT License
// 
// Copyright (c) 2021-2024 iCAS Lab
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Company: iCAS Lab, University of South Carolina
// Engineer: Mohammed E. Elbtity
// Create Date: 12/28/2023 07:12:06 PM
// Design Name: 
// Module Name: ALM_Gen_pre_approximate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ALM_Gen_pre_approximate #(parameter A_BW = 32,LOG2_WIDTH = $clog2(A_BW), ADDER_PARAM = 6)
(
  input  [A_BW-1:0]                 A,
  output [$clog2(A_BW)+A_BW-2:0]	log_concat_format_A,
  output                            zero_flag
  //input   wire    [B_BW-1:0]      B,
  //output            [(A_BW+B_BW)-1:0]    mult_product
 );                      


wire [$clog2(A_BW)-1:0] log_a;              // Log of A-Operand (P_Encoder output)
//wire [$clog2(B_BW)-1:0] log_b;              // Log of B-Operand (P_Encoder output)
wire	[A_BW-2:0]	log_format_a;
//wire	[B_BW-2:0]  log_format_b ;

//wire	[WIDTH-2:0]				fraction_sum ;

wire [$clog2(A_BW):0] exp_sum;            // Exponents sum 
wire [A_BW-1:0] lod_AO;                     // LOD of A-Operand output
//wire [B_BW-1:0] lod_BO;                     // LOD of A-Operand output
//wire	[$clog2(A_BW)+A_BW-2:0]	log_concat_format_A;
//wire	[$clog2(B_BW)+B_BW-2:0] log_concat_format_B ;

//wire    [(A_BW+B_BW)-1:0]    mult_product_lbc;            // Final result from the LBC

assign log_concat_format_A = {log_a,log_format_a};
//assign log_concat_format_B = {log_b,log_format_b};

LOD #(.BW(A_BW)) LOD_A (.in_a(A),.out_a(lod_AO));
P_Encoder #(.BW(A_BW)) PE_A (.in_a(lod_AO),.out_a(log_a));

//LOD #(.BW(A_BW)) LOD_B (.in_a(B),.out_a(lod_BO));
//P_Encoder #(.BW(A_BW)) PE_B (.in_a(lod_BO),.out_a(log_b));

BLC #(.LOG2_WIDTH($clog2(A_BW))) BLCa (.Operand(A),.K(log_a),.log_formt(log_format_a));
//BLC #(.LOG2_WIDTH($clog2(B_BW))) BLCb (.Operand(B),.K(log_b),.log_formt(log_format_b));

//MAA3 #(.LOG2_WIDTH($clog2(B_BW)),.M(ADDER_PARAM)) MAA3 (.OP1(log_concat_format_A),.OP2(log_concat_format_B),.X(fraction_sum),.K(exp_sum));

//LBC #(.LOG2_WIDTH($clog2(B_BW))) LBC (.fraction(fraction_sum),.exp_sum(exp_sum),.result(mult_product_lbc));

assign zero_flag = ~|A;
//assign mult_product = (A == 0 || B == 0) ? 'd0 : mult_product_lbc;


endmodule
