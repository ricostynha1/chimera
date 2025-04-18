// This program was cloned from: https://github.com/olofk/corescore
// License: Apache License 2.0


module CV_96 (
	output q,
	output uart_txd
);

wire clk;		

HPS   u0(
	.h2f_user0_clk( clk)  	//hps_0_h2f_user0_clock.clk
);
	

corescore_chameleon96  u1 (
	.i_clk   ( clk ), 
	.i_rst_n ( 1'b1),
	.q       ( q   ),
	.uart_txd( uart_txd )
);
	  

endmodule






