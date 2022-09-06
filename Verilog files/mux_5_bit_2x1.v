`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module mux_5_bit_2x1(
		in_data,
		control,
		out_data
    );
input control;
input [4:0] in_data;
output reg[4:0] out_data;

always @(*)
begin
	if (control) out_data <= 5'b11111;
	else out_data <= in_data;
end

endmodule
