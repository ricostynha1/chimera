// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module FD2(
	input nCK,
	input D,
	output reg Q,
	output nQ
);

	initial
		Q <= 1'b0;

	always @(posedge ~nCK)	// negedge CK
		Q <= #1 D;
	
	assign nQ = ~Q;

endmodule
