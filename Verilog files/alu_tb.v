`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
  reg [31:0] data1;
  reg [31:0] data2;
  reg [2:0] opSwitch;
  reg [2:0] flagSwitch;
  reg [4:0] shamt;
  reg isLog;
  reg dir;

	// Outputs
	wire [31:0] result;
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
      .data1(data1), 
      .data2(data2), 
      .opSwitch(opSwitch), 
		.flagSwitch(flagSwitch),
      .shamt(shamt), 
      .isLog(isLog), 
      .dir(dir), 
	  .flag(flag), 
      .result(result)
	);

	initial begin
		// Initialize Inputs
		data1 = 0;
		data2 = 0;
      	opSwitch = 0;
      	flagSwitch = 0;

		// Wait 10 ns for global reset to finish
      
		// Add stimulus here

		#10;
		opSwitch = 0;
		data1 = 20;
		data2 = 10;
		flagSwitch = 3'b010;
		#20;
		opSwitch = 3;
		data1 = 59;
		data2 = 32;
		flagSwitch = 3'b000;
		#20;
		opSwitch = 4;
		data1 = 987;
		data2 = 983;
      	isLog = 1;
      	dir = 1;
      	shamt = 3;
      	#20;
	end
      
endmodule

