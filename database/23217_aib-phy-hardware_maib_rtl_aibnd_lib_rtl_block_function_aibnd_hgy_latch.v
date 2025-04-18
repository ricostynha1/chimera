// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
module aibnd_hgy_latch (
	input wire set,
	input wire preset,
	input wire clk,
	input wire d,
	output reg q
);

always@(*) begin
	if (set && !preset) begin
		q <= 0;
	end
	else if (!set && preset) begin
		q <= 1;
	end
	else begin
		if (clk)
			q <= d;
	end
end	
endmodule



