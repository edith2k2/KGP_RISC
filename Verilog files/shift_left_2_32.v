`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module shift_left_2_32(
		in_data,
		out_data
    );
input [31:0] in_data;
output [31:0] out_data;

assign out_data = in_data << 2;
endmodule
