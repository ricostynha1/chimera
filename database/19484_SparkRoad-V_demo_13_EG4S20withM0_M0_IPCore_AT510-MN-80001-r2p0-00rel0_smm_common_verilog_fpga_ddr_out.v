// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------

// megafunction wizard: %ALTDDIO_OUT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTDDIO_OUT

// ============================================================
// File Name: ddr_out.v
// Megafunction Name(s):
//      ALTDDIO_OUT
//
// Simulation Library Files(s):
//      altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 13.0.1 Build 232 06/12/2013 SP 1 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2013 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions
//and other software and tools, and its AMPP partner logic
//functions, and any output files from any of the foregoing
//(including device programming or simulation files), and any
//associated documentation or information are expressly subject
//to the terms and conditions of the Altera Program License
//Subscription Agreement, Altera MegaCore Function License
//Agreement, or other applicable license agreement, including,
//without limitation, that your use is for the sole purpose of
//programming logic devices manufactured by Altera and sold by
//Altera or its authorized distributors.  Please refer to the
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module ddr_out (
  datain_h,
  datain_l,
  outclock,
  dataout);

  input    datain_h;
  input    datain_l;
  input    outclock;
  output   dataout;

  wire  sub_wire0;
  wire  dataout = sub_wire0;

  altddio_out  u_altddio_out_component (
        .datain_h (datain_h),
        .datain_l (datain_l),
        .outclock (outclock),
        .dataout (sub_wire0),
        .aclr (1'b0),
        .aset (1'b0),
        .oe (1'b1),
        .oe_out (),
        .outclocken (1'b1),
        .sclr (1'b0),
        .sset (1'b0));
  defparam
    u_altddio_out_component.extend_oe_disable = "OFF",
    u_altddio_out_component.intended_device_family = "Cyclone V",
    u_altddio_out_component.invert_output = "OFF",
    u_altddio_out_component.lpm_hint = "UNUSED",
    u_altddio_out_component.lpm_type = "altddio_out",
    u_altddio_out_component.oe_reg = "UNREGISTERED",
    u_altddio_out_component.power_up_high = "OFF",
    u_altddio_out_component.width = 1;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: CONSTANT: EXTEND_OE_DISABLE STRING "OFF"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: CONSTANT: INVERT_OUTPUT STRING "OFF"
// Retrieval info: CONSTANT: LPM_HINT STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altddio_out"
// Retrieval info: CONSTANT: OE_REG STRING "UNREGISTERED"
// Retrieval info: CONSTANT: POWER_UP_HIGH STRING "OFF"
// Retrieval info: CONSTANT: WIDTH NUMERIC "1"
// Retrieval info: USED_PORT: datain_h 0 0 1 0 INPUT NODEFVAL "datain_h[0..0]"
// Retrieval info: CONNECT: @datain_h 0 0 1 0 datain_h 0 0 1 0
// Retrieval info: USED_PORT: datain_l 0 0 1 0 INPUT NODEFVAL "datain_l[0..0]"
// Retrieval info: CONNECT: @datain_l 0 0 1 0 datain_l 0 0 1 0
// Retrieval info: USED_PORT: dataout 0 0 1 0 OUTPUT NODEFVAL "dataout[0..0]"
// Retrieval info: CONNECT: dataout 0 0 1 0 @dataout 0 0 1 0
// Retrieval info: USED_PORT: outclock 0 0 0 0 INPUT_CLK_EXT NODEFVAL "outclock"
// Retrieval info: CONNECT: @outclock 0 0 0 0 outclock 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out.qip TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out.bsf TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out_inst.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out_bb.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out.inc TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out.cmp TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_out.ppf TRUE FALSE
// Retrieval info: LIB_FILE: altera_mf
