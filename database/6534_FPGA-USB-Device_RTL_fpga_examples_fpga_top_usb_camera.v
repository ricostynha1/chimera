// This program was cloned from: https://github.com/WangXuan95/FPGA-USB-Device
// License: GNU General Public License v3.0


//--------------------------------------------------------------------------------------------------------
// Module  : fpga_top_usb_camera
// Type    : synthesizable, fpga top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: example for usb_camera_top
//--------------------------------------------------------------------------------------------------------

module fpga_top_usb_camera (
    // clock
    input  wire        clk50mhz,     // connect to a 50MHz oscillator
    // reset button
    input  wire        button,       // connect to a reset button, 0=reset, 1=release. If you don't have a button, tie this signal to 1.
    // LED
    output wire        led,          // 1: USB connected , 0: USB disconnected
    // USB signals
    output wire        usb_dp_pull,  // connect to USB D+ by an 1.5k resistor
    inout              usb_dp,       // connect to USB D+
    inout              usb_dn,       // connect to USB D-
    // debug output info, only for USB developers, can be ignored for normally use
    output wire        uart_tx       // If you want to see the debug info of USB device core, please connect this UART signal to host-PC (UART format: 115200,8,n,1), otherwise you can ignore this signal.
);




//-------------------------------------------------------------------------------------------------------------------------------------
// The USB controller core needs a 60MHz clock, this PLL module is to convert clk50mhz to clk60mhz
// This PLL module is only available on Altera Cyclone IV E.
// If you use other FPGA families, please use their compatible primitives or IP-cores to generate clk60mhz
//-------------------------------------------------------------------------------------------------------------------------------------
wire [3:0] subwire0;
wire       clk60mhz;
wire       clk_locked;
altpll u_altpll (
    .inclk       ( {1'b0, clk50mhz}     ),
    .clk         ( {subwire0, clk60mhz} ),
    .locked      ( clk_locked           ),
    .activeclock (),    .areset (1'b0),    .clkbad (),    .clkena ({6{1'b1}}),    .clkloss (),    .clkswitch (1'b0),    .configupdate (1'b0),    .enable0 (),    .enable1 (),    .extclk (),    .extclkena ({4{1'b1}}),    .fbin (1'b1),    .fbmimicbidir (),    .fbout (),    .fref (),    .icdrclk (),    .pfdena (1'b1),    .phasecounterselect ({4{1'b1}}),    .phasedone (),    .phasestep (1'b1),    .phaseupdown (1'b1),    .pllena (1'b1),    .scanaclr (1'b0),    .scanclk (1'b0),    .scanclkena (1'b1),    .scandata (1'b0),    .scandataout (),    .scandone (),    .scanread (1'b0),    .scanwrite (1'b0),    .sclkout0 (),    .sclkout1 (),    .vcooverrange (),    .vcounderrange () );
defparam u_altpll.bandwidth_type = "AUTO",    u_altpll.clk0_divide_by = 5,    u_altpll.clk0_duty_cycle = 50,    u_altpll.clk0_multiply_by = 6,    u_altpll.clk0_phase_shift = "0",    u_altpll.compensate_clock = "CLK0",    u_altpll.inclk0_input_frequency = 20000,    u_altpll.intended_device_family = "Cyclone IV E",    u_altpll.lpm_hint = "CBX_MODULE_PREFIX=pll",    u_altpll.lpm_type = "altpll",    u_altpll.operation_mode = "NORMAL",    u_altpll.pll_type = "AUTO",    u_altpll.port_activeclock = "PORT_UNUSED",    u_altpll.port_areset = "PORT_UNUSED",    u_altpll.port_clkbad0 = "PORT_UNUSED",    u_altpll.port_clkbad1 = "PORT_UNUSED",    u_altpll.port_clkloss = "PORT_UNUSED",    u_altpll.port_clkswitch = "PORT_UNUSED",    u_altpll.port_configupdate = "PORT_UNUSED",    u_altpll.port_fbin = "PORT_UNUSED",    u_altpll.port_inclk0 = "PORT_USED",    u_altpll.port_inclk1 = "PORT_UNUSED",    u_altpll.port_locked = "PORT_USED",    u_altpll.port_pfdena = "PORT_UNUSED",    u_altpll.port_phasecounterselect = "PORT_UNUSED",    u_altpll.port_phasedone = "PORT_UNUSED",    u_altpll.port_phasestep = "PORT_UNUSED",    u_altpll.port_phaseupdown = "PORT_UNUSED",    u_altpll.port_pllena = "PORT_UNUSED",    u_altpll.port_scanaclr = "PORT_UNUSED",    u_altpll.port_scanclk = "PORT_UNUSED",    u_altpll.port_scanclkena = "PORT_UNUSED",    u_altpll.port_scandata = "PORT_UNUSED",    u_altpll.port_scandataout = "PORT_UNUSED",    u_altpll.port_scandone = "PORT_UNUSED",    u_altpll.port_scanread = "PORT_UNUSED",    u_altpll.port_scanwrite = "PORT_UNUSED",    u_altpll.port_clk0 = "PORT_USED",    u_altpll.port_clk1 = "PORT_UNUSED",    u_altpll.port_clk2 = "PORT_UNUSED",    u_altpll.port_clk3 = "PORT_UNUSED",    u_altpll.port_clk4 = "PORT_UNUSED",    u_altpll.port_clk5 = "PORT_UNUSED",    u_altpll.port_clkena0 = "PORT_UNUSED",    u_altpll.port_clkena1 = "PORT_UNUSED",    u_altpll.port_clkena2 = "PORT_UNUSED",    u_altpll.port_clkena3 = "PORT_UNUSED",    u_altpll.port_clkena4 = "PORT_UNUSED",    u_altpll.port_clkena5 = "PORT_UNUSED",    u_altpll.port_extclk0 = "PORT_UNUSED",    u_altpll.port_extclk1 = "PORT_UNUSED",    u_altpll.port_extclk2 = "PORT_UNUSED",    u_altpll.port_extclk3 = "PORT_UNUSED",    u_altpll.self_reset_on_loss_lock = "OFF",    u_altpll.width_clock = 5;




//-------------------------------------------------------------------------------------------------------------------------------------
// USB-UVC camera device
//-------------------------------------------------------------------------------------------------------------------------------------

wire        vf_sof;
wire        vf_req;
reg  [ 7:0] vf_byte;

usb_camera_top #(
    .FRAME_TYPE      ( "MONO"              ),   // "MONO" or "YUY2"
    .FRAME_W         ( 14'd252             ),   // video-frame width  in pixels, must be a even number
    .FRAME_H         ( 14'd120             ),   // video-frame height in pixels, must be a even number
    .DEBUG           ( "FALSE"             )    // If you want to see the debug info of USB device core, set this parameter to "TRUE"
) u_usb_camera (
    .rstn            ( clk_locked & button ),
    .clk             ( clk60mhz            ),
    // USB signals
    .usb_dp_pull     ( usb_dp_pull         ),
    .usb_dp          ( usb_dp              ),
    .usb_dn          ( usb_dn              ),
    // USB reset output
    .usb_rstn        ( led                 ),   // 1: connected , 0: disconnected (when USB cable unplug, or when system reset (rstn=0))
    // video frame fetch interface
    .vf_sof          ( vf_sof              ),
    .vf_req          ( vf_req              ),
    .vf_byte         ( vf_byte             ),
    // debug output info, only for USB developers, can be ignored for normally use
    .debug_en        (                     ),
    .debug_data      (                     ),
    .debug_uart_tx   ( uart_tx             )
);




//-------------------------------------------------------------------------------------------------------------------------------------
// generate pixels
//-------------------------------------------------------------------------------------------------------------------------------------
reg  [7:0] init_pixel = 8'h00;

always @ (posedge clk60mhz)
    if (vf_sof) begin                          // at start of frame
        init_pixel <= init_pixel + 8'h1;
        vf_byte <= init_pixel;
    end else if (vf_req) begin                 // request a pixel
        vf_byte <= vf_byte + 8'h1;
    end



endmodule
