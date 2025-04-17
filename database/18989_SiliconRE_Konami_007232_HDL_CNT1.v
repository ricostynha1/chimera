// This program was cloned from: https://github.com/furrtek/SiliconRE
// License: GNU General Public License v2.0

module CNT1(
	input CLK,
	input RESET,
	input nLOAD, CEN1, CEN2,
	input [3:0] D,
	output reg [3:0] Q
);

always @(posedge CLK or posedge RESET) begin
	if (RESET) begin
		Q <= 4'd0;
	end else begin
		if (!nLOAD)
			Q <= D;
		else
			if (CEN1 & CEN2) Q <= Q + 1'b1;
	end
end

endmodule
