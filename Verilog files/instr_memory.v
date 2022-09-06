`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module instr_memory(
		clk,
		address,
		instr_out
    );
	 
input clk;
input [4 : 0] address;
output [31 : 0] instr_out;

blk_ram instr_mem(
		.clka(clk),
		.addra(address),
		.douta(instr_out)
	);
	//clka,
  //wea,
  //addra,
  //dina,
  //douta



endmodule
