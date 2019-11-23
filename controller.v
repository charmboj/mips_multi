module controller(
	clk,
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

	input clk, reset, zero;
	input [5:0] op, funct;

	output i_or_d, mem_write, ir_write, reg_dst, mem_to_reg, reg_write, alu_src_a, pc_en;
	output [1:0] alu_src_b, pc_src;
	output [2:0] alu_control;
	reg pc_write, branch;
	reg [1:0] alu_op;
	
	assign pc_en = (zero||branch)&&pc_write;
	
	aludec ad(funct, alu_op, alu_control);
	
	maindec md(
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

endmodule
