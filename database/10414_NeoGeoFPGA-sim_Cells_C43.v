// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module C43(
	input CK,
	input [3:0] D,
	input nL, EN, CI, nCL,
	output reg [3:0] Q = 4'd0,
	output CO
);

	always @(posedge CK or posedge ~nCL)
	begin
		if (!nL)
			Q <= D;			// Load
		else if (!nCL)
			Q <= 4'd0;		// Clear
		else if (EN & CI)
			#1 Q <= Q + 1'b1;	// Count
		else
			Q <= Q;
	end
	
	assign #3 CO = &{Q[3:0], CI};

endmodule
