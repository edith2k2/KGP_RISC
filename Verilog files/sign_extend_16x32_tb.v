`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module sign_extend_16x32_tb;

	// Inputs
	reg [15:0] in_data;

	// Outputs
	wire [31:0] out_data;

	// Instantiate the Unit Under Test (UUT)
	sign_extend_16x32 uut (
		.in_data(in_data), 
		.out_data(out_data)
	);

	initial begin
		// Initialize Inputs
		in_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in_data = 16'b1000100010001000;
		# 30
		in_data = 16'b0111111111111111;
	end
      
endmodule

