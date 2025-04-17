// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

/***************************************************
 * Module: alu
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     alu implementation
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 
 
 	
	//`define CODE_FOR_SYNTHESIS				// uncomment this macro will remove all non-systhesis code
	
	
	
	
	
 
	/************** Operation Code in instructions ****************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/************** ALU operation command ****************/
	
	
	
	
	
	
	
	
	
	
	/************** Branch condition code ****************/
	
	//`define BRANCH_GT		3'b001
	//`define BRANCH_LE		3'b010
	
 
 
 
 module alu
(
	input		[15:0]	a,		//src1
	input		[15:0]	b,		//src2
	input		[2:0]	cmd,	//function sel
	
	output	reg	[15:0]	r		//result	
);
	always @ (*) begin
		case(cmd)
			3'bxxx	:
				r = 16'bx;
			3'b000:
				r = a + b;
			3'b001:
				r = a - b;
			3'b010:
				r = a & b;
			3'b011	:
				r = a | b;
			3'b100:
				r = a ^ b;
			3'b101	:
				r = a << b;
			3'b110	:
				r = {{16{a[15]}},a} >> b;
			3'b111	:
				r = {16'b0,a} >> b;
			default	:
				begin
					r = 0;

					$display("ERROR: Unknown alu cmd: %b \n", cmd);
					//$finish;

				end
		endcase
	end
	
endmodule /***************************************************
 * Module: EX_stage
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     alu
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 module EX_stage
(
	input					clk,
	input					rst,
	// from ID_stage
	input		[56:0]		pipeline_reg_in,	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0]
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to MEM_stage
	output	reg	[37:0]		pipeline_reg_out,	//	[37:22],16bits:	ex_alu_result[15:0];
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to hazard detection unit
	output		[2:0]		ex_op_dest
);
	wire	[2:0]		alu_cmd		= pipeline_reg_in[56:54];				//S2
	wire	[15:0]		alu_src1	= pipeline_reg_in[53:38];
	wire	[15:0]		alu_src2	= pipeline_reg_in[37:22];
	
	wire	[15:0]		ex_alu_result;
	
	/********************** ALU *********************/
	alu alu_inst(
		.a		( alu_src1),
		.b		( alu_src2),
		.cmd	( alu_cmd),
		.r		( ex_alu_result)
	);
	
	
	/********************** singals to MEM_stage *********************/
	always @ (posedge clk) begin
		if(rst) begin
			pipeline_reg_out[37:0] <= 0;
		end
		else begin
			pipeline_reg_out[37:22] <= ex_alu_result;
			pipeline_reg_out[21:0] <= pipeline_reg_in[21:0];
		end
	end
	
	
	/********************** to hazard detection unit *********************/
	assign ex_op_dest = pipeline_reg_in[3:1];
endmodule 
/***************************************************
 * Module: instruction_mem
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     a rom
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































  

module instruction_mem		// a rtl simulation rom, rom initial code can be found in the testbench
(
	input					clk,		// asynchronized!!
	input	[8-1:0]	pc,
	
	output	[15:0]			instruction
);
	
	reg	[15:0] rom [2**8-1 : 0];
	
	wire [8-1 : 0] rom_addr = pc[8-1 : 0];
	
	// always @ (posedge clk) begin
	// always @ (*) begin
	    // instruction = rom[rom_addr];
	// end
	
	assign instruction = rom[rom_addr];
	
	
endmodule 













































/***************************************************
 * Module: MEM_stage
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     a ram
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 
module MEM_stage
(
	input					clk,
	input					rst,
	
	// from EX_stage
	input		[37:0]		pipeline_reg_in,	//	[37:22],16bits:	ex_alu_result[15:0];
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to WB_stage
	output	reg	[36:0]		pipeline_reg_out,	//	[36:21],16bits:	ex_alu_result[15:0]
												//	[20:5],16bits:	mem_read_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	output		[2:0]		mem_op_dest
);
	
	wire	[15:0]		ex_alu_result = pipeline_reg_in[37:22];
	wire				mem_write_en = pipeline_reg_in[21];
	wire	[15:0]		mem_write_data = pipeline_reg_in[20:5];
	
	wire	[15:0]		mem_read_data ;		
	
	/********************** Data memory *********************/
	// a ram
	data_mem dmem (
		.clk(clk), 
		.mem_access_addr	( ex_alu_result ), 
		.mem_write_data		( mem_write_data ), 
		.mem_write_en		( mem_write_en ), 
		.mem_read_data		( mem_read_data )
	);
	
	/********************** singals to WB_stage *********************/
	always @ (posedge clk) begin
		if(rst) begin
			pipeline_reg_out[36:0] <= 0;
		end
		else begin
			pipeline_reg_out[36:21] <= ex_alu_result;
			pipeline_reg_out[20:5]	<= mem_read_data ;
			pipeline_reg_out[4:0] 	<= pipeline_reg_in[4:0];
		end
	end
	
	
	/********************** to hazard detection unit *********************/
	assign mem_op_dest = pipeline_reg_in[3:1];

endmodule /***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 /***************************************************
 * Module: ID_stage
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     IR, and instruction decoding
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 
module ID_stage
(
	input					clk,
	input					rst,
	input					instruction_decode_en,
	//input					insert_bubble,
	
	
	// to EX_stage
	output	reg	[56:0]		pipeline_reg_out,	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0]
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to IF_stage
	input		[15:0]		instruction,
	output		[5:0]		branch_offset_imm,
	output	reg				branch_taken,
	
	// to register file
	output		[2:0]		reg_read_addr_1,	// register file read port 1 address
	output		[2:0]		reg_read_addr_2,	// register file read port 2 address
	input		[15:0]		reg_read_data_1,	// register file read port 1 data
	input		[15:0]		reg_read_data_2,	// register file read port 2 data
	
	// to hazard detection unit
	output		[2:0]		decoding_op_src1,		//source_1 register number
	output		[2:0]		decoding_op_src2		//source_2 register number
	
);
    
	/********************** internal wires ***********************************/
	//----------------- Instruction Register signals --------------------//
	reg		[15:0]		instruction_reg;
	wire	[3:0]		ir_op_code;		//operation code
	wire	[2:0]		ir_dest;		//destination register number
	wire	[2:0]		ir_src1;		//source_1 register number
	wire	[2:0]		ir_src2;		//source_2 register number
	wire	[5:0]		ir_imm;			//immediate number carried by the instruction
	
	//---------------- data path control signals --------------------------//
	// write back stage signals
	reg					write_back_en;			// S3
	wire	[2:0]		write_back_dest;		// dest
	reg					write_back_result_mux;	// S1
	// mem stage signals
	wire				mem_write_en;		
	wire	[15:0]		mem_write_data;
	// ex stage signals
	reg		[2:0]		ex_alu_cmd;				//S2
	wire	[15:0]		ex_alu_src1;
	wire	[15:0]		ex_alu_src2;
	// instruction decode stage signals
	reg					alu_src2_mux;			// S4
	wire				decoding_op_is_branch;	//S5
	wire				decoding_op_is_store;	//S6
	wire	[3:0]		ir_op_code_with_bubble;
	wire	[2:0]		ir_dest_with_bubble;
	//reg					branch_condition_satisfied;
	
	
	/********************** Instruction Register *********************/
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			instruction_reg <= 0;
		end
		else begin
			if(instruction_decode_en) begin
				instruction_reg <= instruction;
			end
		end
	end
	assign ir_op_code = instruction_reg[15:12];
	assign ir_dest = instruction_reg[11: 9];
	assign ir_src1 = instruction_reg[ 8: 6];
	assign ir_src2 = (decoding_op_is_store)? instruction_reg[11: 9] : instruction_reg[ 5: 3];
	assign ir_imm  = instruction_reg[ 5: 0];
	
	/********************** pipeline bubble insertion *********************/
	// if instrcution decode is frozen, insert bubble operations into the pipeline
	assign ir_op_code_with_bubble = ( instruction_decode_en )?  ir_op_code : 0;
	// if instrcution decode is frozen, force destination reg number to 0, 
	// this operation is to prevent pipeline stall.
	assign ir_dest_with_bubble = ( instruction_decode_en )?  ir_dest : 0;
	
	/********************** Data path control logic *********************/
	always @ (*) begin
		if(rst) begin
			write_back_en			= 0;	// S3
			write_back_result_mux	= 0;	// S1
			ex_alu_cmd				= 0;	// S2
			alu_src2_mux			= 0;	// S4
		end
		else begin
			case( ir_op_code_with_bubble )
				4'b0000	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= 3'bxxx;	// S2
						alu_src2_mux			= 1'bx;		// S4
					end
				4'b0001	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b000;	// S2
						alu_src2_mux			= 0;		// S4
					end
				4'b0010	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b001;	// S2
						alu_src2_mux			= 0;		// S4
					end
				4'b0011	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b010;	// S2
						alu_src2_mux			= 0;		// S4
					end
				4'b0100	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b011;	// S2
						alu_src2_mux			= 0;		// S4
					end
				4'b0101	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b100;	// S2
						alu_src2_mux			= 1'bx;		// S4
					end
				4'b0110	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b101;	// S2
						alu_src2_mux			= 0;		// S4
					end
				4'b0111	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b110;	// S2
						alu_src2_mux			= 0;		// S4
					end
				4'b1000	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b111;	// S2
						alu_src2_mux			= 0;		// S4
					end
				4'b1001:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= 3'b000;	// S2
						alu_src2_mux			= 1;		// S4
					end
				4'b1010	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 1;		// S1
						ex_alu_cmd				= 3'b000;	// S2
						alu_src2_mux			= 1;		// S4
					end
				4'b1011	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= 3'b000;	// S2
						alu_src2_mux			= 1;		// S4
					end
				4'b1100	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= 3'bxxx;	// S2
						alu_src2_mux			= 1;		// S4
					end
				default	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= 3'bxxx;	// S2
						alu_src2_mux			= 1'bx;		// S4

						$display("ERROR: Unknown Instruction: %b", ir_op_code_with_bubble);
						//$finish;

					end
			endcase
		end
	end
	
	assign decoding_op_is_branch = ( ir_op_code == 4'b1100 )? 1 : 0;	// S5
	assign decoding_op_is_store	= ( ir_op_code == 4'b1011 )? 1 : 0;	// S6
	
	/********************** singals to EX_stage *********************/
	assign mem_write_data = reg_read_data_2;
	assign mem_write_en = decoding_op_is_store;
	assign write_back_dest = ir_dest_with_bubble;
	assign ex_alu_src1 = reg_read_data_1;
	assign ex_alu_src2 = (alu_src2_mux)? {{10{ir_imm[5]}},ir_imm} : reg_read_data_2;
	
	//	pipeline_reg_out:
	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0],
	//	[21:5],17bits:	mem_write_en, mem_write_data[15:0],
	//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux,
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			pipeline_reg_out[56:0] <= 0;
		end
		else begin
			pipeline_reg_out[56:0] <= {
				ex_alu_cmd[2:0],		// pipeline_reg_out[56:54]	//S2
				ex_alu_src1[15:0],		// pipeline_reg_out[53:38]
				ex_alu_src2[15:0],		// pipeline_reg_out[37:22]	
				mem_write_en, 			// pipeline_reg_out[21]		//
				mem_write_data[15:0],	// pipeline_reg_out[20:5]	//
				write_back_en, 			// pipeline_reg_out[4]		//S3
				write_back_dest[2:0], 	// pipeline_reg_out[3:1]	//dest
				write_back_result_mux 	// pipeline_reg_out[0]		//S1
				};
		end
	end
	
			 
	/********************** interface with register file *********************/
	assign reg_read_addr_1 = ir_src1;
	assign reg_read_addr_2 = ir_src2;
	
	/********************** branch signals generate *********************/
	always @ (*) begin
		if(decoding_op_is_branch) begin
			case( ir_dest_with_bubble )
				3'b000	:
					begin
						if(reg_read_data_1 == 0)
							branch_taken = 1;
						else
							branch_taken = 0;
					end
					
				default:
					begin
						branch_taken = 0;

						$display("ERROR: Unknown branch condition %b, in branch instruction %b \n", ir_dest_with_bubble, ir_op_code_with_bubble);
						//$finish;
					
					end
			endcase
		end
		else begin
			branch_taken = 0;
		end
	end
	assign branch_offset_imm = ir_imm;
	//assign branch_taken = decoding_op_is_branch & branch_condition_satisfied ;
	
	/********************** to hazard detection unit *********************/
	assign decoding_op_src1 = ir_src1;
	assign decoding_op_src2 = (
					ir_op_code == 4'b0000 	||
					ir_op_code == 4'b1001 	||
					ir_op_code == 4'b1010 	||
					ir_op_code == 4'b1100 	
					)?
					3'b000 : ir_src2;
	
endmodule /***************************************************
 * Module: IF_stage
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     PC, IMEM, 
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 

module IF_stage
(
	input							clk,
	input							rst,				//active high
	input							instruction_fetch_en,
	
	input	[5:0]					branch_offset_imm,
	input							branch_taken,
	
	output	reg	[8-1:0]		pc,
	output	[15:0]					instruction
);
    
	// pc control
	always @ (posedge clk or posedge rst) begin
	    if (rst) begin
	        pc <= 8'b0;
	    end 
		else begin
			if(instruction_fetch_en) begin
				if(branch_taken)
					//don't forget sign bit expansion
					pc <= pc + {{(8-6){branch_offset_imm[5]}}, branch_offset_imm[5:0]};	
				else
					pc <= pc + 8'd1;
			end
		end
	end
	
	// instruction memory, or rom
	instruction_mem imem(
		.clk				(clk),
		.pc					(pc),
		
		.instruction		(instruction)
	);
	
	
endmodule 



/***************************************************
 * Module: WB_stage
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     Write back stage
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 module WB_stage
(
	//input					clk,
	
	// from EX stage
	input		[36:0]		pipeline_reg_in,	//	[36:21],16bits:	ex_alu_result[15:0]
												//	[20:5],16bits:	mem_read_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to register file
	output					reg_write_en,
	output		[2:0]		reg_write_dest,
	output		[15:0]		reg_write_data,
	
	output		[2:0]		wb_op_dest
);
	
	wire [15:0]	ex_alu_result = pipeline_reg_in[36:21];
	wire [15:0]	mem_read_data = pipeline_reg_in[20:5];
	wire		write_back_en = pipeline_reg_in[4];
	wire [2:0]	write_back_dest = pipeline_reg_in[3:1];
	wire		write_back_result_mux = pipeline_reg_in[0];
	
	/********************** to register file *********************/
	assign reg_write_en = write_back_en;
	assign reg_write_dest = write_back_dest;
	assign reg_write_data = (write_back_result_mux)? mem_read_data : ex_alu_result;
	
	/********************** to hazard detection unit *********************/
	assign wb_op_dest = pipeline_reg_in[3:1];
	
	
endmodule /***************************************************
 * Module: hazard_detection_unit
 * Project: mips_16
 * Author: fzy
 * Description: 
 *    Data Hazard detection. if there is a RAW hazard, it will stall the pipeline.
 *	
 *	 *	 Method: It compare the source register of the instruction in ID_stage 
 * 			 and it's previous 3 instructions' destination register. If
 *			 the source register is equal to any of the three destination regs 
 *			 and not equals to zero, the Hazard Detction Unit will assert
 *			 pipeline_stall signal. That signal will freeze the IF & ID stage,
 *			 and insert bubbles into EX stage. When the hazard instruction 
 *			 was flushed out of the pipeline, pipeline_stall signal will 
 *			 be canceled.
 *
 * Revise history:
 *     
 ***************************************************/
module hazard_detection_unit
(
	input		[2:0]		decoding_op_src1,		//ID stage source_1 register number
	input		[2:0]		decoding_op_src2,		//ID stage source_2 register number
	
	input		[2:0]		ex_op_dest,				//EX stage destinaton register number
	input		[2:0]		mem_op_dest,			//MEM stage destinaton register number
	input		[2:0]		wb_op_dest,				//WB stage destinaton register number
	
	output	reg				pipeline_stall_n		// Active low
);
	
	always @ (*) begin
		pipeline_stall_n = 1;
		
		if( decoding_op_src1 != 0 &&
			(
				decoding_op_src1 == ex_op_dest	||
				decoding_op_src1 == mem_op_dest	||
				decoding_op_src1 == wb_op_dest	
			)
		)
			pipeline_stall_n = 0;
			
		if( decoding_op_src2 != 0 &&
			(
				decoding_op_src2 == ex_op_dest	||
				decoding_op_src2 == mem_op_dest	||
				decoding_op_src2 == wb_op_dest	
			)
		)
			pipeline_stall_n = 0;
		
		
	end
	
	
	
endmodule /***************************************************
 * Module: mips_16_core_top
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     top module of mips_16 cpu core. Technical details:
 *			1.	16-bit data width
 *			2.	classic 5-stage static pipeline, 1 branch delay slot, theoretical CPI is 1.0
 *			3.	pipeline is able to detect and prevent RAW hazards, no forwarding logic
 *			4.	8 general purpose register (reg 0 is special, according to mips architecture)
 *			5.	up to now supports 13 instrcutions, see ./doc/instruction_set.txt for details
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 module mips_16_core_top
(
	input						clk,
	input						rst,

	output	[8-1:0]		pc
);
	wire 						pipeline_stall_n ;
	wire	[5:0]				branch_offset_imm;
	wire						branch_taken;
	wire	[15:0]				instruction;
	wire	[56:0]				ID_pipeline_reg_out;
	wire	[37:0]				EX_pipeline_reg_out;
	wire	[36:0]				MEM_pipeline_reg_out;
	
	wire	[2:0]				reg_read_addr_1;	// register file read port 1 address
	wire	[2:0]				reg_read_addr_2;	// register file read port 2 address
	wire	[15:0]				reg_read_data_1;	// register file read port 1 data
	wire	[15:0]				reg_read_data_2;	// register file read port 2 data
	wire	[2:0]				decoding_op_src1;		//source_1 register number
	wire	[2:0]				decoding_op_src2;		//source_2 register number
	wire	[2:0]				ex_op_dest;				//EX stage destinaton register number
	wire	[2:0]				mem_op_dest;			//MEM stage destinaton register number
	wire	[2:0]				wb_op_dest;				//WB stage destinaton register number
	wire						reg_write_en;
	wire	[2:0]				reg_write_dest;
	wire	[15:0]				reg_write_data;
	
	IF_stage IF_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.instruction_fetch_en	(pipeline_stall_n),
		.branch_offset_imm		(branch_offset_imm), 
		.branch_taken			(branch_taken), 
		.pc						(pc),
		.instruction			(instruction)
	);
	
	ID_stage ID_stage_inst (
		.clk					(clk),
		.rst					(rst),
		.instruction_decode_en	(pipeline_stall_n),
		.pipeline_reg_out		(ID_pipeline_reg_out),
		.instruction			(instruction),
		.branch_offset_imm		(branch_offset_imm),
		.branch_taken			(branch_taken),
		.reg_read_addr_1		(reg_read_addr_1),	//
		.reg_read_addr_2		(reg_read_addr_2),	//
		.reg_read_data_1		(reg_read_data_1),	//
		.reg_read_data_2		(reg_read_data_2),	//
		.decoding_op_src1		(decoding_op_src1),		
		.decoding_op_src2		(decoding_op_src2)
	);
	
	EX_stage EX_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.pipeline_reg_in		(ID_pipeline_reg_out), 
		.pipeline_reg_out		(EX_pipeline_reg_out), 
		.ex_op_dest				(ex_op_dest)
	);
	
	MEM_stage MEM_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.pipeline_reg_in		(EX_pipeline_reg_out), 
		.pipeline_reg_out		(MEM_pipeline_reg_out), 
		.mem_op_dest			(mem_op_dest)
	);
	
	WB_stage WB_stage_inst (
		.pipeline_reg_in		(MEM_pipeline_reg_out), 
		.reg_write_en			(reg_write_en), 
		.reg_write_dest			(reg_write_dest), 
		.reg_write_data			(reg_write_data), 
		.wb_op_dest				(wb_op_dest)
	);
	
	register_file register_file_inst (
		.clk					(clk), 
		.rst					(rst), 
		.reg_write_en			(reg_write_en), 
		.reg_write_dest			(reg_write_dest), 
		.reg_write_data			(reg_write_data), 
		.reg_read_addr_1		(reg_read_addr_1), 
		.reg_read_data_1		(reg_read_data_1), 
		.reg_read_addr_2		(reg_read_addr_2), 
		.reg_read_data_2		(reg_read_data_2)
	);
	
	hazard_detection_unit hazard_detection_unit_inst (
		.decoding_op_src1		(decoding_op_src1), 
		.decoding_op_src2		(decoding_op_src2), 
		.ex_op_dest				(ex_op_dest), 
		.mem_op_dest			(mem_op_dest), 
		.wb_op_dest				(wb_op_dest), 
		.pipeline_stall_n		(pipeline_stall_n)
	);
	
endmodule 




 




/***************************************************
 * Module: data_mem
 * Project: mips_16
 * Author: fzy
 * Description: 
 *     a ram implementation, 16bit word width, address width can be configured be user
 *		further will be able to read external memory
 *
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 module data_mem
(
	input					clk,
	
	// address input, shared by read and write port
	input	[15:0]			mem_access_addr,
	
	// write port
	input	[15:0]			mem_write_data,
	input					mem_write_en,
	// read port
	output	[15:0]			mem_read_data
	
);


	reg [15:0] ram [(2**8)-1:0];

	wire [8-1 : 0] ram_addr = mem_access_addr[8-1 : 0];

	always @(posedge clk)
		if (mem_write_en)
			ram[ram_addr] <= mem_write_data;

	assign mem_read_data = ram[ram_addr]; 
   
endmodule /***************************************************
 * Module: register_file
 * Project: mips_16
 * Author: fzy
 * Description: 
 * 	a 8-entry 16-bit register file, 
 *	with 1 synchronized write port and 2 asynchonized read port
  *
 *	NOTE: for Register 0, read data from it will always be 0, 
 *		and write operatioins will also be discarded.
 *	
 * Revise history:
 *     
 ***************************************************/
`timescale 1ns/1ps
/***************************************************
 * Module: 
 * Project: mips_16
 * Author: 
 * Description: 
 *     
 *
 * Revise history:
 *     
 ***************************************************/
 











































 
module register_file
(
	input				clk,
	input				rst,
	
	// write port
	input				reg_write_en,
	input		[2:0]	reg_write_dest,
	input		[15:0]	reg_write_data,
	
	//read port 1
	input		[2:0]	reg_read_addr_1,
	output		[15:0]	reg_read_data_1,
	//read port 2
	input		[2:0]	reg_read_addr_2,
	output		[15:0]	reg_read_data_2
);
	reg	[15:0]	reg_array [7:0];
	
	// write port
	//reg [2:0] i;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			// for(i=0; i<8; i=i+1)
				// reg_array[i] <= 15'b0;
			reg_array[0] <= 15'b0;
			reg_array[1] <= 15'b0;
			reg_array[2] <= 15'b0;
			reg_array[3] <= 15'b0;
			reg_array[4] <= 15'b0;
			reg_array[5] <= 15'b0;
			reg_array[6] <= 15'b0;
			reg_array[7] <= 15'b0;	
		end
		else begin
			if(reg_write_en) begin
				reg_array[reg_write_dest] <= reg_write_data;
			end
		end
		
	end
	
	//read port 1
	// always @ (*) begin
		// if( reg_read_addr_1 == 0) begin
			// reg_read_data_1 = 15'b0;
		// end
		// else begin
			// reg_read_data_1 = reg_array[reg_read_addr_1];
		// end
	// end
	assign reg_read_data_1 = ( reg_read_addr_1 == 0)? 15'b0 : reg_array[reg_read_addr_1];
	
	//read port 2
	// always @ (*) begin
		// if( reg_read_addr_2 == 0) begin
			// reg_read_data_2 = 15'b0;
		// end
		// else begin
			// reg_read_data_2 = reg_array[reg_read_addr_2];
		// end
	// end
	assign reg_read_data_2 = ( reg_read_addr_2 == 0)? 15'b0 : reg_array[reg_read_addr_2];

endmodule 