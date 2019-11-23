module controller_tb;
	reg clk, reset, zero;
	reg [5:0] op, funct;

	wire	i_or_d, mem_write, ir_write, reg_dst, mem_to_reg, reg_write, alu_src_a, pc_en;
	wire [1:0] alu_src_b, pc_src;
	wire [2:0] alu_control;
	
	reg [11:0] i;
	
	initial begin
		reset = 0;
		clk = 0;
		zero = 0;
		op = 0;
		funct = 0;
		i = 0;
		#10 reset = 0;
	end
	
	always #1 clk = ~clk;
	
	initial #16344 $stop;
	
	
	always begin
		{op, funct} = i;
		#4 i = i+1;
	end

endmodule
