`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module alu_control(
			reset,
			ALUOp,
			funcCode,
			isLog,
			dir,
			opSwitch,
			flagSwitch
    );
input  reset, ALUOp;
input [4:0] funcCode;
output reg isLog, dir;
output reg [2:0] opSwitch, flagSwitch;
    always@(funcCode or reset or ALUOp) begin
        if(reset) begin
            isLog <= 0;
            dir  <= 0;
            opSwitch <= 3'b111;
            flagSwitch <= 3'b111;
        end
        else begin
            if(~ALUOp) begin
                opSwitch <= 3'b000;
					 flagSwitch <= 3'b111;
            end
            else begin
               case (funcCode)
                    5'b00000: begin
                        opSwitch <= 3'b000;
                    end 
                    5'b00001: begin
                        opSwitch <= 3'b011;
                    end 
                    5'b00010: begin
                        opSwitch <= 3'b001;
                    end 
                    5'b00011: begin
                        opSwitch <= 3'b100;
                    end 
                    5'b00100: begin
                        opSwitch <= 3'b100;
                        isLog <= 1'b1;
                        dir <= 1'b1;
                    end 
                    5'b00101: begin
                        opSwitch <= 3'b100;
                        isLog <= 1'b1;
                        dir <= 1'b0;
                    end 
                    5'b00110: begin
                        opSwitch <= 3'b100;
                        isLog <= 1'b0;
                        dir <= 1'b0;
                    end 
                    5'b01000: begin
                        flagSwitch <= 3'b100;
                    end 
                    5'b01001: begin
                        flagSwitch <= 3'b011;
                    end 
                    5'b01010: begin
                        flagSwitch <= 3'b010;
                    end 
                    5'b01011: begin
                        flagSwitch <= 3'b000;
                    end 
                    5'b01100: begin
                        flagSwitch <= 3'b001;
                    end 
                    default: begin
                        isLog <= 0;
                        dir  <= 0;
                        opSwitch <= 3'b111;
                        flagSwitch <= 3'b111;
                    end
                endcase 
            end
        end
    end
    


endmodule
