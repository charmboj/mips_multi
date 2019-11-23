module maindec (
	clk,
	reset,
	op,
	mem_to_reg,
	reg_dst,
	i_or_d,
	pc_src,
	alu_src_b,
	alu_src_a,
	ir_write,
	mem_write,
	pc_write,
	branch,
	reg_write,
	alu_op
);

	input clk, reset;
	input [5:0] op;
	output reg mem_to_reg, reg_dst, i_or_d, alu_src_a,
		ir_write, mem_write, pc_write, branch, reg_write;
	output reg [1:0] pc_src, alu_src_b, alu_op;

	reg [14:0] state;

	//opcodes
	parameter r_type = 6'b000000;
	parameter lw = 6'b100011;
	parameter sw = 6'b101011;
	parameter beq = 6'b000100;
	parameter addi = 6'b001000;
	parameter j = 6'b000010;

	//state
	parameter s0 = 15'b101000000010000;
	parameter s1 = 15'b000000000110000;
	parameter s2 = 15'b000010000100000;
	parameter s3 = 15'b000010100100000;
	parameter s4 = 15'b000110110100000;
	parameter s5 = 15'b010010000100000;
	parameter s6 = 15'b000010000000010;
	parameter s7 = 15'b000110001000010;
	parameter s8 = 15'b000011000000101;
	parameter s9 = 15'b000010000100000;
	parameter s10 = 15'b000110000100000;
	parameter s11 = 15'b100000000111000;
	
	always begin
		assign pc_write = state[14];
		assign mem_write = state[13];
		assign ir_write = state[12];
		assign reg_write = state[11];
		assign alu_src_a = state[10];
		assign branch = state[9];
		assign i_or_d = state[8];
		assign mem_to_reg = state[7];
		assign reg_dst = state[6];
		assign alu_src_b = state[5:4];
		assign pc_src = state[3:2];
		assign alu_op = state[1:0];	
	end

	initial state = s0;	

	always @ (posedge clk)
	begin
		if (reset)
			state <= s0;
		else
			case (state)
			s0: state <= s1;
			s1:
				case (op)
				lw: state <= s2;
				sw: state <= s2;
				r_type: state <= s6;
				beq: state <= s8;
				addi: state <= s9;
				j: state <= s11;
				endcase
			s2: 
				case (op)
				lw: state <= s3;
				sw: state <= s5;
				endcase
			s3: state <= s4;
			s4: state <= s0;
			s5: state <= s0;
			s6: state <= s7;
			s7: state <= s8;
			s8: state <= s0;
			s9: state <= s10;
			s10: state <= s0;
			s11: state <= s0;
			endcase
	end

endmodule

