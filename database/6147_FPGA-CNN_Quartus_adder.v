// This program was cloned from: https://github.com/diaoenmao/FPGA-CNN
// License: MIT License

`define WIDTH 9
module adder(	

	input signed [2 * `WIDTH - 1 : 0] dataa,
	input signed [2 * `WIDTH - 1 : 0] datab,
	output signed [2 * `WIDTH - 1 : 0] dataout
);

assign dataout = dataa + datab;


endmodule