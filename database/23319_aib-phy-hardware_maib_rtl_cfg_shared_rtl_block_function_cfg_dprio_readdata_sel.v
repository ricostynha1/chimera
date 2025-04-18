// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
//****************************************************************************************
// (C) 2012 Altera Corporation. All rights reserved.
//
//****************************************************************************************
//*****************************************************************
// Description:
//
//*****************************************************************

module cfg_dprio_readdata_sel
#(
   parameter ADDR_WIDTH      = 10  // Address width
 )
( 
input  wire [ADDR_WIDTH-1:0]  reg_addr,     // address input
input  wire [ADDR_WIDTH-1:0]  target_addr,  // target address input

output wire                   readdata_sel  // read select output
);

assign readdata_sel = (reg_addr == target_addr) ? 1'b1 : 1'b0;

endmodule
