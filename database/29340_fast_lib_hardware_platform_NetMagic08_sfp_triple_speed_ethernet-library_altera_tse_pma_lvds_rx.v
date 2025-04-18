// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

// megafunction wizard: %ALTLVDS%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altlvds_rx 

// ============================================================
// File Name: altera_tse_pma_lvds_rx.v
// Megafunction Name(s):
// 			altlvds_rx
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 7.2 Internal Build 97 06/25/2007 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2007 Altera Corporation
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
module altera_tse_pma_lvds_rx (
	rx_in,
	rx_inclock,
	rx_reset,
	rx_divfwdclk,
	rx_out,
	rx_outclock);

	input	[0:0]  rx_in;
	input	  rx_inclock;
	input	[0:0]  rx_reset;
	output	[0:0]  rx_divfwdclk;
	output	[9:0]  rx_out;
	output	  rx_outclock;

	wire [0:0] sub_wire0;
	wire [9:0] sub_wire1;
	wire  sub_wire2;
	wire [0:0] rx_divfwdclk = sub_wire0[0:0];
	wire [9:0] rx_out = sub_wire1[9:0];
	wire  rx_outclock = sub_wire2;

	altlvds_rx	altlvds_rx_component (
				.rx_inclock (rx_inclock),
				.rx_reset (rx_reset),
				.rx_in (rx_in),
				.rx_divfwdclk (sub_wire0),
				.rx_out (sub_wire1),
				.rx_outclock (sub_wire2),
				.pll_areset (1'b0),
				.rx_cda_max (),
				.rx_cda_reset (1'b0),
				.rx_channel_data_align (1'b0),
				.rx_coreclk (1'b1),
				.rx_data_align (1'b0),
				.rx_deskew (1'b0),
				.rx_dpa_locked (),
				.rx_dpll_enable (1'b1),
				.rx_dpll_hold (1'b0),
				.rx_dpll_reset (1'b0),
				.rx_enable (1'b1),
				.rx_fifo_reset (1'b0),
				.rx_locked (),
				.rx_pll_enable (1'b1),
				.rx_readclock (1'b0),
				.rx_syncclock (1'b0));
	defparam
		altlvds_rx_component.common_rx_tx_pll = "ON",
		altlvds_rx_component.deserialization_factor = 10,
		altlvds_rx_component.enable_dpa_mode = "ON",
		altlvds_rx_component.enable_soft_cdr_mode = "ON",
		altlvds_rx_component.implement_in_les = "OFF",
		altlvds_rx_component.inclock_period = 8000,
		altlvds_rx_component.input_data_rate = 1250,
		altlvds_rx_component.intended_device_family = "Stratix III",
		altlvds_rx_component.lpm_type = "altlvds_rx",
		altlvds_rx_component.number_of_channels = 1,
		altlvds_rx_component.outclock_resource = "AUTO",
		altlvds_rx_component.registered_output = "ON",
		altlvds_rx_component.use_external_pll = "OFF",
		altlvds_rx_component.enable_dpa_align_to_rising_edge_only = "OFF",
		altlvds_rx_component.enable_dpa_initial_phase_selection = "OFF";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: Bitslip NUMERIC "4"
// Retrieval info: PRIVATE: Channel_Data_Align_Max NUMERIC "0"
// Retrieval info: PRIVATE: Channel_Data_Align_Reset NUMERIC "0"
// Retrieval info: PRIVATE: Clock_Mode NUMERIC "0"
// Retrieval info: PRIVATE: Data_rate STRING "1250"
// Retrieval info: PRIVATE: Deser_Factor NUMERIC "10"
// Retrieval info: PRIVATE: Dpa_Locked NUMERIC "0"
// Retrieval info: PRIVATE: Dpll_Enable NUMERIC "0"
// Retrieval info: PRIVATE: Dpll_Hold NUMERIC "0"
// Retrieval info: PRIVATE: Dpll_Reset NUMERIC "1"
// Retrieval info: PRIVATE: Enable_DPA_Mode STRING "ON"
// Retrieval info: PRIVATE: Ext_PLL STRING "OFF"
// Retrieval info: PRIVATE: Fifo_Reset NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix III"
// Retrieval info: PRIVATE: Int_Device STRING "Stratix III"
// Retrieval info: PRIVATE: LVDS_Mode NUMERIC "1"
// Retrieval info: PRIVATE: Le_Serdes STRING "OFF"
// Retrieval info: PRIVATE: Lose_Lock NUMERIC "0"
// Retrieval info: PRIVATE: Num_Channel NUMERIC "1"
// Retrieval info: PRIVATE: PLL_Enable NUMERIC "0"
// Retrieval info: PRIVATE: PLL_Freq STRING "125.00"
// Retrieval info: PRIVATE: PLL_Period STRING "8.000"
// Retrieval info: PRIVATE: Reg_InOut NUMERIC "1"
// Retrieval info: PRIVATE: Reset_Fifo NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: Use_Clock_Resc STRING "AUTO"
// Retrieval info: PRIVATE: Use_Common_Rx_Tx_Plls NUMERIC "1"
// Retrieval info: PRIVATE: Use_Data_Align NUMERIC "0"
// Retrieval info: PRIVATE: Use_Lock NUMERIC "0"
// Retrieval info: PRIVATE: Use_Pll_Areset NUMERIC "0"
// Retrieval info: CONSTANT: COMMON_RX_TX_PLL STRING "ON"
// Retrieval info: CONSTANT: DESERIALIZATION_FACTOR NUMERIC "10"
// Retrieval info: CONSTANT: ENABLE_DPA_MODE STRING "ON"
// Retrieval info: CONSTANT: ENABLE_SOFT_CDR_MODE STRING "ON"
// Retrieval info: CONSTANT: IMPLEMENT_IN_LES STRING "OFF"
// Retrieval info: CONSTANT: INCLOCK_PERIOD NUMERIC "8000"
// Retrieval info: CONSTANT: INPUT_DATA_RATE NUMERIC "1250"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix III"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altlvds_rx"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "1"
// Retrieval info: CONSTANT: OUTCLOCK_RESOURCE STRING "AUTO"
// Retrieval info: CONSTANT: REGISTERED_OUTPUT STRING "ON"
// Retrieval info: CONSTANT: USE_EXTERNAL_PLL STRING "OFF"
// Retrieval info: CONSTANT: enable_dpa_align_to_rising_edge_only STRING "OFF"
// Retrieval info: CONSTANT: enable_dpa_initial_phase_selection STRING "OFF"
// Retrieval info: USED_PORT: rx_divfwdclk 0 0 1 0 OUTPUT NODEFVAL rx_divfwdclk[0..0]
// Retrieval info: USED_PORT: rx_in 0 0 1 0 INPUT NODEFVAL rx_in[0..0]
// Retrieval info: USED_PORT: rx_inclock 0 0 0 0 INPUT_CLK_EXT GND rx_inclock
// Retrieval info: USED_PORT: rx_out 0 0 10 0 OUTPUT NODEFVAL rx_out[9..0]
// Retrieval info: USED_PORT: rx_outclock 0 0 0 0 OUTPUT NODEFVAL rx_outclock
// Retrieval info: USED_PORT: rx_reset 0 0 1 0 INPUT GND rx_reset[0..0]
// Retrieval info: CONNECT: @rx_in 0 0 1 0 rx_in 0 0 1 0
// Retrieval info: CONNECT: rx_out 0 0 10 0 @rx_out 0 0 10 0
// Retrieval info: CONNECT: @rx_inclock 0 0 0 0 rx_inclock 0 0 0 0
// Retrieval info: CONNECT: rx_divfwdclk 0 0 1 0 @rx_divfwdclk 0 0 1 0
// Retrieval info: CONNECT: @rx_reset 0 0 1 0 rx_reset 0 0 1 0
// Retrieval info: CONNECT: rx_outclock 0 0 0 0 @rx_outclock 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_pma_lvds_rx.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_pma_lvds_rx.ppf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_pma_lvds_rx.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_pma_lvds_rx.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_pma_lvds_rx.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_pma_lvds_rx_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_pma_lvds_rx_bb.v FALSE
// Retrieval info: LIB_FILE: altera_mf
