// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

// megafunction wizard: %Triple-Speed Ethernet v14.0%
// GENERATION: XML
// mac_core.v

// Generated using ACDS version 14.0 200 at 2015.04.23.08:16:38

`timescale 1 ps / 1 ps
module mac_core (
		input  wire        clk,           // control_port_clock_connection.clk
		input  wire        reset,         //              reset_connection.reset
		input  wire [7:0]  reg_addr,      //                  control_port.address
		output wire [31:0] reg_data_out,  //                              .readdata
		input  wire        reg_rd,        //                              .read
		input  wire [31:0] reg_data_in,   //                              .writedata
		input  wire        reg_wr,        //                              .write
		output wire        reg_busy,      //                              .waitrequest
		input  wire        tx_clk,        //   pcs_mac_tx_clock_connection.clk
		input  wire        rx_clk,        //   pcs_mac_rx_clock_connection.clk
		input  wire        set_10,        //         mac_status_connection.set_10
		input  wire        set_1000,      //                              .set_1000
		output wire        eth_mode,      //                              .eth_mode
		output wire        ena_10,        //                              .ena_10
		input  wire [7:0]  gm_rx_d,       //           mac_gmii_connection.gmii_rx_d
		input  wire        gm_rx_dv,      //                              .gmii_rx_dv
		input  wire        gm_rx_err,     //                              .gmii_rx_err
		output wire [7:0]  gm_tx_d,       //                              .gmii_tx_d
		output wire        gm_tx_en,      //                              .gmii_tx_en
		output wire        gm_tx_err,     //                              .gmii_tx_err
		input  wire [3:0]  m_rx_d,        //            mac_mii_connection.mii_rx_d
		input  wire        m_rx_en,       //                              .mii_rx_dv
		input  wire        m_rx_err,      //                              .mii_rx_err
		output wire [3:0]  m_tx_d,        //                              .mii_tx_d
		output wire        m_tx_en,       //                              .mii_tx_en
		output wire        m_tx_err,      //                              .mii_tx_err
		input  wire        m_rx_crs,      //                              .mii_crs
		input  wire        m_rx_col,      //                              .mii_col
		input  wire        ff_rx_clk,     //      receive_clock_connection.clk
		input  wire        ff_tx_clk,     //     transmit_clock_connection.clk
		output wire [31:0] ff_rx_data,    //                       receive.data
		output wire        ff_rx_eop,     //                              .endofpacket
		output wire [5:0]  rx_err,        //                              .error
		output wire [1:0]  ff_rx_mod,     //                              .empty
		input  wire        ff_rx_rdy,     //                              .ready
		output wire        ff_rx_sop,     //                              .startofpacket
		output wire        ff_rx_dval,    //                              .valid
		input  wire [31:0] ff_tx_data,    //                      transmit.data
		input  wire        ff_tx_eop,     //                              .endofpacket
		input  wire        ff_tx_err,     //                              .error
		input  wire [1:0]  ff_tx_mod,     //                              .empty
		output wire        ff_tx_rdy,     //                              .ready
		input  wire        ff_tx_sop,     //                              .startofpacket
		input  wire        ff_tx_wren,    //                              .valid
		output wire        magic_wakeup,  //           mac_misc_connection.magic_wakeup
		input  wire        magic_sleep_n, //                              .magic_sleep_n
		input  wire        ff_tx_crc_fwd, //                              .ff_tx_crc_fwd
		output wire        ff_tx_septy,   //                              .ff_tx_septy
		output wire        tx_ff_uflow,   //                              .tx_ff_uflow
		output wire        ff_tx_a_full,  //                              .ff_tx_a_full
		output wire        ff_tx_a_empty, //                              .ff_tx_a_empty
		output wire [17:0] rx_err_stat,   //                              .rx_err_stat
		output wire [3:0]  rx_frm_type,   //                              .rx_frm_type
		output wire        ff_rx_dsav,    //                              .ff_rx_dsav
		output wire        ff_rx_a_full,  //                              .ff_rx_a_full
		output wire        ff_rx_a_empty  //                              .ff_rx_a_empty
	);

	mac_core_0002 mac_core_inst (
		.clk           (clk),           // control_port_clock_connection.clk
		.reset         (reset),         //              reset_connection.reset
		.reg_addr      (reg_addr),      //                  control_port.address
		.reg_data_out  (reg_data_out),  //                              .readdata
		.reg_rd        (reg_rd),        //                              .read
		.reg_data_in   (reg_data_in),   //                              .writedata
		.reg_wr        (reg_wr),        //                              .write
		.reg_busy      (reg_busy),      //                              .waitrequest
		.tx_clk        (tx_clk),        //   pcs_mac_tx_clock_connection.clk
		.rx_clk        (rx_clk),        //   pcs_mac_rx_clock_connection.clk
		.set_10        (set_10),        //         mac_status_connection.set_10
		.set_1000      (set_1000),      //                              .set_1000
		.eth_mode      (eth_mode),      //                              .eth_mode
		.ena_10        (ena_10),        //                              .ena_10
		.gm_rx_d       (gm_rx_d),       //           mac_gmii_connection.gmii_rx_d
		.gm_rx_dv      (gm_rx_dv),      //                              .gmii_rx_dv
		.gm_rx_err     (gm_rx_err),     //                              .gmii_rx_err
		.gm_tx_d       (gm_tx_d),       //                              .gmii_tx_d
		.gm_tx_en      (gm_tx_en),      //                              .gmii_tx_en
		.gm_tx_err     (gm_tx_err),     //                              .gmii_tx_err
		.m_rx_d        (m_rx_d),        //            mac_mii_connection.mii_rx_d
		.m_rx_en       (m_rx_en),       //                              .mii_rx_dv
		.m_rx_err      (m_rx_err),      //                              .mii_rx_err
		.m_tx_d        (m_tx_d),        //                              .mii_tx_d
		.m_tx_en       (m_tx_en),       //                              .mii_tx_en
		.m_tx_err      (m_tx_err),      //                              .mii_tx_err
		.m_rx_crs      (m_rx_crs),      //                              .mii_crs
		.m_rx_col      (m_rx_col),      //                              .mii_col
		.ff_rx_clk     (ff_rx_clk),     //      receive_clock_connection.clk
		.ff_tx_clk     (ff_tx_clk),     //     transmit_clock_connection.clk
		.ff_rx_data    (ff_rx_data),    //                       receive.data
		.ff_rx_eop     (ff_rx_eop),     //                              .endofpacket
		.rx_err        (rx_err),        //                              .error
		.ff_rx_mod     (ff_rx_mod),     //                              .empty
		.ff_rx_rdy     (ff_rx_rdy),     //                              .ready
		.ff_rx_sop     (ff_rx_sop),     //                              .startofpacket
		.ff_rx_dval    (ff_rx_dval),    //                              .valid
		.ff_tx_data    (ff_tx_data),    //                      transmit.data
		.ff_tx_eop     (ff_tx_eop),     //                              .endofpacket
		.ff_tx_err     (ff_tx_err),     //                              .error
		.ff_tx_mod     (ff_tx_mod),     //                              .empty
		.ff_tx_rdy     (ff_tx_rdy),     //                              .ready
		.ff_tx_sop     (ff_tx_sop),     //                              .startofpacket
		.ff_tx_wren    (ff_tx_wren),    //                              .valid
		.magic_wakeup  (magic_wakeup),  //           mac_misc_connection.magic_wakeup
		.magic_sleep_n (magic_sleep_n), //                              .magic_sleep_n
		.ff_tx_crc_fwd (ff_tx_crc_fwd), //                              .ff_tx_crc_fwd
		.ff_tx_septy   (ff_tx_septy),   //                              .ff_tx_septy
		.tx_ff_uflow   (tx_ff_uflow),   //                              .tx_ff_uflow
		.ff_tx_a_full  (ff_tx_a_full),  //                              .ff_tx_a_full
		.ff_tx_a_empty (ff_tx_a_empty), //                              .ff_tx_a_empty
		.rx_err_stat   (rx_err_stat),   //                              .rx_err_stat
		.rx_frm_type   (rx_frm_type),   //                              .rx_frm_type
		.ff_rx_dsav    (ff_rx_dsav),    //                              .ff_rx_dsav
		.ff_rx_a_full  (ff_rx_a_full),  //                              .ff_rx_a_full
		.ff_rx_a_empty (ff_rx_a_empty)  //                              .ff_rx_a_empty
	);

endmodule
// Retrieval info: <?xml version="1.0"?>
//<!--
//	Generated by Altera MegaWizard Launcher Utility version 1.0
//	************************************************************
//	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//	************************************************************
//	Copyright (C) 1991-2015 Altera Corporation
//	Any megafunction design, and related net list (encrypted or decrypted),
//	support information, device programming or simulation file, and any other
//	associated documentation or information provided by Altera or a partner
//	under Altera's Megafunction Partnership Program may be used only to
//	program PLD devices (but not masked PLD devices) from Altera.  Any other
//	use of such megafunction design, net list, support information, device
//	programming or simulation file, or any other related documentation or
//	information is prohibited for any other purpose, including, but not
//	limited to modification, reverse engineering, de-compiling, or use with
//	any other silicon devices, unless such use is explicitly licensed under
//	a separate agreement with Altera or a megafunction partner.  Title to
//	the intellectual property, including patents, copyrights, trademarks,
//	trade secrets, or maskworks, embodied in any such megafunction design,
//	net list, support information, device programming or simulation file, or
//	any other related documentation or information provided by Altera or a
//	megafunction partner, remains with Altera, the megafunction partner, or
//	their respective licensors.  No other licenses, including any licenses
//	needed under any third party's intellectual property, are provided herein.
//-->
// Retrieval info: <instance entity-name="altera_eth_tse" version="14.0" >
// Retrieval info: 	<generic name="deviceFamilyName" value="Stratix IV" />
// Retrieval info: 	<generic name="core_variation" value="MAC_ONLY" />
// Retrieval info: 	<generic name="ifGMII" value="MII_GMII" />
// Retrieval info: 	<generic name="enable_use_internal_fifo" value="true" />
// Retrieval info: 	<generic name="enable_ecc" value="false" />
// Retrieval info: 	<generic name="max_channels" value="1" />
// Retrieval info: 	<generic name="use_misc_ports" value="true" />
// Retrieval info: 	<generic name="transceiver_type" value="NONE" />
// Retrieval info: 	<generic name="enable_hd_logic" value="true" />
// Retrieval info: 	<generic name="enable_gmii_loopback" value="false" />
// Retrieval info: 	<generic name="enable_sup_addr" value="false" />
// Retrieval info: 	<generic name="stat_cnt_ena" value="true" />
// Retrieval info: 	<generic name="ext_stat_cnt_ena" value="false" />
// Retrieval info: 	<generic name="ena_hash" value="false" />
// Retrieval info: 	<generic name="enable_shift16" value="true" />
// Retrieval info: 	<generic name="enable_mac_flow_ctrl" value="false" />
// Retrieval info: 	<generic name="enable_mac_vlan" value="false" />
// Retrieval info: 	<generic name="enable_magic_detect" value="true" />
// Retrieval info: 	<generic name="useMDIO" value="false" />
// Retrieval info: 	<generic name="mdio_clk_div" value="40" />
// Retrieval info: 	<generic name="enable_ena" value="32" />
// Retrieval info: 	<generic name="eg_addr" value="11" />
// Retrieval info: 	<generic name="ing_addr" value="11" />
// Retrieval info: 	<generic name="phy_identifier" value="0" />
// Retrieval info: 	<generic name="enable_sgmii" value="false" />
// Retrieval info: 	<generic name="export_pwrdn" value="false" />
// Retrieval info: 	<generic name="enable_alt_reconfig" value="false" />
// Retrieval info: 	<generic name="starting_channel_number" value="0" />
// Retrieval info: 	<generic name="phyip_pll_type" value="CMU" />
// Retrieval info: 	<generic name="phyip_pll_base_data_rate" value="1250 Mbps" />
// Retrieval info: 	<generic name="phyip_en_synce_support" value="false" />
// Retrieval info: 	<generic name="phyip_pma_bonding_mode" value="x1" />
// Retrieval info: 	<generic name="nf_phyip_rcfg_enable" value="false" />
// Retrieval info: 	<generic name="enable_timestamping" value="false" />
// Retrieval info: 	<generic name="enable_ptp_1step" value="false" />
// Retrieval info: 	<generic name="tstamp_fp_width" value="4" />
// Retrieval info: 	<generic name="AUTO_DEVICE" value="Unknown" />
// Retrieval info: </instance>
// IPFS_FILES : mac_core.vo
// RELATED_FILES: mac_core.v, mac_core_0002.v, altera_eth_tse_mac.v, altera_tse_clk_cntl.v, altera_tse_crc328checker.v, altera_tse_crc328generator.v, altera_tse_crc32ctl8.v, altera_tse_crc32galois8.v, altera_tse_gmii_io.v, altera_tse_lb_read_cntl.v, altera_tse_lb_wrt_cntl.v, altera_tse_hashing.v, altera_tse_host_control.v, altera_tse_host_control_small.v, altera_tse_mac_control.v, altera_tse_register_map.v, altera_tse_register_map_small.v, altera_tse_rx_counter_cntl.v, altera_tse_shared_mac_control.v, altera_tse_shared_register_map.v, altera_tse_tx_counter_cntl.v, altera_tse_lfsr_10.v, altera_tse_loopback_ff.v, altera_tse_altshifttaps.v, altera_tse_fifoless_mac_rx.v, altera_tse_mac_rx.v, altera_tse_fifoless_mac_tx.v, altera_tse_mac_tx.v, altera_tse_magic_detection.v, altera_tse_mdio.v, altera_tse_mdio_clk_gen.v, altera_tse_mdio_cntl.v, altera_tse_top_mdio.v, altera_tse_mii_rx_if.v, altera_tse_mii_tx_if.v, altera_tse_pipeline_base.v, altera_tse_pipeline_stage.sv, altera_tse_dpram_16x32.v, altera_tse_dpram_8x32.v, altera_tse_dpram_ecc_16x32.v, altera_tse_quad_16x32.v, altera_tse_quad_8x32.v, altera_tse_fifoless_retransmit_cntl.v, altera_tse_retransmit_cntl.v, altera_tse_rgmii_in1.v, altera_tse_rgmii_in4.v, altera_tse_nf_rgmii_module.v, altera_tse_rgmii_module.v, altera_tse_rgmii_out1.v, altera_tse_rgmii_out4.v, altera_tse_rx_ff.v, altera_tse_rx_min_ff.v, altera_tse_rx_ff_cntrl.v, altera_tse_rx_ff_cntrl_32.v, altera_tse_rx_ff_cntrl_32_shift16.v, altera_tse_rx_ff_length.v, altera_tse_rx_stat_extract.v, altera_tse_timing_adapter32.v, altera_tse_timing_adapter8.v, altera_tse_timing_adapter_fifo32.v, altera_tse_timing_adapter_fifo8.v, altera_tse_top_1geth.v, altera_tse_top_fifoless_1geth.v, altera_tse_top_w_fifo.v, altera_tse_top_w_fifo_10_100_1000.v, altera_tse_top_wo_fifo.v, altera_tse_top_wo_fifo_10_100_1000.v, altera_tse_top_gen_host.v, altera_tse_tx_ff.v, altera_tse_tx_min_ff.v, altera_tse_tx_ff_cntrl.v, altera_tse_tx_ff_cntrl_32.v, altera_tse_tx_ff_cntrl_32_shift16.v, altera_tse_tx_ff_length.v, altera_tse_tx_ff_read_cntl.v, altera_tse_tx_stat_extract.v, altera_tse_false_path_marker.v, altera_tse_reset_synchronizer.v, altera_tse_clock_crosser.v, altera_tse_a_fifo_13.v, altera_tse_a_fifo_24.v, altera_tse_a_fifo_34.v, altera_tse_a_fifo_opt_1246.v, altera_tse_a_fifo_opt_14_44.v, altera_tse_a_fifo_opt_36_10.v, altera_tse_gray_cnt.v, altera_tse_sdpm_altsyncram.v, altera_tse_altsyncram_dpm_fifo.v, altera_tse_bin_cnt.v, altera_tse_ph_calculator.sv, altera_tse_sdpm_gen.v, altera_tse_dc_fifo.v, altera_tse_ecc_dec_x10.v, altera_tse_ecc_enc_x10.v, altera_tse_ecc_enc_x10_wrapper.v, altera_tse_ecc_dec_x14.v, altera_tse_ecc_enc_x14.v, altera_tse_ecc_enc_x14_wrapper.v, altera_tse_ecc_dec_x2.v, altera_tse_ecc_enc_x2.v, altera_tse_ecc_enc_x2_wrapper.v, altera_tse_ecc_dec_x23.v, altera_tse_ecc_enc_x23.v, altera_tse_ecc_enc_x23_wrapper.v, altera_tse_ecc_dec_x36.v, altera_tse_ecc_enc_x36.v, altera_tse_ecc_enc_x36_wrapper.v, altera_tse_ecc_dec_x40.v, altera_tse_ecc_enc_x40.v, altera_tse_ecc_enc_x40_wrapper.v, altera_tse_ecc_dec_x30.v, altera_tse_ecc_enc_x30.v, altera_tse_ecc_enc_x30_wrapper.v, altera_tse_ecc_status_crosser.v
