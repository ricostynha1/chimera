// This program was cloned from: https://github.com/MiSTer-devel/NeoGeo_MiSTer
// License: GNU General Public License v2.0

// NeoGeo logic definition
// Copyright (C) 2018 Sean Gonsalves
// Rewrite to fully synchronous logic by (C) 2023 Gyorgy Szombathelyi
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

// The funny 4-letter names correspond to those on the NEO-B1 die shot trace

module neo_b1(
	input CLK,					// For linebuffers RAM
	input CLK_EN_6MB,			// Pixel clock
	input CLK_EN_1HB,			// 3MHz 2px Even/odd pixel selection
	
	input [23:0] PBUS,		// Used to retrieve LB addresses loads, SPR palette # and FIX palette # from LSPC
	input [7:0] FIXD,			// 2 fix pixels
	input PCK1_EN,
	input PCK2_EN,
	input CHBL,					// Force PA to zeros
	input BNKB,					// For Watchdog and PA
	input [3:0] GAD, GBD,	// 2 sprite pixels
	input [3:0] WE,			// LB writes
	input [3:0] CK,			// LB address counter clocks
	input TMS0,					// LB flip
	input LD1, LD2,			// Load LB addresses
	input SS1, SS2,			// Clearing enable for each LB
	input S1H1,					// 3MHz offset from CLK_1HB
	
	input A23I, A22I,
	output [11:0] PA,			// Palette address bus
	
	input nLDS,					// For watchdog kick
	input RW,
	input nAS,
	input [21:17] M68K_ADDR_U,
	input [12:1] M68K_ADDR_L,
	output nHALT,
	output nRESET,
	input nRST,
	input DOGE,
	
	input EN_FIX
);

	reg nCPU_ACCESS;
	
	reg [7:0] FIXD_REG;
	reg [3:0] FIX_PAL_REG;
	wire [3:0] FIX_COLOR;
	wire [3:0] SPR_COLOR;
	wire [11:0] RAMBL_OUT;
	wire [11:0] RAMBR_OUT;
	wire [11:0] RAMTL_OUT;
	wire [11:0] RAMTR_OUT;
	wire [7:0] SPR_PAL;
	wire [1:0] MUX_BA;
	wire [11:0] PA_MUX_A;
	wire [11:0] PA_MUX_B;
	wire [11:0] RAM_MUX_OUT;
	reg [11:0] PA_VIDEO;

	// 2px fix data reg
	// BEKU AKUR...
	always @(posedge CLK)
		if (CLK_EN_1HB) FIXD_REG <= FIXD;
	
	// Switch between odd/even fix pixel
	// BEVU AWEQ...
	assign FIX_COLOR = S1H1 ? FIXD_REG[7:4] : FIXD_REG[3:0];

	// IDUF
	// EN_FIX gate for Neo CD only
	wire FIX_OPAQUE = |{FIX_COLOR} & EN_FIX;

	// GETU FUCA...
	always @(posedge CLK)
		if (PCK1_EN) FIX_PAL_REG <= PBUS[19:16];

	assign SPR_PAL = PBUS[23:16];
	
	linebuffer RAMBR(CLK, CK[0], WE[0], LD1, SS1, GAD, PCK2_EN, SPR_PAL, PBUS[7:0], RAMBR_OUT);
	linebuffer RAMBL(CLK, CK[1], WE[1], LD1, SS1, GBD, PCK2_EN, SPR_PAL, PBUS[15:8], RAMBL_OUT);
	linebuffer RAMTR(CLK, CK[2], WE[2], LD2, SS2, GAD, PCK2_EN, SPR_PAL, PBUS[7:0], RAMTR_OUT);
	linebuffer RAMTL(CLK, CK[3], WE[3], LD2, SS2, GBD, PCK2_EN, SPR_PAL, PBUS[15:8], RAMTL_OUT);
	
	assign MUX_BA = {TMS0, S1H1};
	
	/*
	assign VORU = S1H1 & TMS0;
	assign VOTO = S1H1 & ~TMS0;
	assign VEZA = ~S1H1 & TMS0;
	assign VOKE = ~S1H1 & ~TMS0;
	*/
	
	// Output buffer select
	// MEGA MAKA MEJU ORUG...
	assign RAM_MUX_OUT = 
							(MUX_BA == 2'b00) ? RAMBR_OUT :
							(MUX_BA == 2'b01) ? RAMBL_OUT :
							(MUX_BA == 2'b10) ? RAMTR_OUT :
							RAMTL_OUT;
	
	// Priority for palette address bus (PA):
	// -CPU over everything else
	// -CHBL (h-blank)
	// -Fix pixel if opaque
	// -Line buffers (sprites) ouput
	
	// CPU palette RAM access decode
	// JAGU JURA...
	always @(posedge CLK) begin
		reg nAS_d;
		nAS_d <= nAS;
		if (!nAS & nAS_d)
			nCPU_ACCESS <= A23I | ~A22I;
	end

	// Fix/Sprite/Blanking select
	// KUQA KUTU JARA...
	assign PA_MUX_A = FIX_OPAQUE ? {4'b0000, FIX_PAL_REG, FIX_COLOR} : RAM_MUX_OUT;
	assign PA_MUX_B = CHBL ? 12'h000 : PA_MUX_A;

	// KAWE KESE...
	always @(posedge CLK)
		if (CLK_EN_6MB) PA_VIDEO <= PA_MUX_B;
	
	// KUTE KENU...
	assign PA = nCPU_ACCESS ? PA_VIDEO : M68K_ADDR_L;


	// Note: nRESET is sync'd to frame start
	watchdog WD(CLK, DOGE, nLDS, RW, A23I, A22I, M68K_ADDR_U, BNKB, nHALT, nRESET, nRST);
	//assign nHALT = 1;
	//assign nRESET = 1;

endmodule
