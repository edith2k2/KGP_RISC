`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module data_memory(
		clk,
		reset,
		memRead,
		memWrite,
		address,
		data_in,
		data_out
    );

input clk, reset, memRead, memWrite;
input [9:0] address;
input [31:0] data_in;
output reg [31:0] data_out;

reg [31:0] storage_data [1023:0];
integer i;
always @(posedge clk, posedge reset)
begin
	#5
	if (reset)
	begin
		for (i = 0; i < 1024; i = i + 1)
		begin
			storage_data[i] <= 32'b0;
		end
		data_out <= 32'b0;
	end
	else 
	begin
		if (memWrite) storage_data[address] <= data_in;
		if (memRead) data_out <= storage_data[address];
	end
end


endmodule
