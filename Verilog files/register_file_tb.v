`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////

module register_file_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] read_reg1;
	reg [4:0] read_reg2;
	reg reg_write;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;
	integer k;
	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.clk(clk), 
		.reset(reset), 
		.read_reg1(read_reg1), 
		.read_reg2(read_reg2), 
		.reg_write(reg_write), 
		.write_data(write_data), 
		.read_data1(read_data1), 
		.read_data2(read_data2)
	);
	initial forever #5 clk = ~clk;
	//initial $monitor("time = ", $time,, "read_data1 = %b, read_data2 = %b", read_data1, read_data2);
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		read_reg1 = 0;
		read_reg2 = 0;
		reg_write = 0;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#1;
		reset = 1;
		reg_write = 0;
		#5
		reset = 0;
	end
	initial begin
		#7
		reg_write = 1;
		for (k = 0; k < 32; k= k + 1)
		begin
			read_reg2 = k; write_data = 10*k; 
			#10 ;
		end
		#20
		reg_write = 0;
		for (k = 0; k <32; k = k + 2)
		begin
			read_reg1 = k;
			read_reg2 = k + 1;
			#5
			$display("reg_1[%2d] = %d, reg_2[%2d] = %d", read_reg1, read_data1, read_reg2, read_data2);
		end
		#200
		$finish;
	end
      
endmodule

