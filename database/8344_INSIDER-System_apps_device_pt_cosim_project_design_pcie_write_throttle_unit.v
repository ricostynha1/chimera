// This program was cloned from: https://github.com/zainryan/INSIDER-System
// License: MIT License

// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4.op
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="pcie_write_throttle_unit,hls_ip_2017_4_op,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu9p-flgb2104-2-i,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.196250,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=813,HLS_SYN_LUT=635}" *)

module pcie_write_throttle_unit (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
ap_continue,
        ap_idle,
        ap_ready,
        dma_write_throttle_params_V_dout,
        dma_write_throttle_params_V_empty_n,
        dma_write_throttle_params_V_read,
        before_throttle_pcie_write_req_data_V_last_dout,
        before_throttle_pcie_write_req_data_V_last_empty_n,
        before_throttle_pcie_write_req_data_V_last_read,
        before_throttle_pcie_write_req_data_V_data_V_dout,
        before_throttle_pcie_write_req_data_V_data_V_empty_n,
        before_throttle_pcie_write_req_data_V_data_V_read,
        before_throttle_pcie_write_req_apply_V_num_dout,
        before_throttle_pcie_write_req_apply_V_num_empty_n,
        before_throttle_pcie_write_req_apply_V_num_read,
        before_throttle_pcie_write_req_apply_V_addr_dout,
        before_throttle_pcie_write_req_apply_V_addr_empty_n,
        before_throttle_pcie_write_req_apply_V_addr_read,
        pcie_write_req_data_V_last_din,
        pcie_write_req_data_V_last_full_n,
        pcie_write_req_data_V_last_write,
        pcie_write_req_data_V_data_V_din,
        pcie_write_req_data_V_data_V_full_n,
        pcie_write_req_data_V_data_V_write,
        pcie_write_req_apply_V_num_din,
        pcie_write_req_apply_V_num_full_n,
        pcie_write_req_apply_V_num_write,
        pcie_write_req_apply_V_addr_din,
        pcie_write_req_apply_V_addr_full_n,
        pcie_write_req_apply_V_addr_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_pp0_stage0 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output ap_ready; output ap_continue;
input  [31:0] dma_write_throttle_params_V_dout;
input   dma_write_throttle_params_V_empty_n;
output   dma_write_throttle_params_V_read;
input   before_throttle_pcie_write_req_data_V_last_dout;
input   before_throttle_pcie_write_req_data_V_last_empty_n;
output   before_throttle_pcie_write_req_data_V_last_read;
input  [511:0] before_throttle_pcie_write_req_data_V_data_V_dout;
input   before_throttle_pcie_write_req_data_V_data_V_empty_n;
output   before_throttle_pcie_write_req_data_V_data_V_read;
input  [7:0] before_throttle_pcie_write_req_apply_V_num_dout;
input   before_throttle_pcie_write_req_apply_V_num_empty_n;
output   before_throttle_pcie_write_req_apply_V_num_read;
input  [63:0] before_throttle_pcie_write_req_apply_V_addr_dout;
input   before_throttle_pcie_write_req_apply_V_addr_empty_n;
output   before_throttle_pcie_write_req_apply_V_addr_read;
output   pcie_write_req_data_V_last_din;
input   pcie_write_req_data_V_last_full_n;
output   pcie_write_req_data_V_last_write;
output  [511:0] pcie_write_req_data_V_data_V_din;
input   pcie_write_req_data_V_data_V_full_n;
output   pcie_write_req_data_V_data_V_write;
output  [7:0] pcie_write_req_apply_V_num_din;
input   pcie_write_req_apply_V_num_full_n;
output   pcie_write_req_apply_V_num_write;
output  [63:0] pcie_write_req_apply_V_addr_din;
input   pcie_write_req_apply_V_addr_full_n;
output   pcie_write_req_apply_V_addr_write;

reg ap_idle;
reg dma_write_throttle_params_V_read;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    pcie_write_req_apply_V_num_blk_n;
reg    ap_enable_reg_pp0_iter2;
wire    ap_block_pp0_stage0;
reg   [0:0] empty_n_3_reg_627;
reg    pcie_write_req_apply_V_addr_blk_n;
reg   [31:0] throttle_threshold_reg_240;
reg   [31:0] throttle_cnt_reg_251;
reg   [0:0] valid_write_req_data_reg_262;
reg   [0:0] empty_n_reg_594;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    pcie_write_req_apply_V_num1_status;
reg    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
wire   [15:0] throttle_cnt_2_fu_347_p1;
reg   [15:0] throttle_cnt_2_reg_603;
reg   [15:0] throttle_threshold_1_reg_608;
wire   [31:0] throttle_threshold_3_fu_384_p3;
reg   [31:0] throttle_threshold_3_reg_613;
reg    ap_enable_reg_pp0_iter1;
wire   [31:0] throttle_cnt_1_fu_391_p3;
reg   [31:0] throttle_cnt_1_reg_618;
wire   [0:0] write_req_stall_1_fu_403_p2;
reg   [7:0] tmp_num_reg_631;
reg   [63:0] tmp_addr_reg_636;
wire   [0:0] empty_n_4_fu_429_p1;
reg   [0:0] ap_phi_mux_valid_write_req_data_phi_fu_266_p4;
wire   [0:0] or_cond_fu_461_p2;
reg    ap_enable_reg_pp0_iter0;
reg    ap_block_pp0_stage0_subdone;
reg   [31:0] ap_phi_mux_throttle_threshold_phi_fu_244_p4;
reg   [31:0] ap_phi_mux_throttle_cnt_phi_fu_255_p4;
reg   [0:0] ap_phi_mux_valid_write_req_data_5_phi_fu_300_p4;
wire   [0:0] ap_phi_mux_valid_write_req_data_3_phi_fu_279_p10;
wire   [0:0] ap_phi_reg_pp0_iter0_valid_write_req_data_3_reg_274;
reg   [0:0] ap_phi_reg_pp0_iter1_valid_write_req_data_3_reg_274;
reg   [0:0] ap_phi_reg_pp0_iter2_valid_write_req_data_3_reg_274;
wire   [0:0] not_full_n_i_fu_549_p2;
wire   [0:0] ap_phi_reg_pp0_iter2_valid_write_req_data_5_reg_296;
reg    before_throttle_pcie_write_req_apply_V_num0_update;
wire   [0:0] empty_n_1_nbread_fu_204_p3_0;
reg    before_throttle_pcie_write_req_data_V_last0_update;
wire   [0:0] empty_n_2_nbread_fu_212_p3_0;
reg    pcie_write_req_apply_V_num1_update;
reg    ap_block_pp0_stage0_01001;
reg    pcie_write_req_data_V_last1_update;
wire   [0:0] full_n_nbwrite_fu_230_p5;
reg   [31:0] write_req_stall_times_fu_178;
wire   [31:0] write_req_stall_times_1_fu_409_p3;
wire   [31:0] p_s_fu_518_p3;
reg   [0:0] write_req_stall_fu_182;
wire   [0:0] tmp_2_fu_471_p2;
wire   [0:0] not_s_fu_512_p2;
reg   [24:0] write_req_contiguous_times_V_1_fu_186;
wire   [24:0] p_1_fu_477_p3;
wire   [24:0] write_req_contiguous_times_V_fu_443_p2;
wire   [24:0] p_0_1_fu_376_p3;
reg   [0:0] tmp_last_fu_190;
reg   [511:0] tmp_data_V_fu_194;
wire   [31:0] throttle_threshold_2_fu_370_p1;
wire   [31:0] throttle_cnt_2_cast_fu_373_p1;
wire   [0:0] not_empty_n_fu_398_p2;
wire   [0:0] tmp_9_fu_449_p2;
wire   [0:0] tmp_s_fu_455_p2;
wire   [31:0] tmp_1_fu_467_p1;
wire   [31:0] write_req_stall_times_2_fu_500_p2;
wire   [0:0] tmp_6_fu_506_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (or_cond_fu_461_p2 == 1'd0) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (or_cond_fu_461_p2 == 1'd1) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)))) begin
        ap_phi_reg_pp0_iter2_valid_write_req_data_3_reg_274 <= 1'd1;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (write_req_stall_1_fu_403_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (empty_n_4_fu_429_p1 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)))) begin
        ap_phi_reg_pp0_iter2_valid_write_req_data_3_reg_274 <= 1'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_reg_pp0_iter2_valid_write_req_data_3_reg_274 <= ap_phi_mux_valid_write_req_data_phi_fu_266_p4;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_reg_pp0_iter2_valid_write_req_data_3_reg_274 <= ap_phi_reg_pp0_iter1_valid_write_req_data_3_reg_274;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        throttle_cnt_reg_251 <= throttle_cnt_1_reg_618;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        throttle_cnt_reg_251 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        throttle_threshold_reg_240 <= throttle_threshold_3_reg_613;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        throttle_threshold_reg_240 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        valid_write_req_data_reg_262 <= ap_phi_mux_valid_write_req_data_5_phi_fu_300_p4;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        valid_write_req_data_reg_262 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (write_req_stall_1_fu_403_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0)))) begin
        write_req_contiguous_times_V_1_fu_186 <= p_0_1_fu_376_p3;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (or_cond_fu_461_p2 == 1'd1) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0))) begin
        write_req_contiguous_times_V_1_fu_186 <= write_req_contiguous_times_V_fu_443_p2;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (or_cond_fu_461_p2 == 1'd0) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0))) begin
        write_req_contiguous_times_V_1_fu_186 <= p_1_fu_477_p3;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (empty_n_4_fu_429_p1 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        write_req_contiguous_times_V_1_fu_186 <= 25'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        write_req_stall_fu_182 <= write_req_stall_1_fu_403_p2;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (write_req_stall_1_fu_403_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0))) begin
        write_req_stall_fu_182 <= not_s_fu_512_p2;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (or_cond_fu_461_p2 == 1'd0) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0))) begin
        write_req_stall_fu_182 <= tmp_2_fu_471_p2;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (empty_n_4_fu_429_p1 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (or_cond_fu_461_p2 == 1'd1) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        write_req_stall_fu_182 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (write_req_stall_1_fu_403_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0))) begin
        write_req_stall_times_fu_178 <= p_s_fu_518_p3;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (empty_n_4_fu_429_p1 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (or_cond_fu_461_p2 == 1'd0) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (or_cond_fu_461_p2 == 1'd1) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)))) begin
        write_req_stall_times_fu_178 <= write_req_stall_times_1_fu_409_p3;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        write_req_stall_times_fu_178 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        ap_phi_reg_pp0_iter1_valid_write_req_data_3_reg_274 <= ap_phi_reg_pp0_iter0_valid_write_req_data_3_reg_274;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_n_3_reg_627 <= empty_n_1_nbread_fu_204_p3_0;
        empty_n_reg_594 <= dma_write_throttle_params_V_empty_n;
        throttle_cnt_2_reg_603 <= throttle_cnt_2_fu_347_p1;
        throttle_threshold_1_reg_608 <= {{dma_write_throttle_params_V_dout[31:16]}};
        tmp_addr_reg_636 <= before_throttle_pcie_write_req_apply_V_addr_dout;
        tmp_num_reg_631 <= before_throttle_pcie_write_req_apply_V_num_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        throttle_cnt_1_reg_618 <= throttle_cnt_1_fu_391_p3;
        throttle_threshold_3_reg_613 <= throttle_threshold_3_fu_384_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (empty_n_4_fu_429_p1 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (or_cond_fu_461_p2 == 1'd0) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (or_cond_fu_461_p2 == 1'd1) & (empty_n_4_fu_429_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0)))) begin
        tmp_data_V_fu_194 <= before_throttle_pcie_write_req_data_V_data_V_dout;
        tmp_last_fu_190 <= before_throttle_pcie_write_req_data_V_last_dout;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_throttle_cnt_phi_fu_255_p4 = throttle_cnt_1_reg_618;
    end else begin
        ap_phi_mux_throttle_cnt_phi_fu_255_p4 = throttle_cnt_reg_251;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_throttle_threshold_phi_fu_244_p4 = throttle_threshold_3_reg_613;
    end else begin
        ap_phi_mux_throttle_threshold_phi_fu_244_p4 = throttle_threshold_reg_240;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        if ((ap_phi_mux_valid_write_req_data_3_phi_fu_279_p10 == 1'd0)) begin
            ap_phi_mux_valid_write_req_data_5_phi_fu_300_p4 = ap_phi_reg_pp0_iter2_valid_write_req_data_3_reg_274;
        end else if ((ap_phi_mux_valid_write_req_data_3_phi_fu_279_p10 == 1'd1)) begin
            ap_phi_mux_valid_write_req_data_5_phi_fu_300_p4 = not_full_n_i_fu_549_p2;
        end else begin
            ap_phi_mux_valid_write_req_data_5_phi_fu_300_p4 = ap_phi_reg_pp0_iter2_valid_write_req_data_5_reg_296;
        end
    end else begin
        ap_phi_mux_valid_write_req_data_5_phi_fu_300_p4 = ap_phi_reg_pp0_iter2_valid_write_req_data_5_reg_296;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_valid_write_req_data_phi_fu_266_p4 = ap_phi_mux_valid_write_req_data_5_phi_fu_300_p4;
    end else begin
        ap_phi_mux_valid_write_req_data_phi_fu_266_p4 = valid_write_req_data_reg_262;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & ((before_throttle_pcie_write_req_apply_V_num_empty_n & before_throttle_pcie_write_req_apply_V_addr_empty_n) == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        before_throttle_pcie_write_req_apply_V_num0_update = 1'b1;
    end else begin
        before_throttle_pcie_write_req_apply_V_num0_update = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & ((before_throttle_pcie_write_req_data_V_last_empty_n & before_throttle_pcie_write_req_data_V_data_V_empty_n) == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_phi_mux_valid_write_req_data_phi_fu_266_p4 == 1'd0) & (write_req_stall_1_fu_403_p2 == 1'd0))) begin
        before_throttle_pcie_write_req_data_V_last0_update = 1'b1;
    end else begin
        before_throttle_pcie_write_req_data_V_last0_update = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (dma_write_throttle_params_V_empty_n == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        dma_write_throttle_params_V_read = 1'b1;
    end else begin
        dma_write_throttle_params_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((empty_n_3_reg_627 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        pcie_write_req_apply_V_addr_blk_n = pcie_write_req_apply_V_addr_full_n;
    end else begin
        pcie_write_req_apply_V_addr_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_3_reg_627 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        pcie_write_req_apply_V_num1_update = 1'b1;
    end else begin
        pcie_write_req_apply_V_num1_update = 1'b0;
    end
end

always @ (*) begin
    if (((empty_n_3_reg_627 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        pcie_write_req_apply_V_num_blk_n = pcie_write_req_apply_V_num_full_n;
    end else begin
        pcie_write_req_apply_V_num_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_valid_write_req_data_3_phi_fu_279_p10 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & ((pcie_write_req_data_V_last_full_n & pcie_write_req_data_V_data_V_full_n) == 1'b1))) begin
        pcie_write_req_data_V_last1_update = 1'b1;
    end else begin
        pcie_write_req_data_V_last1_update = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((empty_n_3_reg_627 == 1'd1) & (pcie_write_req_apply_V_num1_status == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((empty_n_3_reg_627 == 1'd1) & (pcie_write_req_apply_V_num1_status == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((empty_n_3_reg_627 == 1'd1) & (pcie_write_req_apply_V_num1_status == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter2 = ((empty_n_3_reg_627 == 1'd1) & (pcie_write_req_apply_V_num1_status == 1'b0));
end

assign ap_done = 1'b0;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_mux_valid_write_req_data_3_phi_fu_279_p10 = ap_phi_reg_pp0_iter2_valid_write_req_data_3_reg_274;

assign ap_phi_reg_pp0_iter0_valid_write_req_data_3_reg_274 = 'bx;

assign ap_phi_reg_pp0_iter2_valid_write_req_data_5_reg_296 = 'bx;

assign ap_ready = 1'b0;

assign before_throttle_pcie_write_req_apply_V_addr_read = before_throttle_pcie_write_req_apply_V_num0_update;

assign before_throttle_pcie_write_req_apply_V_num_read = before_throttle_pcie_write_req_apply_V_num0_update;

assign before_throttle_pcie_write_req_data_V_data_V_read = before_throttle_pcie_write_req_data_V_last0_update;

assign before_throttle_pcie_write_req_data_V_last_read = before_throttle_pcie_write_req_data_V_last0_update;

assign empty_n_1_nbread_fu_204_p3_0 = (before_throttle_pcie_write_req_apply_V_num_empty_n & before_throttle_pcie_write_req_apply_V_addr_empty_n);

assign empty_n_2_nbread_fu_212_p3_0 = (before_throttle_pcie_write_req_data_V_last_empty_n & before_throttle_pcie_write_req_data_V_data_V_empty_n);

assign empty_n_4_fu_429_p1 = empty_n_2_nbread_fu_212_p3_0;

assign full_n_nbwrite_fu_230_p5 = (pcie_write_req_data_V_last_full_n & pcie_write_req_data_V_data_V_full_n);

assign not_empty_n_fu_398_p2 = (empty_n_reg_594 ^ 1'd1);

assign not_full_n_i_fu_549_p2 = (full_n_nbwrite_fu_230_p5 ^ 1'd1);

assign not_s_fu_512_p2 = (tmp_6_fu_506_p2 ^ 1'd1);

assign or_cond_fu_461_p2 = (tmp_s_fu_455_p2 | tmp_9_fu_449_p2);

assign p_0_1_fu_376_p3 = ((empty_n_reg_594[0:0] === 1'b1) ? 25'd0 : write_req_contiguous_times_V_1_fu_186);

assign p_1_fu_477_p3 = ((tmp_2_fu_471_p2[0:0] === 1'b1) ? 25'd0 : write_req_contiguous_times_V_fu_443_p2);

assign p_s_fu_518_p3 = ((tmp_6_fu_506_p2[0:0] === 1'b1) ? 32'd0 : write_req_stall_times_2_fu_500_p2);

assign pcie_write_req_apply_V_addr_din = tmp_addr_reg_636;

assign pcie_write_req_apply_V_addr_write = pcie_write_req_apply_V_num1_update;

assign pcie_write_req_apply_V_num1_status = (pcie_write_req_apply_V_num_full_n & pcie_write_req_apply_V_addr_full_n);

assign pcie_write_req_apply_V_num_din = tmp_num_reg_631;

assign pcie_write_req_apply_V_num_write = pcie_write_req_apply_V_num1_update;

assign pcie_write_req_data_V_data_V_din = tmp_data_V_fu_194;

assign pcie_write_req_data_V_data_V_write = pcie_write_req_data_V_last1_update;

assign pcie_write_req_data_V_last_din = tmp_last_fu_190;

assign pcie_write_req_data_V_last_write = pcie_write_req_data_V_last1_update;

assign throttle_cnt_1_fu_391_p3 = ((empty_n_reg_594[0:0] === 1'b1) ? throttle_cnt_2_cast_fu_373_p1 : ap_phi_mux_throttle_cnt_phi_fu_255_p4);

assign throttle_cnt_2_cast_fu_373_p1 = throttle_cnt_2_reg_603;

assign throttle_cnt_2_fu_347_p1 = dma_write_throttle_params_V_dout[15:0];

assign throttle_threshold_2_fu_370_p1 = throttle_threshold_1_reg_608;

assign throttle_threshold_3_fu_384_p3 = ((empty_n_reg_594[0:0] === 1'b1) ? throttle_threshold_2_fu_370_p1 : ap_phi_mux_throttle_threshold_phi_fu_244_p4);

assign tmp_1_fu_467_p1 = write_req_contiguous_times_V_fu_443_p2;

assign tmp_2_fu_471_p2 = ((tmp_1_fu_467_p1 == throttle_threshold_3_fu_384_p3) ? 1'b1 : 1'b0);

assign tmp_6_fu_506_p2 = ((write_req_stall_times_2_fu_500_p2 == throttle_cnt_1_fu_391_p3) ? 1'b1 : 1'b0);

assign tmp_9_fu_449_p2 = ((throttle_threshold_3_fu_384_p3 == 32'd0) ? 1'b1 : 1'b0);

assign tmp_s_fu_455_p2 = ((throttle_cnt_1_fu_391_p3 == 32'd0) ? 1'b1 : 1'b0);

assign write_req_contiguous_times_V_fu_443_p2 = (p_0_1_fu_376_p3 + 25'd1);

assign write_req_stall_1_fu_403_p2 = (write_req_stall_fu_182 & not_empty_n_fu_398_p2);

assign write_req_stall_times_1_fu_409_p3 = ((empty_n_reg_594[0:0] === 1'b1) ? 32'd0 : write_req_stall_times_fu_178);

assign write_req_stall_times_2_fu_500_p2 = (write_req_stall_times_1_fu_409_p3 + 32'd1);

endmodule //pcie_write_throttle_unit
