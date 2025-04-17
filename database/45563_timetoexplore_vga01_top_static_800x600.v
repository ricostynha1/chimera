// This program was cloned from: https://github.com/WillGreen/timetoexplore
// License: MIT License

// FPGA VGA Graphics Part 1: Top Module (static squares in 800x600)
// (C)2018 Will Green - Licensed under the MIT License
// Learn more at https://timetoexplore.net/blog/arty-fpga-vga-verilog-01

`default_nettype none

module top(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,         // reset button
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B     // 4-bit VGA blue output
    );

    wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    // wire rst = RST_BTN;  // reset is active high on Basys3 (BTNC)

    // generate a 40 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
        {pix_stb, cnt} <= cnt + 16'h6666;  // divide by 2.5: (2^16)/2.5 = 0x6666

    wire [10:0] x;  // current pixel x position: 11-bit value: 0-2047
    wire  [9:0] y;  // current pixel y position: 10-bit value: 0-1023

    vga800x600 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );

    // Six overlapping squares
    wire sq_a, sq_b, sq_c, sq_d, sq_e, sq_f;
    assign sq_a = ((x > 120) & (y >  20) & (x < 280) & (y < 180)) ? 1 : 0;
    assign sq_b = ((x > 200) & (y > 100) & (x < 360) & (y < 260)) ? 1 : 0;
    assign sq_c = ((x > 280) & (y > 180) & (x < 440) & (y < 340)) ? 1 : 0;
    assign sq_d = ((x > 360) & (y > 260) & (x < 520) & (y < 420)) ? 1 : 0;
    assign sq_e = ((x > 440) & (y > 340) & (x < 600) & (y < 500)) ? 1 : 0;
    assign sq_f = ((x > 520) & (y > 420) & (x < 680) & (y < 580)) ? 1 : 0;

    assign VGA_R[3] = sq_b | sq_e;  // squares b and e are red
    assign VGA_G[3] = sq_a | sq_d;  // squares a and d are green
    assign VGA_B[3] = sq_c | sq_f;  // squares c and f are blue
endmodule
