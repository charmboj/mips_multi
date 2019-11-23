module alu(
	src_a,
	src_b,
	alu_control,
	zero,
	alu_result
);

	input [31:0] src_a, src_b;
	input [2:0] alu_control;
	output reg zero;
	output reg [31:0] alu_result;
	
	//initial zero = 0; 

	always begin
		case(alu_control)
			3'b010: alu_result = src_a + src_b; // add
			3'b110: alu_result = src_a - src_b; // sub
			3'b000: alu_result = src_b&&src_b; // and
			3'b001: alu_result = src_b||src_b; // or
			3'b111: alu_result = (src_a < src_b)? 1:0; // slt
		endcase
		
		zero = (alu_result == 0)? 1:0;
	end
	
endmodule
