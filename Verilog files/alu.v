`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module alu(
		data1,
		data2,
		opSwitch,
		flagSwitch,
		shamt,
		isLog,
		dir,
		flag,
		result
    );
input [31:0] data1, data2;
input [2:0] opSwitch, flagSwitch;
input [4:0] shamt;
input isLog, dir;
output reg flag;
output reg [31:0] result;
reg carry_flag, zero_flag, sign_flag;
always @(*) begin
	 if (flagSwitch == 3'b111 && opSwitch == 3'b000)begin
			result <= data1 + data2;
	 end
	 else begin
		case (opSwitch)
			3'b000: {carry_flag, result} <= data1 + data2;
			3'b001: result <= data1 & data2;
			3'b010: result <= data1 ^ data2;
			3'b011: result <= ~data1 + 1;
			3'b100: begin
					if(isLog) begin
						if(dir)
							result <= data2<<shamt;
						else
							result <= data2>>shamt;
					end
					else
						result <= data2>>>shamt;
			end
			default: result <= 32'b0;
		endcase
		zero_flag <= (result == 32'b0)?1:0;
		sign_flag <= result[31];
		case (flagSwitch) 
			3'b000: flag <= carry_flag;
			3'b001: flag <= ~carry_flag;
			3'b010: flag <= ~zero_flag;
			3'b011: flag <= zero_flag;
			3'b100: flag <= sign_flag; 
			//3'b111: begin
				//		zero_flag <= 1'b0;
				//		sign_flag <= 1'b0;
				//		carry_flag <= 1'b0;
				//		flag <= 1'b0;
			//end
			default:flag <= 0;
		endcase
	end
end

endmodule
