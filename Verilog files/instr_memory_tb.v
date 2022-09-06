`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module instr_memory_tb;

	// Inputs
	reg clk;
	reg [4:0] address;

	// Outputs
	wire [31:0] instr_out;

	// Instantiate the Unit Under Test (UUT)
	instr_memory uut (
		.clk(clk), 
		.address(address), 
		.instr_out(instr_out)
	);

	initial clk <= 0;
	initial forever #30 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		address = 0;

		// Wait 100 ns for global reset to finish
		#100;
       address = 1;
		 
		 #30
		 address = 2;
		// Add stimulus here

	end
      
endmodule

