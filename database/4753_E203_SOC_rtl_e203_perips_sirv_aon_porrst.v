// This program was cloned from: https://github.com/ZhengmingHu/E203_SOC
// License: Apache License 2.0

 /*                                                                      
 Copyright 2018-2020 Nuclei System Technology, Inc.                
                                                                         
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.                                          
 */                                                                      
                                                                         
                                                                         
                                                                         
//=====================================================================
//
// Designer   : Bob Hu
//
// Description:
//  The PORRST circuit
//
// ====================================================================

module sirv_aon_porrst(
  output porrst_n
);

  `ifdef FPGA_SOURCE//{
      // In FPGA, we have no PORRST circult
      assign porrst_n = 1'b1;
  `else //}{
      assign porrst_n = 1'b1;

  `endif//}


endmodule
