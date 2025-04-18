// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

// NeoGeo logic definition (simulation only)
// Copyright (C) 2018 Sean Gonsalves
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

`timescale 1ns/1ns

module irq(
	input WR_ACK,
	input [2:0] ACK_BITS,
	input RESET_IRQ,
	input TIMER_IRQ,
	input VBL_IRQ,
	input CLK,
	output IPL0, IPL1
);

	wire [2:0] ACK;
	wire [3:0] B32_Q;
	
	assign nWR_ACK = ~WR_ACK;

	assign ACK[0] = ~&{nWR_ACK, ACK_BITS[0]};
	assign ACK[1] = ~&{nWR_ACK, ACK_BITS[1]};
	assign ACK[2] = ~&{nWR_ACK, ACK_BITS[2]};
	
	FD3 B56(RESET_IRQ, 1'b0, ACK[0], B56_Q, B56_nQ);
	FD3 B52(TIMER_IRQ, 1'b0, ACK[1], B52_Q, B52_nQ);
	FD3 C52(VBL_IRQ, 1'b0, ACK[2], C52_Q, );
	
	// B49
	assign B49_OUT = B52_Q | B56_nQ;
	
	// B50A
	assign B50A_OUT = ~|{C52_Q, B56_nQ, B52_nQ};
	
	FDSCell B32(CLK, {1'b0, B50A_OUT, B49_OUT, B56_Q}, B32_Q);
	
	assign IPL0 = ~|{~B32_Q[0], B32_Q[2]};
	assign IPL1 = ~|{~B32_Q[1], ~B32_Q[0]};
	
	// Interrupt priority encoder (is priority right ?)
	// IRQ  IPL
	// xx1: 000 Reset IRQ
	// x10: 001 Timer IRQ
	// 100: 010 VBL IRQ
	// 000: 011 No interrupt

endmodule
