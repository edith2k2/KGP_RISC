`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module register_file(
		clk,
		reset,
		read_reg1,
		read_reg2,
		reg_write,
		write_data,
		read_data1,
		read_data2
    );
input clk, reset, reg_write;
input [4:0] read_reg1,read_reg2;
input [31:0] write_data;
output [31:0] read_data1, read_data2;

reg [31:0] storage_reg [31:0];
integer i;
always @(negedge clk, posedge reset)
begin
	//#5
	if (reset)
		begin
			for (i = 0; i <= 31; i = i + 1)
			begin
				storage_reg[i] <= 32'b0;
			end
		end
	else
	begin
		if (reg_write) storage_reg[read_reg2] <= write_data;
	end
end
//always @(write_data, read_reg2)
//begin
	
//end
assign read_data1 = storage_reg[read_reg1];
assign read_data2 = storage_reg[read_reg2];
endmodule
