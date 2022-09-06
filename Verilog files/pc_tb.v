`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module pc_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] in_data;

	// Outputs
	wire [31:0] out_data;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.clk(clk), 
		.reset(reset), 
		.in_data(in_data), 
		.out_data(out_data)
	);
	initial forever #15 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		in_data = 0;

		// Wait 100 ns for global reset to finish
		#90;
        
		// Add stimulus here
		reset = 1;
		
		#30
		reset = 0;
		in_data = 30;
		#30
		in_data = 40;
	end
      
endmodule

