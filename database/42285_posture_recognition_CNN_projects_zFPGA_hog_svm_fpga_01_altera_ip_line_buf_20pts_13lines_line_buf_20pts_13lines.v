// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

// megafunction wizard: %Shift register (RAM-based)%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTSHIFT_TAPS 

// ============================================================
// File Name: line_buf_20pts_13lines.v
// Megafunction Name(s):
// 			ALTSHIFT_TAPS
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 14.0.0 Build 200 06/17/2014 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, the Altera Quartus II License Agreement,
//the Altera MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Altera and sold by Altera or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module line_buf_20pts_13lines (
	aclr,
	clken,
	clock,
	shiftin,
	shiftout,
	taps0x,
	taps10x,
	taps11x,
	taps12x,
	taps1x,
	taps2x,
	taps3x,
	taps4x,
	taps5x,
	taps6x,
	taps7x,
	taps8x,
	taps9x);

	input	  aclr;
	input	  clken;
	input	  clock;
	input	[35:0]  shiftin;
	output	[35:0]  shiftout;
	output	[35:0]  taps0x;
	output	[35:0]  taps10x;
	output	[35:0]  taps11x;
	output	[35:0]  taps12x;
	output	[35:0]  taps1x;
	output	[35:0]  taps2x;
	output	[35:0]  taps3x;
	output	[35:0]  taps4x;
	output	[35:0]  taps5x;
	output	[35:0]  taps6x;
	output	[35:0]  taps7x;
	output	[35:0]  taps8x;
	output	[35:0]  taps9x;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  aclr;
	tri1	  clken;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [35:0] sub_wire0;
	wire [467:0] sub_wire1;
	wire [35:0] shiftout = sub_wire0[35:0];
	wire [359:324] sub_wire25 = sub_wire1[359:324];
	wire [323:288] sub_wire24 = sub_wire1[323:288];
	wire [323:288] sub_wire23 = sub_wire24[323:288];
	wire [287:252] sub_wire22 = sub_wire1[287:252];
	wire [287:252] sub_wire21 = sub_wire22[287:252];
	wire [251:216] sub_wire20 = sub_wire1[251:216];
	wire [251:216] sub_wire19 = sub_wire20[251:216];
	wire [215:180] sub_wire18 = sub_wire1[215:180];
	wire [215:180] sub_wire17 = sub_wire18[215:180];
	wire [179:144] sub_wire16 = sub_wire1[179:144];
	wire [179:144] sub_wire15 = sub_wire16[179:144];
	wire [143:108] sub_wire14 = sub_wire1[143:108];
	wire [143:108] sub_wire13 = sub_wire14[143:108];
	wire [107:72] sub_wire12 = sub_wire1[107:72];
	wire [107:72] sub_wire11 = sub_wire12[107:72];
	wire [71:36] sub_wire10 = sub_wire1[71:36];
	wire [71:36] sub_wire9 = sub_wire10[71:36];
	wire [467:432] sub_wire8 = sub_wire1[467:432];
	wire [467:432] sub_wire7 = sub_wire8[467:432];
	wire [431:396] sub_wire6 = sub_wire1[431:396];
	wire [431:396] sub_wire5 = sub_wire6[431:396];
	wire [395:360] sub_wire4 = sub_wire1[395:360];
	wire [395:360] sub_wire3 = sub_wire4[395:360];
	wire [35:0] sub_wire2 = sub_wire1[35:0];
	wire [35:0] taps0x = sub_wire2[35:0];
	wire [35:0] taps10x = sub_wire3[395:360];
	wire [35:0] taps11x = sub_wire5[431:396];
	wire [35:0] taps12x = sub_wire7[467:432];
	wire [35:0] taps1x = sub_wire9[71:36];
	wire [35:0] taps2x = sub_wire11[107:72];
	wire [35:0] taps3x = sub_wire13[143:108];
	wire [35:0] taps4x = sub_wire15[179:144];
	wire [35:0] taps5x = sub_wire17[215:180];
	wire [35:0] taps6x = sub_wire19[251:216];
	wire [35:0] taps7x = sub_wire21[287:252];
	wire [35:0] taps8x = sub_wire23[323:288];
	wire [35:0] taps9x = sub_wire25[359:324];

	altshift_taps	ALTSHIFT_TAPS_component (
				.aclr (aclr),
				.clken (clken),
				.clock (clock),
				.shiftin (shiftin),
				.shiftout (sub_wire0),
				.taps (sub_wire1));
	defparam
		ALTSHIFT_TAPS_component.intended_device_family = "Cyclone V",
		ALTSHIFT_TAPS_component.lpm_hint = "RAM_BLOCK_TYPE=M10K",
		ALTSHIFT_TAPS_component.lpm_type = "altshift_taps",
		ALTSHIFT_TAPS_component.number_of_taps = 13,
		ALTSHIFT_TAPS_component.tap_distance = 20,
		ALTSHIFT_TAPS_component.width = 36;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "1"
// Retrieval info: PRIVATE: CLKEN NUMERIC "1"
// Retrieval info: PRIVATE: GROUP_TAPS NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: NUMBER_OF_TAPS NUMERIC "13"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: TAP_DISTANCE NUMERIC "20"
// Retrieval info: PRIVATE: WIDTH NUMERIC "36"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=M10K"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
// Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "13"
// Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "20"
// Retrieval info: CONSTANT: WIDTH NUMERIC "36"
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT VCC "aclr"
// Retrieval info: USED_PORT: clken 0 0 0 0 INPUT VCC "clken"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: shiftin 0 0 36 0 INPUT NODEFVAL "shiftin[35..0]"
// Retrieval info: USED_PORT: shiftout 0 0 36 0 OUTPUT NODEFVAL "shiftout[35..0]"
// Retrieval info: USED_PORT: taps0x 0 0 36 0 OUTPUT NODEFVAL "taps0x[35..0]"
// Retrieval info: USED_PORT: taps10x 0 0 36 0 OUTPUT NODEFVAL "taps10x[35..0]"
// Retrieval info: USED_PORT: taps11x 0 0 36 0 OUTPUT NODEFVAL "taps11x[35..0]"
// Retrieval info: USED_PORT: taps12x 0 0 36 0 OUTPUT NODEFVAL "taps12x[35..0]"
// Retrieval info: USED_PORT: taps1x 0 0 36 0 OUTPUT NODEFVAL "taps1x[35..0]"
// Retrieval info: USED_PORT: taps2x 0 0 36 0 OUTPUT NODEFVAL "taps2x[35..0]"
// Retrieval info: USED_PORT: taps3x 0 0 36 0 OUTPUT NODEFVAL "taps3x[35..0]"
// Retrieval info: USED_PORT: taps4x 0 0 36 0 OUTPUT NODEFVAL "taps4x[35..0]"
// Retrieval info: USED_PORT: taps5x 0 0 36 0 OUTPUT NODEFVAL "taps5x[35..0]"
// Retrieval info: USED_PORT: taps6x 0 0 36 0 OUTPUT NODEFVAL "taps6x[35..0]"
// Retrieval info: USED_PORT: taps7x 0 0 36 0 OUTPUT NODEFVAL "taps7x[35..0]"
// Retrieval info: USED_PORT: taps8x 0 0 36 0 OUTPUT NODEFVAL "taps8x[35..0]"
// Retrieval info: USED_PORT: taps9x 0 0 36 0 OUTPUT NODEFVAL "taps9x[35..0]"
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @shiftin 0 0 36 0 shiftin 0 0 36 0
// Retrieval info: CONNECT: shiftout 0 0 36 0 @shiftout 0 0 36 0
// Retrieval info: CONNECT: taps0x 0 0 36 0 @taps 0 0 36 0
// Retrieval info: CONNECT: taps10x 0 0 36 0 @taps 0 0 36 360
// Retrieval info: CONNECT: taps11x 0 0 36 0 @taps 0 0 36 396
// Retrieval info: CONNECT: taps12x 0 0 36 0 @taps 0 0 36 432
// Retrieval info: CONNECT: taps1x 0 0 36 0 @taps 0 0 36 36
// Retrieval info: CONNECT: taps2x 0 0 36 0 @taps 0 0 36 72
// Retrieval info: CONNECT: taps3x 0 0 36 0 @taps 0 0 36 108
// Retrieval info: CONNECT: taps4x 0 0 36 0 @taps 0 0 36 144
// Retrieval info: CONNECT: taps5x 0 0 36 0 @taps 0 0 36 180
// Retrieval info: CONNECT: taps6x 0 0 36 0 @taps 0 0 36 216
// Retrieval info: CONNECT: taps7x 0 0 36 0 @taps 0 0 36 252
// Retrieval info: CONNECT: taps8x 0 0 36 0 @taps 0 0 36 288
// Retrieval info: CONNECT: taps9x 0 0 36 0 @taps 0 0 36 324
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_13lines.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_13lines.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_13lines.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_13lines.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_13lines_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_13lines_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
