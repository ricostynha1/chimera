// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

// -----------------------------------------------------------------------------
// Auto-Generated by:        __   _ __      _  __
//                          / /  (_) /____ | |/_/
//                         / /__/ / __/ -_)>  <
//                        /____/_/\__/\__/_/|_|
//                     Build your hardware, easily!
//                   https://github.com/enjoy-digital/litex
//
// Filename   : regfifo.v
// Device     : generic
// LiteX sha1 : 9b4f6007
// Date       : 2024-03-03 00:01:16
//------------------------------------------------------------------------------

`timescale 1ns / 1ps

//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------

module regfifo (
    input  wire          reset,
    input  wire          aclk,
    input  wire   [31:0] wdata,
    input  wire          we,
    output wire          writable,
    input  wire          re,
    output wire          readable,
    output wire   [31:0] rdata,
    output wire    [3:0] level
);


//------------------------------------------------------------------------------
// Signals
//------------------------------------------------------------------------------

wire          aclk_clk;
wire          aclk_rst;
wire          re_1;
reg           readable_1;
wire          syncfifo_we;
wire          syncfifo_writable;
wire          syncfifo_re;
wire          syncfifo_readable;
wire   [31:0] syncfifo_din;
wire   [31:0] syncfifo_dout;
reg     [3:0] level0;
reg           replace;
reg     [2:0] produce;
reg     [2:0] consume;
reg     [2:0] wrport_adr;
wire   [31:0] wrport_dat_r;
wire          wrport_we;
wire   [31:0] wrport_dat_w;
wire          do_read;
wire    [2:0] rdport_adr;
wire   [31:0] rdport_dat_r;
wire          rdport_re;
wire    [3:0] level1;

//------------------------------------------------------------------------------
// Combinatorial Logic
//------------------------------------------------------------------------------

assign aclk_clk = aclk;
assign aclk_rst = reset;
assign syncfifo_din = wdata;
assign syncfifo_we = we;
assign writable = syncfifo_writable;
assign rdata = syncfifo_dout;
assign re_1 = re;
assign readable = readable_1;
assign level = level1;
assign syncfifo_re = (syncfifo_readable & ((~readable_1) | re_1));
assign level1 = (level0 + readable_1);
always @(*) begin
    wrport_adr <= 3'd0;
    if (replace) begin
        wrport_adr <= (produce - 1'd1);
    end else begin
        wrport_adr <= produce;
    end
end
assign wrport_dat_w = syncfifo_din;
assign wrport_we = (syncfifo_we & (syncfifo_writable | replace));
assign do_read = (syncfifo_readable & syncfifo_re);
assign rdport_adr = consume;
assign syncfifo_dout = rdport_dat_r;
assign rdport_re = do_read;
assign syncfifo_writable = (level0 != 4'd8);
assign syncfifo_readable = (level0 != 1'd0);


//------------------------------------------------------------------------------
// Synchronous Logic
//------------------------------------------------------------------------------

always @(posedge aclk_clk) begin
    if (syncfifo_re) begin
        readable_1 <= 1'd1;
    end else begin
        if (re_1) begin
            readable_1 <= 1'd0;
        end
    end
    if (((syncfifo_we & syncfifo_writable) & (~replace))) begin
        produce <= (produce + 1'd1);
    end
    if (do_read) begin
        consume <= (consume + 1'd1);
    end
    if (((syncfifo_we & syncfifo_writable) & (~replace))) begin
        if ((~do_read)) begin
            level0 <= (level0 + 1'd1);
        end
    end else begin
        if (do_read) begin
            level0 <= (level0 - 1'd1);
        end
    end
    if (aclk_rst) begin
        readable_1 <= 1'd0;
        level0 <= 4'd0;
        produce <= 3'd0;
        consume <= 3'd0;
    end
end


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Memory storage: 8-words x 32-bit
//------------------------------------------------------------------------------
// Port 0 | Read: Sync  | Write: Sync | Mode: Read-First  | Write-Granularity: 32
// Port 1 | Read: Sync  | Write: ---- |
reg [31:0] storage[0:7];
reg [31:0] storage_dat0;
reg [31:0] storage_dat1;
always @(posedge aclk_clk) begin
	if (wrport_we)
		storage[wrport_adr] <= wrport_dat_w;
	storage_dat0 <= storage[wrport_adr];
end
always @(posedge aclk_clk) begin
	if (rdport_re)
		storage_dat1 <= storage[rdport_adr];
end
assign wrport_dat_r = storage_dat0;
assign rdport_dat_r = storage_dat1;


endmodule

// -----------------------------------------------------------------------------
//  Auto-Generated by LiteX on 2024-03-03 00:01:16.
//------------------------------------------------------------------------------
