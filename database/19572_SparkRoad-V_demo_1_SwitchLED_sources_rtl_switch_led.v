// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		���뿪��ʹ�� ���� LED ��ʾ
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
`timescale 1ns / 1ps

module switch_led
(
	input	wire [15:0]		switch,
	output	wire [15:0]		led
);

assign led = switch;

endmodule