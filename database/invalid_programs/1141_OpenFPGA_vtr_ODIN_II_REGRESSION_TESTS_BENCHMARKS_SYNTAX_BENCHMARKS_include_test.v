// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License


`include "bench_define.v"


module include_test (a,b,c);


	input a;
	input b;
	output c;

	`ifndef include_test_def
		assign c = a & b;
	`else
		assign c = a | b;
	`endif

endmodule