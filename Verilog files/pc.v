`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module pc(
		clk,
		reset,
		in_data,
		out_data
    );
input clk, reset;
input [31:0] in_data;
output reg [31:0] out_data;

always @(posedge clk, posedge reset)
begin
	if (reset) out_data <= 32'b0;
	else out_data <= in_data;
end
endmodule
