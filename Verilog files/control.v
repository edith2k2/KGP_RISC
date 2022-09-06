`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module control (
    input wire reset,
    input [5:0] opcode,
  	output reg [1:0] ALUSrc,
    output reg [1:0] Branch,
    output reg WriteSrc,ImmSrc,MemToReg,RegWrite,MemRead,MemWrite,BranchSrc,ALUOp
);
always@(opcode or reset) begin
    if(reset) begin
        ALUSrc <= 2'b00;
        Branch <= 2'b00;
        WriteSrc <= 0;
        ImmSrc <= 0;
        MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=0;
        MemWrite <=0;
        BranchSrc <=0;
        ALUOp <=0;
    end
    else begin
        case (opcode)
            6'b000000: begin             // R-type
                ALUSrc <= 2'b00;
                Branch <= 2'b00;
                WriteSrc <= 0;
                ImmSrc <= 0;
                MemToReg <= 1;
                RegWrite <= 1;
                MemRead <=0;
                MemWrite <=0;
                BranchSrc <=0;
                ALUOp <=1;
            end
            6'b001000: begin            // I-type
                ALUSrc <= 2'b10;
                Branch <= 2'b00;
                WriteSrc <= 0;
                ImmSrc <= 0;
                MemToReg <= 1;
                RegWrite <= 1;
                MemRead <=0;
                MemWrite <=0;
                BranchSrc <=0;
                ALUOp <=1;
            end
            6'b100000: begin            // load
                ALUSrc <= 2'b01;
                Branch <= 2'b00;
                WriteSrc <= 0;
                ImmSrc <= 1;
                MemToReg <= 0;
                RegWrite <= 1;
                MemRead <=1;
                MemWrite <=0;
                BranchSrc <=0;
                ALUOp <=0;
            end
            6'b100001: begin            // store
                ALUSrc <= 2'b01;
                Branch <= 2'b00;
                WriteSrc <= 0;
                ImmSrc <= 1;
                MemToReg <= 0;
                RegWrite <= 0;
                MemRead <=0;
                MemWrite <=1;
                BranchSrc <=0;
                ALUOp <=0;
            end
            6'b010000: begin            // b
                ALUSrc <= 2'b00;
                Branch <= 2'b01;
                WriteSrc <= 0;
                ImmSrc <= 0;
                MemToReg <= 0;
                RegWrite <= 0;
                MemRead <=0;
                MemWrite <=0;
                BranchSrc <=1;
                ALUOp <=1;
            end
            6'b010001: begin            // br
                ALUSrc <= 2'b00;
                Branch <= 2'b01;
                WriteSrc <= 0;
                ImmSrc <= 0;
                MemToReg <= 0;
                RegWrite <= 0;
                MemRead <=0;
                MemWrite <=0;
                BranchSrc <=0;
                ALUOp <=1;
            end
            6'b010010: begin            // bltz, bz, bnz, bcy, bncy
                ALUSrc <= 2'b00;
                Branch <= 2'b10;
                WriteSrc <= 0;
                ImmSrc <= 0;
                MemToReg <= 0;
                RegWrite <= 0;
                MemRead <=0;
                MemWrite <=0;
                BranchSrc <=1;
                ALUOp <=1;
            end
            6'b010011: begin            // bl
                ALUSrc <= 2'b00;
                Branch <= 2'b10;
                WriteSrc <= 1;
                ImmSrc <= 0;
                MemToReg <= 0;
                RegWrite <= 0;
                MemRead <=0;
                MemWrite <=0;
                BranchSrc <=1;
                ALUOp <=1;
            end
				default:begin
					ALUSrc <= 2'b00;
					Branch <= 2'b00;
					WriteSrc <= 0;
					ImmSrc <= 0;
					MemToReg <= 0;
					RegWrite <= 0;
					MemRead <=0;
					MemWrite <=0;
					BranchSrc <=0;
					ALUOp <=0;
				end
        endcase
    end
end

    
endmodule

