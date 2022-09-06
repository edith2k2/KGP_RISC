`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module alu_control_tb;

	// Inputs
	reg reset;
	reg ALUOp;
	reg [4:0] funcCode;

	// Outputs
	wire isLog;
	wire dir;
	wire [2:0] opSwitch;
	wire [2:0] flagSwitch;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.reset(reset), 
		.ALUOp(ALUOp), 
		.funcCode(funcCode), 
		.isLog(isLog), 
		.dir(dir), 
		.opSwitch(opSwitch), 
		.flagSwitch(flagSwitch)
	);
	//initial forever #15 clk = ~clk;
	initial begin
		// Initialize Inputs
		reset = 0;
		ALUOp = 0;
		funcCode = 0;

		// Wait 100 ns for global reset to finish
		#75;
		// Add stimulus here
		reset = 1;
		#30
		reset = 0;
		ALUOp = 0;
		funcCode = 3'd4;
		#30
		ALUOp = 1;
	end
      
endmodule

