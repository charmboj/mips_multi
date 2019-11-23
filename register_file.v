module register_file(
	clk,
	we3,
	a1,
	a2,
	a3,
	wd3,
	rd1,
	rd2
);

	input clk, we3;
	input [4:0] a1, a2, a3;
	input [31:0] wd3;
	output reg [31:0] rd1, rd2;
	
	reg [31:0] rf [31:0];
	
	always @ (posedge clk) begin
		if(we3) rf[a3] <= wd3;
		
		rd1 = (a1 != 0)? rf[a1]:0;
		rd2 = (a2 != 0)? rf[a2]:0;
	end

endmodule
