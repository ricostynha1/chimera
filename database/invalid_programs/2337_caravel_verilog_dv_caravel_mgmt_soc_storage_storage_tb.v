// This program was cloned from: https://github.com/efabless/caravel
// License: Apache License 2.0

`default_nettype none
/*
 *  SPDX-FileCopyrightText: 2017  Clifford Wolf, 2018  Tim Edwards
 *
 *  StriVe - A full example SoC using PicoRV32 in SkyWater s8
 *
 *  Copyright (C) 2017  Clifford Wolf <clifford@clifford.at>
 *  Copyright (C) 2018  Tim Edwards <tim@efabless.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *  SPDX-License-Identifier: ISC
 */

`timescale 1 ns / 1 ps

`include "__uprj_netlists.v"
`include "caravel_netlists.v"
`include "spiflash.v"

module storage_tb;
	reg clock;
	reg RSTB;
	reg power1, power2;

	wire gpio;
    wire [15:0] checkbits;
	wire [37:0] mprj_io;
	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	assign checkbits = mprj_io[31:16];

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #10 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	initial begin
		$dumpfile("storage.vcd");
		$dumpvars(0, storage_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (100) begin
			repeat (1000) @(posedge clock);
			//$display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test Storage (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test Storage (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		RSTB <= 1'b0;
		#1000;
		RSTB <= 1'b1;	    // Release reset
		#2000;
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
	end

	always @(checkbits) begin
		if(checkbits == 16'hA040) begin
			`ifdef GL
				$display("Mem Test storage MGMT block0 (GL) [word rw] started");
			`else
				$display("Mem Test storage MGMT block0 (RTL) [word rw] started");
			`endif
		end
		else if(checkbits == 16'hAB40) begin
			$display("%c[1;31m",27);
			`ifdef GL
				$display("Monitor: Test storage MGMT block0 (GL) [word rw] failed");
			`else
				$display("Monitor: Test storage MGMT block0 (RTL) [word rw] failed");
			`endif
			$display("%c[0m",27);
			$finish;
		end
		else if(checkbits == 16'hAB41) begin
			`ifdef GL
				$display("Monitor: Test storage MGMT block0 (GL) [word rw]  passed");
			`else
				$display("Monitor: Test storage MGMT block0 (RTL) [word rw]  passed");
			`endif
		end
		else if(checkbits == 16'hA020) begin
			`ifdef GL
				$display("Mem Test storage MGMT block1 (GL) [word rw] started");
			`else
				$display("Mem Test storage MGMT block1 (RTL) [word rw] started");
			`endif
		end
		else if(checkbits == 16'hAB20) begin
			$display("%c[1;31m",27);
			`ifdef GL
				$display("Monitor: Test storage MGMT block1 (GL) [word rw] failed");
			`else
				$display("Monitor: Test storage MGMT block1 (RTL) [word rw] failed");
			`endif
			$display("%c[0m",27);
			$finish;
		end
		else if(checkbits == 16'hAB21) begin
			`ifdef GL
				$display("Monitor: Test storage MGMT block1 (GL) [word rw]  passed");
			`else
				$display("Monitor: Test storage MGMT block1 (RTL) [word rw]  passed");
			`endif
            $finish;
		end
	end

	wire VDD3V3;
	wire VDD1V8;
	wire VSS;

	assign VSS = 1'b0;
	assign VDD3V3 = power1;
	assign VDD1V8 = power2;

	assign mprj_io[3] = 1'b1;  // Force CSB high.

	caravel uut (
		.vddio	  (VDD3V3),
		.vssio	  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock	  (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("storage.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

endmodule
`default_nettype wire
