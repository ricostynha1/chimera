// This program was cloned from: https://github.com/WangXuan95/FPGA-ftdi245fifo
// License: GNU General Public License v3.0


//--------------------------------------------------------------------------------------------------------
// Module  : axi_stream_assert
// Type    : simulation only (will be ingnored by synthesizer)
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: assert whether a AXI-stream interface follows the AXI-stream standards
//           see AMBA 4 AXI4-stream Protocol Version: 1.0 Specification 
//--------------------------------------------------------------------------------------------------------

module axi_stream_assert #(
    parameter   NAME                                           = "",
    parameter   BW                                             = 4,    // data byte-width, e.g., 4 means 4-byte-width (32-bit)
    parameter   ASSERT_MASTER_NOT_Z_OR_X                       = 1,
    parameter   ASSERT_SLAVE_NOT_Z_OR_X                        = 1,
    parameter   ASSERT_MASTER_NOT_CHANGE_WHEN_HANDSHAKE_FAILED = 1,
    parameter   ASSERT_SLAVE_NOT_CHANGE_WHEN_HANDSHAKE_FAILED  = 0,
    parameter   ASSERT_PACKED                                  = 0
) (
    input  wire            clk,
    input  wire            tready,
    input  wire            tvalid,
    input  wire [8*BW-1:0] tdata,
    input  wire [  BW-1:0] tkeep,
    input  wire            tlast
);


localparam [8*BW-1:0] TDATA_ALL_ZERO = 0;
localparam [  BW-1:0] TKEEP_ALL_ZERO = 0;
localparam [  BW-1:0] TKEEP_ALL_ONE  = ~TKEEP_ALL_ZERO;


reg             tready_d = 1'b0;
reg             tvalid_d = 1'b0;
reg  [8*BW-1:0] tdata_d  = TDATA_ALL_ZERO;
reg  [  BW-1:0] tkeep_d  = TKEEP_ALL_ZERO;
reg             tlast_d  = 1'b0;


always @ (posedge clk) begin
    tready_d <= tready;
    tvalid_d <= tvalid;
    tdata_d  <= tdata;
    tkeep_d  <= tkeep;
    tlast_d  <= tlast;
end


generate if (ASSERT_SLAVE_NOT_Z_OR_X) begin
    always @ (posedge clk) begin
        if     (tready  ===1'bz || tready  ===1'bx) begin $display("*** error : %s AXI-stream tready = X or Z", NAME); $finish; end
    end
end endgenerate


generate if (ASSERT_MASTER_NOT_Z_OR_X) begin
    always @ (posedge clk) begin
        if     (tvalid  ===1'bz || tvalid  ===1'bx) begin $display("*** error : %s AXI-stream tvalid = X or Z", NAME); $finish; end
        if     (tvalid) begin
            if ((&tdata)===1'bz || (&tdata)===1'bx) begin $display("*** error : %s AXI-stream tdata = X or Z", NAME); $finish; end
            if ((&tkeep)===1'bz || (&tkeep)===1'bx) begin $display("*** error : %s AXI-stream tdata = X or Z", NAME); $finish; end
            if ((&tlast)===1'bz || (&tlast)===1'bx) begin $display("*** error : %s AXI-stream tdata = X or Z", NAME); $finish; end
        end
    end
end endgenerate


generate if (ASSERT_MASTER_NOT_CHANGE_WHEN_HANDSHAKE_FAILED) begin
    always @ (posedge clk)
        if ((~tready_d) & tvalid_d) begin         // At last cycle, sender sended a data, but receiver not avaiable, assert that sender is still sending a data at this cycle, and assert that data not change
            if (   1'b1 !== tvalid) begin $display("*** error : %s AXI-stream sender behavior abnormal : Illegal withdraw tvalid", NAME); $finish; end
            if (tdata_d !== tdata ) begin $display("*** error : %s AXI-stream sender behavior abnormal : Illegal change of tdata", NAME); $finish; end
            if (tlast_d !== tlast ) begin $display("*** error : %s AXI-stream sender behavior abnormal : Illegal change of tlast", NAME); $finish; end
            if (tkeep_d !== tkeep ) begin $display("*** error : %s AXI-stream sender behavior abnormal : Illegal change of tkeep", NAME); $finish; end
        end
end endgenerate


generate if (ASSERT_SLAVE_NOT_CHANGE_WHEN_HANDSHAKE_FAILED) begin
    always @ (posedge clk)
        if (tready_d & (~tvalid_d)) begin         // At last cycle, receiver avaiable, but sender not sended a data, assert that receiver is still avaiable at this cycle
            if (1'b1 !== tready) begin $display("*** error : %s AXI-stream receiver behavior abnormal : Illegal withdraw tready", NAME); $finish; end
        end
end endgenerate


generate if (ASSERT_PACKED) begin
    integer i;
    reg     has_zero;
    always @ (posedge clk)
        if (tvalid) begin
            if (~tlast) begin
                if (tkeep !== TKEEP_ALL_ONE) begin $display("*** error : %s AXI-stream not packing", NAME); $finish; end
            end else begin
                has_zero = 1'b0;
                for (i=0; i<BW; i=i+1) begin
                    if (tkeep[i] == 1'b0)
                        has_zero = 1'b1;
                    if (has_zero & tkeep[i]) begin $display("*** error : %s AXI-stream not packing, tkeep=%b", NAME, tkeep); $finish; end
                end
                if (tkeep == 0)              begin $display("*** error : %s AXI-stream not packing, tkeep=0", NAME); $finish; end
            end
        end
end endgenerate


endmodule
