`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module cpu_entire_tb;

	// Inputs
	reg clk;
	reg reset;
	parameter p = 10;
	//outputs
	wire clk_out, output_branch_result, output_BranchSrc;
	wire [1:0] output_ALUSrc;
	wire [4:0] mem_address_out;
	wire [31:0]instruction_out, output_pc_out, output_pc_inc, output_read_mem, output_pc_in, 
			output_pc_result, output_alu_result;
	// Instantiate the Unit Under Test (UUT)
	cpu_entire uut (
		.clk(clk), 
		.reset(reset),
		.clk_out(clk_out),
		.mem_address_out(mem_address_out),
		.instruction_out(instruction_out),
		.output_pc_out(output_pc_out),
		.output_pc_inc(output_pc_inc),
		.output_read_mem(output_read_mem),
		.output_pc_in(output_pc_in),
		.output_pc_result(output_pc_result),
		.output_branch_result(output_branch_result),
		.output_BranchSrc(output_BranchSrc),
		.output_ALUSrc(output_ALUSrc),
		.output_alu_result(output_alu_result)
	);
	initial forever #p clk = ~clk;
	//initial #(24*p) $finish;
	initial begin
		//$dumpvars(0, cpu_entire);
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#(3*p - 2);
        
		// Add stimulus here
		reset = 1;
		//#p;
		#(p<<1)
		reset = 0;
		
	end
      
endmodule

