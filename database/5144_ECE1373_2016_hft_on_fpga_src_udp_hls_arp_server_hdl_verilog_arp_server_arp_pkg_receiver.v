// This program was cloned from: https://github.com/mustafabbas/ECE1373_2016_hft_on_fpga
// License: MIT License

// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module arp_server_arp_pkg_receiver (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        arpReplyMetaFifo_V_din,
        arpReplyMetaFifo_V_full_n,
        arpReplyMetaFifo_V_write,
        arpTableInsertFifo_V_din,
        arpTableInsertFifo_V_full_n,
        arpTableInsertFifo_V_write,
        arpDataIn_V_data_V_dout,
        arpDataIn_V_data_V_empty_n,
        arpDataIn_V_data_V_read,
        arpDataIn_V_keep_V_dout,
        arpDataIn_V_keep_V_empty_n,
        arpDataIn_V_keep_V_read,
        arpDataIn_V_last_V_dout,
        arpDataIn_V_last_V_empty_n,
        arpDataIn_V_last_V_read,
        regIpAddress_V
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_pp0_stg0_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv16_3 = 16'b11;
parameter    ap_const_lv16_2 = 16'b10;
parameter    ap_const_lv16_1 = 16'b1;
parameter    ap_const_lv16_5 = 16'b101;
parameter    ap_const_lv16_4 = 16'b100;
parameter    ap_const_lv32_30 = 32'b110000;
parameter    ap_const_lv32_3F = 32'b111111;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv32_2F = 32'b101111;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv32_17 = 32'b10111;
parameter    ap_const_lv32_18 = 32'b11000;
parameter    ap_const_lv16_100 = 16'b100000000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [191:0] arpReplyMetaFifo_V_din;
input   arpReplyMetaFifo_V_full_n;
output   arpReplyMetaFifo_V_write;
output  [80:0] arpTableInsertFifo_V_din;
input   arpTableInsertFifo_V_full_n;
output   arpTableInsertFifo_V_write;
input  [63:0] arpDataIn_V_data_V_dout;
input   arpDataIn_V_data_V_empty_n;
output   arpDataIn_V_data_V_read;
input  [7:0] arpDataIn_V_keep_V_dout;
input   arpDataIn_V_keep_V_empty_n;
output   arpDataIn_V_keep_V_read;
input  [0:0] arpDataIn_V_last_V_dout;
input   arpDataIn_V_last_V_empty_n;
output   arpDataIn_V_last_V_read;
input  [31:0] regIpAddress_V;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg arpReplyMetaFifo_V_write;
reg arpTableInsertFifo_V_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm = 1'b1;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_0;
reg    ap_sig_bdd_20;
wire    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
wire    arpDataIn_V_data_V0_status;
wire   [0:0] tmp_nbreadreq_fu_174_p5;
reg    ap_sig_bdd_46;
reg   [0:0] tmp_reg_661;
reg   [0:0] tmp_last_V_reg_665;
reg   [0:0] or_cond_reg_725;
reg    ap_sig_bdd_72;
reg   [15:0] wordCount = 16'b0000000000000000;
reg   [47:0] meta_srcMac_V = 48'b000000000000000000000000000000000000000000000000;
reg   [15:0] opCode_V = 16'b0000000000000000;
reg   [47:0] meta_hwAddrSrc_V = 48'b000000000000000000000000000000000000000000000000;
reg   [31:0] meta_protoAddrSrc_V = 32'b00000000000000000000000000000000;
reg   [31:0] protoAddrDst_V = 32'b00000000000000000000000000000000;
reg   [15:0] meta_ethType_V = 16'b0000000000000000;
reg   [15:0] meta_hwType_V = 16'b0000000000000000;
reg   [15:0] meta_protoType_V = 16'b0000000000000000;
reg   [7:0] meta_hwLen_V = 8'b00000000;
reg   [7:0] meta_protoLen_V = 8'b00000000;
wire   [0:0] tmp_last_V_fu_341_p1;
wire   [47:0] p_Result_5_fu_426_p5;
wire   [15:0] wordCount_load_load_fu_345_p1;
wire   [47:0] p_Result_2_fu_508_p5;
wire   [47:0] p_Result_1_fu_530_p5;
wire   [47:0] p_Result_s_30_fu_560_p5;
wire   [0:0] or_cond_fu_597_p2;
wire   [15:0] ap_reg_phiprechg_opCode_V_loc_reg_210pp0_it0;
reg   [15:0] opCode_V_loc_phi_fu_213_p14;
wire   [31:0] ap_reg_phiprechg_protoAddrDst_V_loc_reg_229pp0_it0;
reg   [31:0] protoAddrDst_V_loc_phi_fu_232_p14;
wire   [31:0] p_Result_13_fu_384_p5;
wire   [31:0] p_Result_12_fu_403_p5;
wire   [15:0] tmp_8_fu_578_p2;
wire   [15:0] ap_reg_phiprechg_storemerge_reg_248pp0_it0;
reg   [15:0] storemerge_phi_fu_251_p4;
wire   [47:0] ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it0;
reg   [47:0] ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it1;
wire   [47:0] ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it0;
reg   [47:0] ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it1;
wire   [31:0] ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it0;
reg   [31:0] ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it1;
reg    arpDataIn_V_data_V0_update;
wire   [15:0] grp_fu_316_p4;
wire   [15:0] tmp_2_fu_460_p1;
wire   [15:0] tmp_4_fu_380_p1;
wire   [31:0] tmp_3_fu_422_p1;
wire   [31:0] tmp_1_fu_526_p1;
wire   [0:0] tmp_7_fu_585_p2;
wire   [0:0] tmp_9_fu_591_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_pprstidle_pp0;
reg    ap_sig_bdd_245;
reg    ap_sig_bdd_257;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_pp0_stg0_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_done_reg assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_done_reg
    if (ap_rst == 1'b1) begin
        ap_done_reg <= ap_const_logic_0;
    end else begin
        if ((ap_const_logic_1 == ap_continue)) begin
            ap_done_reg <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
            ap_done_reg <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it1 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
            ap_reg_ppiten_pp0_it1 <= ap_reg_ppiten_pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_2))) begin
        ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it1 <= p_Result_2_fu_508_p5;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_3))) begin
        ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it1 <= p_Result_5_fu_426_p5;
    end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_5) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_4) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_3) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_2) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_1) & ~(ap_const_lv16_0 == wordCount_load_load_fu_345_p1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_5)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_4)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (ap_const_lv16_0 == wordCount_load_load_fu_345_p1)))) begin
        ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it1 <= meta_hwAddrSrc_V;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it1 <= ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_3))) begin
        ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it1 <= {{arpDataIn_V_data_V_dout[ap_const_lv32_3F : ap_const_lv32_20]}};
    end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_5) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_4) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_3) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_2) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_1) & ~(ap_const_lv16_0 == wordCount_load_load_fu_345_p1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_5)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_4)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_2)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (ap_const_lv16_0 == wordCount_load_load_fu_345_p1)))) begin
        ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it1 <= meta_protoAddrSrc_V;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it1 <= ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (ap_const_lv16_0 == wordCount_load_load_fu_345_p1))) begin
        ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it1 <= p_Result_s_30_fu_560_p5;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_1))) begin
        ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it1 <= p_Result_1_fu_530_p5;
    end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_5) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_4) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_3) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_2) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_1) & ~(ap_const_lv16_0 == wordCount_load_load_fu_345_p1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_5)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_4)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_3)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_2)))) begin
        ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it1 <= meta_srcMac_V;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it1 <= ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_245) begin
        if ((wordCount_load_load_fu_345_p1 == ap_const_lv16_2)) begin
            meta_hwAddrSrc_V <= p_Result_2_fu_508_p5;
        end else if ((wordCount_load_load_fu_345_p1 == ap_const_lv16_3)) begin
            meta_hwAddrSrc_V <= p_Result_5_fu_426_p5;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_245) begin
        if ((ap_const_lv16_0 == wordCount_load_load_fu_345_p1)) begin
            meta_srcMac_V <= p_Result_s_30_fu_560_p5;
        end else if ((wordCount_load_load_fu_345_p1 == ap_const_lv16_1)) begin
            meta_srcMac_V <= p_Result_1_fu_530_p5;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_245) begin
        if ((wordCount_load_load_fu_345_p1 == ap_const_lv16_4)) begin
            protoAddrDst_V <= p_Result_12_fu_403_p5;
        end else if ((wordCount_load_load_fu_345_p1 == ap_const_lv16_5)) begin
            protoAddrDst_V <= p_Result_13_fu_384_p5;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_1))) begin
        meta_ethType_V <= {{arpDataIn_V_data_V_dout[ap_const_lv32_2F : ap_const_lv32_20]}};
        meta_hwType_V <= {{arpDataIn_V_data_V_dout[ap_const_lv32_3F : ap_const_lv32_30]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_2))) begin
        meta_hwLen_V <= {{arpDataIn_V_data_V_dout[ap_const_lv32_17 : ap_const_lv32_10]}};
        meta_protoLen_V <= {{arpDataIn_V_data_V_dout[ap_const_lv32_1F : ap_const_lv32_18]}};
        meta_protoType_V <= tmp_2_fu_460_p1;
        opCode_V <= {{arpDataIn_V_data_V_dout[ap_const_lv32_2F : ap_const_lv32_20]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_3))) begin
        meta_protoAddrSrc_V <= {{arpDataIn_V_data_V_dout[ap_const_lv32_3F : ap_const_lv32_20]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(ap_const_lv1_0 == tmp_last_V_fu_341_p1))) begin
        or_cond_reg_725 <= or_cond_fu_597_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_last_V_reg_665 <= arpDataIn_V_last_V_dout;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_reg_661 <= tmp_nbreadreq_fu_174_p5;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        wordCount <= storemerge_phi_fu_251_p4;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_46 or ap_sig_bdd_72)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_46 or ap_sig_bdd_72)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_0 assign process. ///
always @ (ap_sig_bdd_20)
begin
    if (ap_sig_bdd_20) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_pprstidle_pp0 assign process. ///
always @ (ap_start or ap_reg_ppiten_pp0_it0)
begin
    if (((ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_start))) begin
        ap_sig_pprstidle_pp0 = ap_const_logic_1;
    end else begin
        ap_sig_pprstidle_pp0 = ap_const_logic_0;
    end
end

/// arpDataIn_V_data_V0_update assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or tmp_nbreadreq_fu_174_p5 or ap_sig_bdd_46 or ap_sig_bdd_72)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        arpDataIn_V_data_V0_update = ap_const_logic_1;
    end else begin
        arpDataIn_V_data_V0_update = ap_const_logic_0;
    end
end

/// arpReplyMetaFifo_V_write assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_46 or tmp_reg_661 or tmp_last_V_reg_665 or or_cond_reg_725 or ap_sig_bdd_72)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(ap_const_lv1_0 == tmp_reg_661) & ~(ap_const_lv1_0 == tmp_last_V_reg_665) & ~(ap_const_lv1_0 == or_cond_reg_725) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        arpReplyMetaFifo_V_write = ap_const_logic_1;
    end else begin
        arpReplyMetaFifo_V_write = ap_const_logic_0;
    end
end

/// arpTableInsertFifo_V_write assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_46 or tmp_reg_661 or tmp_last_V_reg_665 or ap_sig_bdd_72)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(ap_const_lv1_0 == tmp_reg_661) & ~(ap_const_lv1_0 == tmp_last_V_reg_665) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        arpTableInsertFifo_V_write = ap_const_logic_1;
    end else begin
        arpTableInsertFifo_V_write = ap_const_logic_0;
    end
end

/// opCode_V_loc_phi_fu_213_p14 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or tmp_nbreadreq_fu_174_p5 or arpDataIn_V_data_V_dout or opCode_V or wordCount_load_load_fu_345_p1 or ap_reg_phiprechg_opCode_V_loc_reg_210pp0_it0)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_2))) begin
        opCode_V_loc_phi_fu_213_p14 = {{arpDataIn_V_data_V_dout[ap_const_lv32_2F : ap_const_lv32_20]}};
    end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_5) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_4) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_3) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_2) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_1) & ~(ap_const_lv16_0 == wordCount_load_load_fu_345_p1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_5)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_4)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_3)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (ap_const_lv16_0 == wordCount_load_load_fu_345_p1)))) begin
        opCode_V_loc_phi_fu_213_p14 = opCode_V;
    end else begin
        opCode_V_loc_phi_fu_213_p14 = ap_reg_phiprechg_opCode_V_loc_reg_210pp0_it0;
    end
end

/// protoAddrDst_V_loc_phi_fu_232_p14 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or tmp_nbreadreq_fu_174_p5 or protoAddrDst_V or wordCount_load_load_fu_345_p1 or ap_reg_phiprechg_protoAddrDst_V_loc_reg_229pp0_it0 or p_Result_13_fu_384_p5 or p_Result_12_fu_403_p5)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_4))) begin
        protoAddrDst_V_loc_phi_fu_232_p14 = p_Result_12_fu_403_p5;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_5))) begin
        protoAddrDst_V_loc_phi_fu_232_p14 = p_Result_13_fu_384_p5;
    end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_5) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_4) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_3) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_2) & ~(wordCount_load_load_fu_345_p1 == ap_const_lv16_1) & ~(ap_const_lv16_0 == wordCount_load_load_fu_345_p1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_3)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_2)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (wordCount_load_load_fu_345_p1 == ap_const_lv16_1)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & (ap_const_lv16_0 == wordCount_load_load_fu_345_p1)))) begin
        protoAddrDst_V_loc_phi_fu_232_p14 = protoAddrDst_V;
    end else begin
        protoAddrDst_V_loc_phi_fu_232_p14 = ap_reg_phiprechg_protoAddrDst_V_loc_reg_229pp0_it0;
    end
end

/// storemerge_phi_fu_251_p4 assign process. ///
always @ (tmp_last_V_fu_341_p1 or tmp_8_fu_578_p2 or ap_reg_phiprechg_storemerge_reg_248pp0_it0 or ap_sig_bdd_257)
begin
    if (ap_sig_bdd_257) begin
        if (~(ap_const_lv1_0 == tmp_last_V_fu_341_p1)) begin
            storemerge_phi_fu_251_p4 = ap_const_lv16_0;
        end else if ((ap_const_lv1_0 == tmp_last_V_fu_341_p1)) begin
            storemerge_phi_fu_251_p4 = tmp_8_fu_578_p2;
        end else begin
            storemerge_phi_fu_251_p4 = ap_reg_phiprechg_storemerge_reg_248pp0_it0;
        end
    end else begin
        storemerge_phi_fu_251_p4 = ap_reg_phiprechg_storemerge_reg_248pp0_it0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_done_reg or ap_CS_fsm or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_46 or ap_sig_bdd_72 or ap_sig_pprstidle_pp0)
begin
    case (ap_CS_fsm)
        ap_ST_pp0_stg0_fsm_0 : 
        begin
            ap_NS_fsm = ap_ST_pp0_stg0_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_reg_phiprechg_opCode_V_loc_reg_210pp0_it0 = 'bx;
assign ap_reg_phiprechg_protoAddrDst_V_loc_reg_229pp0_it0 = 'bx;
assign ap_reg_phiprechg_storemerge_reg_248pp0_it0 = 'bx;
assign ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it0 = 'bx;
assign ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it0 = 'bx;
assign ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it0 = 'bx;
assign ap_reg_ppiten_pp0_it0 = ap_start;

/// ap_sig_bdd_20 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_20 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_245 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or tmp_nbreadreq_fu_174_p5 or ap_sig_bdd_46 or ap_sig_bdd_72)
begin
    ap_sig_bdd_245 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_46) | (ap_sig_bdd_72 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))));
end

/// ap_sig_bdd_257 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or tmp_nbreadreq_fu_174_p5)
begin
    ap_sig_bdd_257 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0));
end

/// ap_sig_bdd_46 assign process. ///
always @ (ap_start or ap_done_reg or arpDataIn_V_data_V0_status or tmp_nbreadreq_fu_174_p5)
begin
    ap_sig_bdd_46 = (((arpDataIn_V_data_V0_status == ap_const_logic_0) & ~(tmp_nbreadreq_fu_174_p5 == ap_const_lv1_0)) | (ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_72 assign process. ///
always @ (arpReplyMetaFifo_V_full_n or tmp_reg_661 or tmp_last_V_reg_665 or or_cond_reg_725 or arpTableInsertFifo_V_full_n)
begin
    ap_sig_bdd_72 = (((arpReplyMetaFifo_V_full_n == ap_const_logic_0) & ~(ap_const_lv1_0 == tmp_reg_661) & ~(ap_const_lv1_0 == tmp_last_V_reg_665) & ~(ap_const_lv1_0 == or_cond_reg_725)) | (~(ap_const_lv1_0 == tmp_reg_661) & ~(ap_const_lv1_0 == tmp_last_V_reg_665) & (arpTableInsertFifo_V_full_n == ap_const_logic_0)));
end
assign arpDataIn_V_data_V0_status = (arpDataIn_V_data_V_empty_n & arpDataIn_V_keep_V_empty_n & arpDataIn_V_last_V_empty_n);
assign arpDataIn_V_data_V_read = arpDataIn_V_data_V0_update;
assign arpDataIn_V_keep_V_read = arpDataIn_V_data_V0_update;
assign arpDataIn_V_last_V_read = arpDataIn_V_data_V0_update;
assign arpReplyMetaFifo_V_din = {{{{{{{{ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it1}, {ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it1}}, {meta_protoLen_V}}, {meta_hwLen_V}}, {meta_protoType_V}}, {meta_hwType_V}}, {meta_ethType_V}}, {ap_reg_phiprechg_tmp_srcMac_V_reg_258pp0_it1}};
assign arpTableInsertFifo_V_din = {{{{ap_const_lv1_1}, {ap_reg_phiprechg_tmp_protoAddrSrc_V_reg_296pp0_it1}}}, {ap_reg_phiprechg_tmp_hwAddrSrc_V_reg_277pp0_it1}};
assign grp_fu_316_p4 = {{arpDataIn_V_data_V_dout[ap_const_lv32_3F : ap_const_lv32_30]}};
assign or_cond_fu_597_p2 = (tmp_7_fu_585_p2 & tmp_9_fu_591_p2);
assign p_Result_12_fu_403_p5 = {{protoAddrDst_V[32'd31 : 32'd16]}, {grp_fu_316_p4}};
assign p_Result_13_fu_384_p5 = {{tmp_4_fu_380_p1}, {protoAddrDst_V[32'd15 : 32'd0]}};
assign p_Result_1_fu_530_p5 = {{tmp_1_fu_526_p1}, {meta_srcMac_V[32'd15 : 32'd0]}};
assign p_Result_2_fu_508_p5 = {{meta_hwAddrSrc_V[32'd47 : 32'd16]}, {grp_fu_316_p4}};
assign p_Result_5_fu_426_p5 = {{tmp_3_fu_422_p1}, {meta_hwAddrSrc_V[32'd15 : 32'd0]}};
assign p_Result_s_30_fu_560_p5 = {{meta_srcMac_V[32'd47 : 32'd16]}, {grp_fu_316_p4}};
assign tmp_1_fu_526_p1 = arpDataIn_V_data_V_dout[31:0];
assign tmp_2_fu_460_p1 = arpDataIn_V_data_V_dout[15:0];
assign tmp_3_fu_422_p1 = arpDataIn_V_data_V_dout[31:0];
assign tmp_4_fu_380_p1 = arpDataIn_V_data_V_dout[15:0];
assign tmp_7_fu_585_p2 = (opCode_V_loc_phi_fu_213_p14 == ap_const_lv16_100? 1'b1: 1'b0);
assign tmp_8_fu_578_p2 = (wordCount + ap_const_lv16_1);
assign tmp_9_fu_591_p2 = (protoAddrDst_V_loc_phi_fu_232_p14 == regIpAddress_V? 1'b1: 1'b0);
assign tmp_last_V_fu_341_p1 = arpDataIn_V_last_V_dout;
assign tmp_nbreadreq_fu_174_p5 = (arpDataIn_V_data_V_empty_n & arpDataIn_V_keep_V_empty_n & arpDataIn_V_last_V_empty_n);
assign wordCount_load_load_fu_345_p1 = wordCount;


endmodule //arp_server_arp_pkg_receiver

