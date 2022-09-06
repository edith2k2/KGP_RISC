`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module sign_extend_16x32(
		in_data,
		out_data
    );
input [15:0] in_data;
output [31:0] out_data;

assign out_data = {{16{in_data[15]}}, in_data[15:0]};

endmodule
