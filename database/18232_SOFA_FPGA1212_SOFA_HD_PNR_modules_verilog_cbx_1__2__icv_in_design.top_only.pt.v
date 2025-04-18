// This program was cloned from: https://github.com/lnis-uofu/SOFA
// License: MIT License

//
//
//
//
//
//
module cbx_1__2_ ( chanx_left_in , chanx_right_in , ccff_head , 
    chanx_left_out , chanx_right_out , top_grid_pin_0_ , bottom_grid_pin_0_ , 
    bottom_grid_pin_1_ , bottom_grid_pin_2_ , bottom_grid_pin_3_ , 
    bottom_grid_pin_4_ , bottom_grid_pin_5_ , bottom_grid_pin_6_ , 
    bottom_grid_pin_7_ , bottom_grid_pin_8_ , bottom_grid_pin_9_ , 
    bottom_grid_pin_10_ , bottom_grid_pin_11_ , bottom_grid_pin_12_ , 
    bottom_grid_pin_13_ , bottom_grid_pin_14_ , bottom_grid_pin_15_ , 
    ccff_tail , IO_ISOL_N , gfpga_pad_EMBEDDED_IO_HD_SOC_IN , 
    gfpga_pad_EMBEDDED_IO_HD_SOC_OUT , gfpga_pad_EMBEDDED_IO_HD_SOC_DIR , 
    bottom_width_0_height_0__pin_0_ , bottom_width_0_height_0__pin_1_upper , 
    bottom_width_0_height_0__pin_1_lower , SC_IN_TOP , SC_OUT_BOT , 
    SC_IN_BOT , SC_OUT_TOP , prog_clk_0_S_in , prog_clk_0_W_out ) ;
input  [0:19] chanx_left_in ;
input  [0:19] chanx_right_in ;
input  [0:0] ccff_head ;
output [0:19] chanx_left_out ;
output [0:19] chanx_right_out ;
output [0:0] top_grid_pin_0_ ;
output [0:0] bottom_grid_pin_0_ ;
output [0:0] bottom_grid_pin_1_ ;
output [0:0] bottom_grid_pin_2_ ;
output [0:0] bottom_grid_pin_3_ ;
output [0:0] bottom_grid_pin_4_ ;
output [0:0] bottom_grid_pin_5_ ;
output [0:0] bottom_grid_pin_6_ ;
output [0:0] bottom_grid_pin_7_ ;
output [0:0] bottom_grid_pin_8_ ;
output [0:0] bottom_grid_pin_9_ ;
output [0:0] bottom_grid_pin_10_ ;
output [0:0] bottom_grid_pin_11_ ;
output [0:0] bottom_grid_pin_12_ ;
output [0:0] bottom_grid_pin_13_ ;
output [0:0] bottom_grid_pin_14_ ;
output [0:0] bottom_grid_pin_15_ ;
output [0:0] ccff_tail ;
input  [0:0] IO_ISOL_N ;
input  [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_IN ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ;
input  [0:0] bottom_width_0_height_0__pin_0_ ;
output [0:0] bottom_width_0_height_0__pin_1_upper ;
output [0:0] bottom_width_0_height_0__pin_1_lower ;
input  SC_IN_TOP ;
output SC_OUT_BOT ;
input  SC_IN_BOT ;
output SC_OUT_TOP ;
input  prog_clk_0_S_in ;
output prog_clk_0_W_out ;

wire [0:0] prog_clk ;
wire prog_clk_0 ;
wire [0:3] mux_tree_tapbuf_size10_0_sram ;
wire [0:3] mux_tree_tapbuf_size10_1_sram ;
wire [0:3] mux_tree_tapbuf_size10_2_sram ;
wire [0:3] mux_tree_tapbuf_size10_3_sram ;
wire [0:3] mux_tree_tapbuf_size10_4_sram ;
wire [0:3] mux_tree_tapbuf_size10_5_sram ;
wire [0:3] mux_tree_tapbuf_size10_6_sram ;
wire [0:3] mux_tree_tapbuf_size10_7_sram ;
wire [0:3] mux_tree_tapbuf_size10_8_sram ;
wire [0:0] mux_tree_tapbuf_size10_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_3_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_4_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_5_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_6_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_7_ccff_tail ;
wire [0:3] mux_tree_tapbuf_size8_0_sram ;
wire [0:3] mux_tree_tapbuf_size8_1_sram ;
wire [0:3] mux_tree_tapbuf_size8_2_sram ;
wire [0:3] mux_tree_tapbuf_size8_3_sram ;
wire [0:3] mux_tree_tapbuf_size8_4_sram ;
wire [0:3] mux_tree_tapbuf_size8_5_sram ;
wire [0:3] mux_tree_tapbuf_size8_6_sram ;
wire [0:3] mux_tree_tapbuf_size8_7_sram ;
wire [0:0] mux_tree_tapbuf_size8_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_3_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_4_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_5_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_6_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_7_ccff_tail ;

assign prog_clk_0 = prog_clk[0] ;

cbx_1__2__mux_tree_tapbuf_size10_0 mux_bottom_ipin_0 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[4] , chanx_left_out[4] , 
        chanx_right_out[10] , chanx_left_out[10] , chanx_right_out[16] , 
        chanx_left_out[16] } ) ,
    .sram ( mux_tree_tapbuf_size10_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_1 , SYNOPSYS_UNCONNECTED_2 , 
        SYNOPSYS_UNCONNECTED_3 , SYNOPSYS_UNCONNECTED_4 } ) ,
    .out ( top_grid_pin_0_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_1 mux_top_ipin_0 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[5] , chanx_left_out[5] , 
        chanx_right_out[11] , chanx_left_out[11] , chanx_right_out[17] , 
        chanx_left_out[17] } ) ,
    .sram ( mux_tree_tapbuf_size10_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_5 , SYNOPSYS_UNCONNECTED_6 , 
        SYNOPSYS_UNCONNECTED_7 , SYNOPSYS_UNCONNECTED_8 } ) ,
    .out ( bottom_grid_pin_0_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_2 mux_top_ipin_3 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[4] , chanx_left_out[4] , 
        chanx_right_out[8] , chanx_left_out[8] , chanx_right_out[14] , 
        chanx_left_out[14] } ) ,
    .sram ( mux_tree_tapbuf_size10_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_9 , SYNOPSYS_UNCONNECTED_10 , 
        SYNOPSYS_UNCONNECTED_11 , SYNOPSYS_UNCONNECTED_12 } ) ,
    .out ( bottom_grid_pin_3_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_3 mux_top_ipin_4 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[5] , chanx_left_out[5] , 
        chanx_right_out[9] , chanx_left_out[9] , chanx_right_out[15] , 
        chanx_left_out[15] } ) ,
    .sram ( mux_tree_tapbuf_size10_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_13 , SYNOPSYS_UNCONNECTED_14 , 
        SYNOPSYS_UNCONNECTED_15 , SYNOPSYS_UNCONNECTED_16 } ) ,
    .out ( bottom_grid_pin_4_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_4 mux_top_ipin_7 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[8] , chanx_left_out[8] , 
        chanx_right_out[12] , chanx_left_out[12] , chanx_right_out[18] , 
        chanx_left_out[18] } ) ,
    .sram ( mux_tree_tapbuf_size10_4_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_17 , SYNOPSYS_UNCONNECTED_18 , 
        SYNOPSYS_UNCONNECTED_19 , SYNOPSYS_UNCONNECTED_20 } ) ,
    .out ( bottom_grid_pin_7_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_5 mux_top_ipin_8 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[9] , chanx_left_out[9] , 
        chanx_right_out[13] , chanx_left_out[13] , chanx_right_out[19] , 
        chanx_left_out[19] } ) ,
    .sram ( mux_tree_tapbuf_size10_5_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_21 , SYNOPSYS_UNCONNECTED_22 , 
        SYNOPSYS_UNCONNECTED_23 , SYNOPSYS_UNCONNECTED_24 } ) ,
    .out ( bottom_grid_pin_8_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_6 mux_top_ipin_11 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[6] , chanx_left_out[6] , 
        chanx_right_out[12] , chanx_left_out[12] , chanx_right_out[16] , 
        chanx_left_out[16] } ) ,
    .sram ( mux_tree_tapbuf_size10_6_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_25 , SYNOPSYS_UNCONNECTED_26 , 
        SYNOPSYS_UNCONNECTED_27 , SYNOPSYS_UNCONNECTED_28 } ) ,
    .out ( bottom_grid_pin_11_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_7 mux_top_ipin_12 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[7] , chanx_left_out[7] , 
        chanx_right_out[13] , chanx_left_out[13] , chanx_right_out[17] , 
        chanx_left_out[17] } ) ,
    .sram ( mux_tree_tapbuf_size10_7_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_29 , SYNOPSYS_UNCONNECTED_30 , 
        SYNOPSYS_UNCONNECTED_31 , SYNOPSYS_UNCONNECTED_32 } ) ,
    .out ( bottom_grid_pin_12_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10 mux_top_ipin_15 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[4] , chanx_left_out[4] , 
        chanx_right_out[10] , chanx_left_out[10] , chanx_right_out[16] , 
        chanx_left_out[16] } ) ,
    .sram ( mux_tree_tapbuf_size10_8_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_33 , SYNOPSYS_UNCONNECTED_34 , 
        SYNOPSYS_UNCONNECTED_35 , SYNOPSYS_UNCONNECTED_36 } ) ,
    .out ( bottom_grid_pin_15_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_0 mem_bottom_ipin_0 ( 
    .prog_clk ( prog_clk ) , .ccff_head ( ccff_head ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_0_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_1 mem_top_ipin_0 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_1_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_2 mem_top_ipin_3 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_2_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_3 mem_top_ipin_4 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_3_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_4 mem_top_ipin_7 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_4_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_4_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_5 mem_top_ipin_8 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_4_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_5_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_5_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_6 mem_top_ipin_11 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_5_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_6_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_6_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem_7 mem_top_ipin_12 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_6_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_7_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_7_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size10_mem mem_top_ipin_15 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_7_ccff_tail ) ,
    .ccff_tail ( { ccff_tail_mid } ) ,
    .mem_out ( mux_tree_tapbuf_size10_8_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_0 mux_top_ipin_1 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[6] , chanx_left_out[6] , 
        chanx_right_out[14] , chanx_left_out[14] } ) ,
    .sram ( mux_tree_tapbuf_size8_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_37 , SYNOPSYS_UNCONNECTED_38 , 
        SYNOPSYS_UNCONNECTED_39 , SYNOPSYS_UNCONNECTED_40 } ) ,
    .out ( bottom_grid_pin_1_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_1 mux_top_ipin_2 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[7] , chanx_left_out[7] , 
        chanx_right_out[15] , chanx_left_out[15] } ) ,
    .sram ( mux_tree_tapbuf_size8_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_41 , SYNOPSYS_UNCONNECTED_42 , 
        SYNOPSYS_UNCONNECTED_43 , SYNOPSYS_UNCONNECTED_44 } ) ,
    .out ( bottom_grid_pin_2_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_2 mux_top_ipin_5 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[10] , chanx_left_out[10] , 
        chanx_right_out[18] , chanx_left_out[18] } ) ,
    .sram ( mux_tree_tapbuf_size8_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_45 , SYNOPSYS_UNCONNECTED_46 , 
        SYNOPSYS_UNCONNECTED_47 , SYNOPSYS_UNCONNECTED_48 } ) ,
    .out ( bottom_grid_pin_5_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_3 mux_top_ipin_6 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[11] , chanx_left_out[11] , 
        chanx_right_out[19] , chanx_left_out[19] } ) ,
    .sram ( mux_tree_tapbuf_size8_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_49 , SYNOPSYS_UNCONNECTED_50 , 
        SYNOPSYS_UNCONNECTED_51 , SYNOPSYS_UNCONNECTED_52 } ) ,
    .out ( bottom_grid_pin_6_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_4 mux_top_ipin_9 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[6] , chanx_left_out[6] , 
        chanx_right_out[14] , chanx_left_out[14] } ) ,
    .sram ( mux_tree_tapbuf_size8_4_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_53 , SYNOPSYS_UNCONNECTED_54 , 
        SYNOPSYS_UNCONNECTED_55 , SYNOPSYS_UNCONNECTED_56 } ) ,
    .out ( bottom_grid_pin_9_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_5 mux_top_ipin_10 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[7] , chanx_left_out[7] , 
        chanx_right_out[15] , chanx_left_out[15] } ) ,
    .sram ( mux_tree_tapbuf_size8_5_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_57 , SYNOPSYS_UNCONNECTED_58 , 
        SYNOPSYS_UNCONNECTED_59 , SYNOPSYS_UNCONNECTED_60 } ) ,
    .out ( bottom_grid_pin_10_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_6 mux_top_ipin_13 (
    .in ( { chanx_right_out[0] , chanx_left_out[0] , chanx_right_out[2] , 
        chanx_left_out[2] , chanx_right_out[10] , chanx_left_out[10] , 
        chanx_right_out[18] , chanx_left_out[18] } ) ,
    .sram ( mux_tree_tapbuf_size8_6_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_61 , SYNOPSYS_UNCONNECTED_62 , 
        SYNOPSYS_UNCONNECTED_63 , SYNOPSYS_UNCONNECTED_64 } ) ,
    .out ( bottom_grid_pin_13_ ) , .p0 ( optlc_net_73 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8 mux_top_ipin_14 (
    .in ( { chanx_right_out[1] , chanx_left_out[1] , chanx_right_out[3] , 
        chanx_left_out[3] , chanx_right_out[11] , chanx_left_out[11] , 
        chanx_right_out[19] , chanx_left_out[19] } ) ,
    .sram ( mux_tree_tapbuf_size8_7_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_65 , SYNOPSYS_UNCONNECTED_66 , 
        SYNOPSYS_UNCONNECTED_67 , SYNOPSYS_UNCONNECTED_68 } ) ,
    .out ( bottom_grid_pin_14_ ) , .p0 ( optlc_net_72 ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem_0 mem_top_ipin_1 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_0_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem_1 mem_top_ipin_2 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_1_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem_2 mem_top_ipin_5 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_2_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem_3 mem_top_ipin_6 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_3_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem_4 mem_top_ipin_9 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_5_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_4_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_4_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem_5 mem_top_ipin_10 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_4_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_5_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_5_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem_6 mem_top_ipin_13 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_7_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_6_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_6_sram ) ) ;
cbx_1__2__mux_tree_tapbuf_size8_mem mem_top_ipin_14 ( .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_6_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_7_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_7_sram ) ) ;
cbx_1__2__logical_tile_io_mode_io_ logical_tile_io_mode_io__0 ( 
    .IO_ISOL_N ( IO_ISOL_N ) , .prog_clk ( prog_clk ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_IN ( gfpga_pad_EMBEDDED_IO_HD_SOC_IN ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ( gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ( gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ) , 
    .io_outpad ( bottom_width_0_height_0__pin_0_ ) ,
    .ccff_head ( { ccff_tail_mid } ) ,
    .io_inpad ( bottom_width_0_height_0__pin_1_lower ) , 
    .ccff_tail ( ccff_tail ) ) ;
sky130_fd_sc_hd__buf_1 prog_clk_0_FTB00 ( .A ( prog_clk_0_S_in ) , 
    .X ( prog_clk[0] ) ) ;
sky130_fd_sc_hd__clkbuf_1 prog_clk_0_W_FTB01 ( .A ( prog_clk_0_S_in ) , 
    .X ( ctsbuf_net_174 ) ) ;
sky130_fd_sc_hd__buf_8 FTB_19__18 ( .A ( chanx_left_in[0] ) , 
    .X ( chanx_right_out[0] ) ) ;
sky130_fd_sc_hd__buf_12 FTB_20__19 ( .A ( chanx_left_in[1] ) , 
    .X ( chanx_right_out[1] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_21__20 ( .A ( chanx_left_in[2] ) , 
    .X ( chanx_right_out[2] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_22__21 ( .A ( chanx_left_in[3] ) , 
    .X ( chanx_right_out[3] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_23__22 ( .A ( chanx_left_in[4] ) , 
    .X ( chanx_right_out[4] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_24__23 ( .A ( chanx_left_in[5] ) , 
    .X ( chanx_right_out[5] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_25__24 ( .A ( chanx_left_in[6] ) , 
    .X ( chanx_right_out[6] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_26__25 ( .A ( chanx_left_in[7] ) , 
    .X ( chanx_right_out[7] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_27__26 ( .A ( chanx_left_in[8] ) , 
    .X ( chanx_right_out[8] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_28__27 ( .A ( chanx_left_in[9] ) , 
    .X ( chanx_right_out[9] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_29__28 ( .A ( chanx_left_in[10] ) , 
    .X ( chanx_right_out[10] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_30__29 ( .A ( chanx_left_in[11] ) , 
    .X ( chanx_right_out[11] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_31__30 ( .A ( chanx_left_in[12] ) , 
    .X ( chanx_right_out[12] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_32__31 ( .A ( chanx_left_in[13] ) , 
    .X ( chanx_right_out[13] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_33__32 ( .A ( chanx_left_in[14] ) , 
    .X ( chanx_right_out[14] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_34__33 ( .A ( chanx_left_in[15] ) , 
    .X ( chanx_right_out[15] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_35__34 ( .A ( chanx_left_in[16] ) , 
    .X ( chanx_right_out[16] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_36__35 ( .A ( chanx_left_in[17] ) , 
    .X ( chanx_right_out[17] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_37__36 ( .A ( chanx_left_in[18] ) , 
    .X ( chanx_right_out[18] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_38__37 ( .A ( chanx_left_in[19] ) , 
    .X ( chanx_right_out[19] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_39__38 ( .A ( chanx_right_in[0] ) , 
    .X ( chanx_left_out[0] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_40__39 ( .A ( chanx_right_in[1] ) , 
    .X ( chanx_left_out[1] ) ) ;
sky130_fd_sc_hd__buf_12 FTB_41__40 ( .A ( chanx_right_in[2] ) , 
    .X ( chanx_left_out[2] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_42__41 ( .A ( chanx_right_in[3] ) , 
    .X ( chanx_left_out[3] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_43__42 ( .A ( chanx_right_in[4] ) , 
    .X ( chanx_left_out[4] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_44__43 ( .A ( chanx_right_in[5] ) , 
    .X ( chanx_left_out[5] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_45__44 ( .A ( chanx_right_in[6] ) , 
    .X ( chanx_left_out[6] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_46__45 ( .A ( chanx_right_in[7] ) , 
    .X ( chanx_left_out[7] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_47__46 ( .A ( chanx_right_in[8] ) , 
    .X ( chanx_left_out[8] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_48__47 ( .A ( chanx_right_in[9] ) , 
    .X ( chanx_left_out[9] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_49__48 ( .A ( chanx_right_in[10] ) , 
    .X ( chanx_left_out[10] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_50__49 ( .A ( chanx_right_in[11] ) , 
    .X ( chanx_left_out[11] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_51__50 ( .A ( chanx_right_in[12] ) , 
    .X ( chanx_left_out[12] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_52__51 ( .A ( chanx_right_in[13] ) , 
    .X ( chanx_left_out[13] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_53__52 ( .A ( chanx_right_in[14] ) , 
    .X ( chanx_left_out[14] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_54__53 ( .A ( chanx_right_in[15] ) , 
    .X ( chanx_left_out[15] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_55__54 ( .A ( chanx_right_in[16] ) , 
    .X ( chanx_left_out[16] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_56__55 ( .A ( chanx_right_in[17] ) , 
    .X ( chanx_left_out[17] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_57__56 ( .A ( chanx_right_in[18] ) , 
    .X ( chanx_left_out[18] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_58__57 ( .A ( chanx_right_in[19] ) , 
    .X ( chanx_left_out[19] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_59__58 ( 
    .A ( bottom_width_0_height_0__pin_1_lower[0] ) , 
    .X ( bottom_width_0_height_0__pin_1_upper[0] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_60__59 ( .A ( SC_IN_TOP ) , .X ( SC_OUT_BOT ) ) ;
sky130_fd_sc_hd__buf_6 FTB_61__60 ( .A ( SC_IN_BOT ) , .X ( SC_OUT_TOP ) ) ;
sky130_fd_sc_hd__conb_1 optlc_74 ( .LO ( SYNOPSYS_UNCONNECTED_69 ) , 
    .HI ( optlc_net_72 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_76 ( .LO ( SYNOPSYS_UNCONNECTED_70 ) , 
    .HI ( optlc_net_73 ) ) ;
sky130_fd_sc_hd__buf_6 cts_buf_3521203 ( .A ( ctsbuf_net_174 ) , 
    .X ( prog_clk_0_W_out ) ) ;
endmodule


