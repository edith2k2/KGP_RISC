`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module mux_16_bit_2x1(
		in_data1,
		in_data2,
		control,
		out_data
    );
input control;
input [15:0] in_data1, in_data2;
output reg [15:0] out_data;

always @(*)
begin
	if (control) out_data <= in_data2;
	else out_data <= in_data1;
end

endmodule
