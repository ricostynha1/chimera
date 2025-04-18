// This program was cloned from: https://github.com/waynezv/FPGA_Ultrasound
// License: GNU General Public License v3.0

module xillybus_core
  (
  input  M_AXI_ACP_ARREADY_w,
  input  M_AXI_ACP_AWREADY_w,
  input [1:0] M_AXI_ACP_BRESP_w,
  input  M_AXI_ACP_BVALID_w,
  input [63:0] M_AXI_ACP_RDATA_w,
  input  M_AXI_ACP_RLAST_w,
  input [1:0] M_AXI_ACP_RRESP_w,
  input  M_AXI_ACP_RVALID_w,
  input  M_AXI_ACP_WREADY_w,
  input [31:0] S_AXI_ARADDR_w,
  input  S_AXI_ARVALID_w,
  input [31:0] S_AXI_AWADDR_w,
  input  S_AXI_AWVALID_w,
  input  S_AXI_BREADY_w,
  input  S_AXI_RREADY_w,
  input [31:0] S_AXI_WDATA_w,
  input [3:0] S_AXI_WSTRB_w,
  input  S_AXI_WVALID_w,
  input  bus_clk_w,
  input  bus_rst_n_w,
  input [31:0] user_r_audio_data_w,
  input  user_r_audio_empty_w,
  input  user_r_audio_eof_w,
  input [7:0] user_r_mem_8_data_w,
  input  user_r_mem_8_empty_w,
  input  user_r_mem_8_eof_w,
  input [31:0] user_r_read_32_data_w,
  input  user_r_read_32_empty_w,
  input  user_r_read_32_eof_w,
  input [7:0] user_r_read_8_data_w,
  input  user_r_read_8_empty_w,
  input  user_r_read_8_eof_w,
  input [7:0] user_r_smb_data_w,
  input  user_r_smb_empty_w,
  input  user_r_smb_eof_w,
  input  user_w_audio_full_w,
  input  user_w_mem_8_full_w,
  input  user_w_smb_full_w,
  input  user_w_write_32_full_w,
  input  user_w_write_8_full_w,
  output [3:0] GPIO_LED_w,
  output [31:0] M_AXI_ACP_ARADDR_w,
  output [1:0] M_AXI_ACP_ARBURST_w,
  output [3:0] M_AXI_ACP_ARCACHE_w,
  output [3:0] M_AXI_ACP_ARLEN_w,
  output [2:0] M_AXI_ACP_ARPROT_w,
  output [2:0] M_AXI_ACP_ARSIZE_w,
  output  M_AXI_ACP_ARVALID_w,
  output [31:0] M_AXI_ACP_AWADDR_w,
  output [1:0] M_AXI_ACP_AWBURST_w,
  output [3:0] M_AXI_ACP_AWCACHE_w,
  output [3:0] M_AXI_ACP_AWLEN_w,
  output [2:0] M_AXI_ACP_AWPROT_w,
  output [2:0] M_AXI_ACP_AWSIZE_w,
  output  M_AXI_ACP_AWVALID_w,
  output  M_AXI_ACP_BREADY_w,
  output  M_AXI_ACP_RREADY_w,
  output [63:0] M_AXI_ACP_WDATA_w,
  output  M_AXI_ACP_WLAST_w,
  output [7:0] M_AXI_ACP_WSTRB_w,
  output  M_AXI_ACP_WVALID_w,
  output  S_AXI_ARREADY_w,
  output  S_AXI_AWREADY_w,
  output [1:0] S_AXI_BRESP_w,
  output  S_AXI_BVALID_w,
  output [31:0] S_AXI_RDATA_w,
  output [1:0] S_AXI_RRESP_w,
  output  S_AXI_RVALID_w,
  output  S_AXI_WREADY_w,
  output  host_interrupt_w,
  output  quiesce_w,
  output  user_mem_8_addr_update_w,
  output [4:0] user_mem_8_addr_w,
  output  user_r_audio_open_w,
  output  user_r_audio_rden_w,
  output  user_r_mem_8_open_w,
  output  user_r_mem_8_rden_w,
  output  user_r_read_32_open_w,
  output  user_r_read_32_rden_w,
  output  user_r_read_8_open_w,
  output  user_r_read_8_rden_w,
  output  user_r_smb_open_w,
  output  user_r_smb_rden_w,
  output [31:0] user_w_audio_data_w,
  output  user_w_audio_open_w,
  output  user_w_audio_wren_w,
  output [7:0] user_w_mem_8_data_w,
  output  user_w_mem_8_open_w,
  output  user_w_mem_8_wren_w,
  output [7:0] user_w_smb_data_w,
  output  user_w_smb_open_w,
  output  user_w_smb_wren_w,
  output [31:0] user_w_write_32_data_w,
  output  user_w_write_32_open_w,
  output  user_w_write_32_wren_w,
  output [7:0] user_w_write_8_data_w,
  output  user_w_write_8_open_w,
  output  user_w_write_8_wren_w
);
endmodule
