`timescale 1ns/1ps

////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module control_tb;
    reg rst;
  reg [5:0] opcode;
  wire [1:0] ALUSrc;
  wire [1:0] Branch;
    wire WriteSrc,ImmSrc,MemToReg,RegWrite,MemRead,MemWrite,BranchSrc,ALUOp;
    control uut(
        .rst(rst),
        .opcode(opcode),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .WriteSrc(WriteSrc),
        .ImmSrc(ImmSrc),
        .MemToReg(MemToReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .BranchSrc(BranchSrc),
        .ALUOp(ALUOp)
    );
    initial begin
        rst = 1;
        #10 rst = 0; opcode = 000000;
        #10 opcode = 100000;
    end

endmodule