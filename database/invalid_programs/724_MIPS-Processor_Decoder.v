// This program was cloned from: https://github.com/neelkshah/MIPS-Processor
// License: GNU General Public License v3.0

module fiveToThirtyTwoDecoder(out, in);
	input [4:0] in;
	output [31:0] out;
	wire [4:0] w;
	
	not n1(w[0], in[0]);
	not n2(w[1], in[1]);
	not n3(w[2], in[2]);
	not n4(w[3], in[3]);
	not n5(w[4], in[4]);
	and a0(out[0], w[0], w[1], w[2], w[3], w[4]);
	and a0(out[1], in[0], w[1], w[2], w[3], w[4]);
	and a0(out[2], w[0], in[1], w[2], w[3], w[4]);
	and a0(out[3], in[0], in[1], w[2], w[3], w[4]);
	and a0(out[4], w[0], w[1], in[2], w[3], w[4]);
	and a0(out[5], in[0], w[1], in[2], w[3], w[4]);
	and a0(out[6], w[0], in[1], in[2], w[3], w[4]);
	and a0(out[7], in[0], in[1], in[2], w[3], w[4]);
	and a0(out[8], w[0], w[1], w[2], in[3], w[4]);
	and a0(out[9], in[0], w[1], w[2], in[3], w[4]);
	and a0(out[10], w[0], in[1], w[2], in[3], w[4]);
	and a0(out[11], in[0], in[1], w[2], in[3], w[4]);
	and a0(out[12], w[0], w[1], in[2], in[3], w[4]);
	and a0(out[13], in[0], w[1], in[2], in[3], w[4]);
	and a0(out[14], w[0], in[1], in[2], in[3], w[4]);
	and a0(out[15], in[0], in[1], in[2], in[3], w[4]);
	and a0(out[16], w[0], w[1], w[2], w[3], in[4]);
	and a0(out[17], in[0], w[1], w[2], w[3], in[4]);
	and a0(out[18], w[0], in[1], w[2], w[3], in[4]);
	and a0(out[19], in[0], in[1], w[2], w[3], in[4]);
	and a0(out[20], w[0], w[1], in[2], w[3], in[4]);
	and a0(out[21], in[0], w[1], in[2], w[3], in[4]);
	and a0(out[22], w[0], in[1], in[2], w[3], in[4]);
	and a0(out[23], in[0], in[1], in[2], w[3], in[4]);
	and a0(out[24], w[0], w[1], w[2], in[3], in[4]);
	and a0(out[25], in[0], w[1], w[2], in[3], in[4]);
	and a0(out[26], w[0], in[1], w[2], in[3], in[4]);
	and a0(out[27], in[0], in[1], w[2], in[3], in[4]);
	and a0(out[28], w[0], w[1], in[2], in[3], in[4]);
	and a0(out[29], in[0], w[1], in[2], in[3], in[4]);
	and a0(out[30], w[0], in[1], in[2], in[3], in[4]);
	and a0(out[31], in[0], in[1], in[2], in[3], in[4]);
	
endmodule