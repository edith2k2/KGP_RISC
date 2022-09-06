`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module mux_32_bit_2x1_tb;

	// Inputs
	reg [31:0] in_data1;
	reg [31:0] in_data2;
	reg control;

	// Outputs
	wire [31:0] out_data;

	// Instantiate the Unit Under Test (UUT)
	mux_32_bit_2x1 uut (
		.in_data1(in_data1), 
		.in_data2(in_data2), 
		.control(control), 
		.out_data(out_data)
	);

	initial begin
		// Initialize Inputs
		in_data1 = 0;
		in_data2 = 0;
		control = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in_data1 = 32'b10110101101101011011010110110101;
		in_data2 = 32'b01101100011011000110110001101100;
		#30
		control = 1;
		in_data1 = 32'b11100110111001101110011011100110;
		in_data2 = 32'b01111110011111100111111001111110;
	end
      
endmodule

