`timescale 1ns/1ns
module alu_tb;
	reg [31:0] src_a, src_b;
	reg [2:0] alu_control;
	wire zero;
	wire [31:0] alu_result;
	
	initial src_a = 32'h20f44c5f;
	initial src_b = 32'h64aa354a;
		
	initial begin
		alu_control <= 3'b010;
		#5 alu_control <= 3'b110;
		#5 alu_control <= 3'b000;
		#5 alu_control <= 3'b001;
		#5 alu_control <= 3'b111;
	end
	
	alu uut(	
		src_a,
		src_b,
		alu_control,
		zero,
		alu_result
	);
		
endmodule
