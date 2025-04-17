// This program was cloned from: https://github.com/maxluppe/tt07_maxluppe_nist0102
// License: Apache License 2.0

// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Wed Mar 29 15:12:15 2023"

module Blk_counter(
	CLKE,
	CLK,
	RST,
	Cout,
	Q
);


input wire	CLKE;
input wire	CLK;
input wire	RST;
output wire	Cout;
output wire	[6:0] Q;

wire	RSTn;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_11;

assign	RSTn =  ~RST;

RND_counter_module	b2v_inst(
	.EN_in(CLKE),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(Q[0]),
	.EN_out(SYNTHESIZED_WIRE_1));

RND_counter_module	b2v_inst1(
	.EN_in(SYNTHESIZED_WIRE_1),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(Q[1]),
	.EN_out(SYNTHESIZED_WIRE_3));

RND_counter_module	b2v_inst2(
	.EN_in(SYNTHESIZED_WIRE_3),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(Q[2]),
	.EN_out(SYNTHESIZED_WIRE_5));

RND_counter_module	b2v_inst3(
	.EN_in(SYNTHESIZED_WIRE_5),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(Q[3]),
	.EN_out(SYNTHESIZED_WIRE_7));

RND_counter_module	b2v_inst4(
	.EN_in(SYNTHESIZED_WIRE_7),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(Q[4]),
	.EN_out(SYNTHESIZED_WIRE_9));

RND_counter_module	b2v_inst5(
	.EN_in(SYNTHESIZED_WIRE_9),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(Q[5]),
	.EN_out(SYNTHESIZED_WIRE_11));

RND_counter_module	b2v_inst6(
	.EN_in(SYNTHESIZED_WIRE_11),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(Q[6]),
	.EN_out(Cout));

endmodule
