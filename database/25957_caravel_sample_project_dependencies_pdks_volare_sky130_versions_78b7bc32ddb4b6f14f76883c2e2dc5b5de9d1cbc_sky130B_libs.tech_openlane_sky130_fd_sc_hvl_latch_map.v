// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module \$_DLATCH_P_ (input E, input D, output Q);
  sky130_fd_sc_hvl__dlxtp_1 _TECHMAP_DLATCH_P (
    //# {{data|Data Signals}}
    .D(D),
    .Q(Q),

    //# {{clocks|Clocking}}
    .GATE(E)
  );
endmodule
