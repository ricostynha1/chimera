// This program was cloned from: https://github.com/neelkshah/MIPS-Processor
// License: GNU General Public License v3.0

module InstructionMemory32(instruction, ProgramCounter, clk);
	input[31:0] ProgramCounter;
	input clk;
	output[31:0] instruction;
	reg [31:0] memory [0:31];
	reg [31:0] instruction;
	integer addr;
	
	initial
		begin
			memory[0] = 32'b00000001000010010101000000100000;  // add	add $s2, $s0, $s1	$s2 = $s0 + $s1
			memory[1] = 32'b00000001000010010101000000100001;  // addu	addu $s2, $s0, $s1	$s2 = $s0 + $s1
			memory[2] = 32'b00100001000010010001100100100110;  // addi	addi $s1, 6438($s0)	$s1 = $s0 + 6438
			memory[3] = 32'b00100101000010010001100100100110;  // addiu	addiu $s1, 6438($s0)	$s1 = $s0 + 6438
			memory[4] = 32'b00000001000010010101000000100100;  // and	and $s2, $s0, $s1	$s2 = $s0 & $s1
			memory[5] = 32'b00110001000010010001100100100110;  // andi	andi $s1, 6438($s0)	$s1 = $s0 + 6438
			memory[6] = 32'b00000001000010010101000000011010;  // div	div $s2, $s0, $s1	$s2 = $s0 / $s1
			memory[7] = 32'b00000001000010010101000000011011;  // divu	divu $s2, $s0, $s1	$s2 = $s0 / $s1
			memory[8] = 32'b00000001000010010101000000011000;  // mult	mult $s2, $s0, $s1	$s2 = $s0 * $s1
			memory[9] = 32'b00000001000010010101000000011001;  // multu	multu $s2, $s0, $s1	$s2 = $s0 * $s1
			memory[10] = 32'b00000001000010010101000000100111;  // nor	nor $s2, $s0, $s1	$s2 = ~($s0 | $s1)
			memory[11] = 32'b00000001000010010101000000100101;  // or	or $s2, $s0, $s1	$s2 = $s0 | $s1
			memory[12] = 32'b00110101000010010001100100100110;  // ori	ori $s1, 6438($s0)	$s1 = $s0 | 6438
			memory[13] = 32'b00000001000010010101000000100010;  // sub	sub $s2, $s0, $s1	$s2 = $s0 - $s1
			memory[14] = 32'b00000001000010010101000000100011;  // subu	subu $s2, $s0, $s1	$s2 = $s0 - $s1
			memory[15] = 32'b00000001000010010101000000100110;  // xor	xor $s2, $s0, $s1	$s2 = $s0 ^ $s1
			memory[16] = 32'b00111001000010010001100100100110;  // xori	xori $s1, 6438($s0)	$s1 = $s0 ^ 6438
			memory[17] = 32'b00000001000010010101000000101010;  // slt	slt $s2, $s0, $s1	$s2 = $s0 < $s1
			memory[18] = 32'b00000001000010010101000000101011;  // sltu	slt $s2, $s0, $s1	$s2 = $s0 < $s1
			memory[19] = 32'b00101001000010010001100100100110;  // slti	slti $s1, 6438($s0)	$s1 = $s0 < 6438
			memory[20] = 32'b00101101000010010001100100100110;  // sltiu	sltiu $s1, 6438($s0)	$s1 = $s0 < 6438
			memory[21] = 32'b00010001000010010001100100100110;  // beq	beq $s0, $s1, 6438	if($s0 == $s1) goto loc 4*6438
			memory[22] = 32'b00000101000010010001100100100110;  // bne	bne $s0, $s1, 6438	if($s0 != $s1) goto loc 4*6438
			memory[23] = 32'b00001000000000000001100100100110;  // j	j 6438			PC = PC + <<2 6438
			memory[24] = 32'b00000100000000000001100100100110;  // jal	jal 6438		$31 = PC; PC = PC + <<2 6438
			memory[25] = 32'b00000000000000000000000000001001;  // jalr	jalr $s0		$31 = PC; PC = $s0
			memory[26] = 32'b00000001000000000000000000001000;  // jr	jr $s0			PC = $s0
			memory[27] = 32'b10001101000010010001100100100110;  // lw	lw $s1, 6438($s0)	$s1 = mem($s0 + 6438):4
			memory[28] = 32'b10101101000010010001100100100110;  // sw	sw $s1, 6438($s0)	mem($s0 + 6438):4 = $s1
			memory[29] = 32'b01101000000000000000000000000000;  // trap	trap 
			memory[30] = 32'b00000000000000000000000000000000;  // nop
			memory[31] = 32'b00000000000000000000000000000000;  // nop
		end
  
	always @(posedge clk) begin
		addr = ProgramCounter[31:0];
		instruction = memory[addr/4];
	end
	
endmodule
