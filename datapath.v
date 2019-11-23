module datapath(
	clk,
	reset,
	pc_en,
	i_or_d,
	ir_write,
	reg_dst,
	mem_to_reg,
	reg_write,
	alu_src_a,
	alu_src_b,
	alu_control,
	pc_src,
	read_data,
	op,
	funct,
	zero,
	adr,
	write_data
);

	input clk, reset, pc_en, i_or_d, ir_write, reg_dst, mem_to_reg, reg_write, alu_src_a;
	
	input [1:0] alu_src_b, pc_src;
	input [2:0] alu_control;
	input [31:0] read_data;
	
	output reg zero;
	output reg [5:0] op, funct, adr;
	output reg [31:0] write_data;
	
	//wires;
	reg [31:0] pc_, pc, src_a, src_b, a, b, alu_result, alu_out, pc_jump;
	
	//sign extend
	reg [15:0] imm_ext;
	
	//pc jump instr
	
	reg [27:0] jump;
	
	//register_file
	reg [4:0] a1, a2, a3;
	reg [31:0] wd3;
	
	reg [31:0] rd_instr, rd_data, instr, data, rd1, rd2;
	
	controller ctrl(clk,
		reset,
		op,
		funct,
		zero,
		i_or_d,
		mem_write,
		ir_write,
		reg_dst,
		mem_to_reg,
		reg_write,
		alu_src_a,
		alu_src_b,
		alu_control,
		pc_src,
		pc_en
	);
	
	register_file rf(clk, we3, a1, a2, a3, wd3, rd1, rd2);
	
	alu alu(src_a, src_b, alu_control, zero, alu_result);
	
	//clk
	always @(posedge clk) begin
		if(pc_en) pc <= pc_;
		
		if(ir_write) instr <= read_data;
		
		data <= read_data;
		a <= rd1;
		b <= rd2;
		alu_out <= alu_result;
	end
	
	//controller
	always begin
		op <= instr [31:26];
		funct <= instr [5:0];
	end
	
	//memory
	always begin
		write_data <= b;
	end
	
	//multiplexers
	always begin
		adr <= i_or_d? alu_out: pc; //i_or_d
		a3 <= reg_dst? instr[15:11]: instr[20:16]; //reg_dst
		wd3 <= mem_to_reg? data: alu_out;//mem_to_reg
		src_a <= alu_src_a? a: pc;// alu_src_a
		
		case(alu_src_b)
			0: src_b <= b;
			1: src_b <= 4;  //??
			2: src_b <= imm_ext;
			3: src_b <= imm_ext<<2;
		endcase
		
		case(pc_src)
			0: pc_ <= alu_result;
			1: pc_ <= alu_out;
			2: pc_ <= pc_jump;
		endcase
	end
	
	//pc_jump
	always begin
		jump <= instr[25:0];
		pc_jump <= {pc[31:28],jump<<2};
	end
	
	//sign_extend
	always begin
		imm_ext <= $signed(instr[15:0]);
	end

endmodule
