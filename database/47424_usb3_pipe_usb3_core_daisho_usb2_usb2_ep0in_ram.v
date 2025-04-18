// This program was cloned from: https://github.com/enjoy-digital/usb3_pipe
// License: BSD 2-Clause "Simplified" License

// 64x8b ram (1 write / 1 read / 1 clock)
// read latency: 2 clocks

module usb2_ep0in_ram(
	input clk,
	input wr_we,
	input [5:0] wr_adr,
	input [7:0] wr_dat_w,
	input [5:0] rd_adr,
	output reg [7:0] rd_dat_r

);

reg [7:0] mem[0:63];
reg [5:0] rd_adr_i;
always @(posedge clk) begin
	if (wr_we)
		mem[wr_adr] <= wr_dat_w;
end

always @(posedge clk) begin
	rd_adr_i <= rd_adr;
	rd_dat_r = mem[rd_adr_i];
end

endmodule
