module mips_multi(
	clk,
	reset,
	pc,
	instr,
	mem_write,
	alu_out,
	write_data,
	read_data
);
	input clk, reset;
	input [31:0] instr, read_data; 
	output reg mem_write;
	output reg [31:0] pc, alu_out, write_data;
	
	reg mem_to_reg, alu_src, reg_dst, reg_write, jump, alu_control;
	
endmodule
