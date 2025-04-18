// This program was cloned from: https://github.com/chipsalliance/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
//****************************************************************************************
// Copyright (C) 2011 Altera Corporation. .
//
//****************************************************************************************

//------------------------------------------------------------------------
// Description: standard nor2 gate
//
//------------------------------------------------------------------------

module altr_hps_nor3
    (
    input  wire              nor_in1,     // and input 1
    input  wire              nor_in2,     // and input 2
    input  wire              nor_in3,     // and input 3
    output  wire             nor_out      // and output
     );

`ifdef ALTR_HPS_INTEL_MACROS_OFF
    assign nor_out = ~(nor_in1 | nor_in2 | nor_in3);
`else
 
`endif

endmodule // altr_hps_nor3
