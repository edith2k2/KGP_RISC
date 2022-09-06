`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module add_32_bit(
		in_data1,
		in_data2,
		result
    );
input [31:0] in_data1, in_data2;
output [31:0] result;

assign result = in_data1 + in_data2;
endmodule
