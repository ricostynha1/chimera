// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.073 %
// MAE = 3.0 
// WCE% = 0.22 %
// WCE = 9.0 
// WCRE% = 700.00 %
// EP% = 90.62 %
// MRE% = 1.15 %
// MSE = 14 
// PDK45_PWR = 0.038 mW
// PDK45_AREA = 79.3 um2
// PDK45_DELAY = 0.68 ns

module add12se_5AL (
    A,
    B,
    O
);

input [11:0] A;
input [11:0] B;
output [12:0] O;

wire sig_26,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_58,sig_59;
wire sig_60,sig_61,sig_62,sig_63,sig_64,sig_65,sig_66,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_74,sig_75,sig_76,sig_77,sig_78,sig_79;
wire sig_80,sig_81,sig_82;

assign sig_26 = ~B[3];
assign sig_41 = A[4] ^ B[4];
assign sig_42 = A[4] & B[4];
assign sig_43 = sig_41 & B[3];
assign sig_44 = sig_41 ^ B[3];
assign sig_45 = sig_42 | sig_43;
assign sig_46 = A[5] ^ B[5];
assign sig_47 = A[5] & B[5];
assign sig_48 = sig_46 & sig_45;
assign sig_49 = sig_46 ^ sig_45;
assign sig_50 = sig_47 | sig_48;
assign sig_51 = A[6] ^ B[6];
assign sig_52 = A[6] & B[6];
assign sig_53 = sig_51 & sig_50;
assign sig_54 = sig_51 ^ sig_50;
assign sig_55 = sig_52 | sig_53;
assign sig_56 = A[7] ^ B[7];
assign sig_57 = A[7] & B[7];
assign sig_58 = sig_56 & sig_55;
assign sig_59 = sig_56 ^ sig_55;
assign sig_60 = sig_57 | sig_58;
assign sig_61 = A[8] ^ B[8];
assign sig_62 = A[8] & B[8];
assign sig_63 = sig_61 & sig_60;
assign sig_64 = sig_61 ^ sig_60;
assign sig_65 = sig_62 | sig_63;
assign sig_66 = A[9] ^ B[9];
assign sig_67 = A[9] & B[9];
assign sig_68 = sig_66 & sig_65;
assign sig_69 = sig_66 ^ sig_65;
assign sig_70 = sig_67 | sig_68;
assign sig_71 = A[10] ^ B[10];
assign sig_72 = A[10] & B[10];
assign sig_73 = sig_71 & sig_70;
assign sig_74 = sig_71 ^ sig_70;
assign sig_75 = sig_72 | sig_73;
assign sig_76 = A[11] ^ B[11];
assign sig_77 = A[11] & B[11];
assign sig_78 = sig_76 & sig_75;
assign sig_79 = sig_76 ^ sig_75;
assign sig_80 = sig_77 | sig_78;
assign sig_81 = A[11] ^ B[11];
assign sig_82 = sig_81 ^ sig_80;

assign O[12] = sig_82;
assign O[11] = sig_79;
assign O[10] = sig_74;
assign O[9] = sig_69;
assign O[8] = sig_64;
assign O[7] = sig_59;
assign O[6] = sig_54;
assign O[5] = sig_49;
assign O[4] = sig_44;
assign O[3] = sig_26;
assign O[2] = A[3];
assign O[1] = B[1];
assign O[0] = sig_77;

endmodule


