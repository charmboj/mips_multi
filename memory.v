module memory(
	clk, 
	reset, 
	mem_write,
	adr,
	write_data,
	read_data
);

	input clk, reset, mem_write;
	input [5:0] adr; 
	input [31:0] write_data;
	
	output reg [31:0] read_data;
	
	reg [31:0] RAM [63:0];
	
	assign read_data = RAM[adr[31:2]];
	
	always @ (clk) begin
		if(mem_write) RAM[adr[31:2]] <= write_data;
	end

endmodule
