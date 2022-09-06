`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module data_memory_tb;

	// Inputs
	reg clk;
	reg reset;
	reg memRead;
	reg memWrite;
	reg [9:0] address;
	reg [31:0] data_in;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.clk(clk), 
		.reset(reset), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.address(address), 
		.data_in(data_in), 
		.data_out(data_out)
	);
	
	initial forever #15 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		memRead = 0;
		memWrite = 0;
		address = 0;
		data_in = 0;


		#105;
        
		// Add stimulus here
		reset = 1;
		#30 reset = 0;

		#30;
		address = 9;
		data_in = 32'd748;
		memRead = 0;
		memWrite = 1;

		#30;
		data_in = 32'd543;
		memRead = 1;
		memWrite = 0;


		// A sequence of steps in which the same register is exploited
		

		#30;
		address = 0;
		data_in = 32'd2;
		memRead = 0;
		memWrite = 1;

		#30;
		address = 0;
		data_in = 32'd2;
		memRead = 1;
		memWrite = 0;
	end
      
endmodule

