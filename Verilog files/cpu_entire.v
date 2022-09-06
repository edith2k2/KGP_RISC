`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Group : 7
// Members : 
// Battala Vamshi Krishna - 19CS10019
// Mahajan Rohan Raj - 19CS10042
// Assignment - 7
////////////////////////////////////////////////////////////////////////////////
module cpu_entire(
		clk,
		reset,
		clk_out,
		mem_address_out,
		instruction_out,
		output_pc_out,
		output_pc_inc,
		output_read_mem,
		output_pc_in,
		output_pc_result,
		output_branch_result,
		output_BranchSrc,
		output_ALUSrc,
		output_alu_result
    );
	 

input clk, reset;
output [1:0] output_ALUSrc;
output clk_out, output_branch_result, output_BranchSrc;
output [4:0] mem_address_out;
output [31:0] instruction_out, output_pc_out, output_pc_inc, output_read_mem, output_pc_in, 
					output_pc_result, output_alu_result;

wire [31:0] pc_in, pc_out, pc_inc, instruction, read_data1, read_data2;
wire [4:0] read_reg2;
wire WriteSrc, ImmSrc, MemToReg, RegWrite, MemRead, MemWrite, BranchSrc, ALUOp;
wire [1:0] Branch, ALUSrc;
wire [31:0] imm_32;
wire [15:0] imm_16;
wire [31:0] data1, data2;
//wire [4:0] shamt
wire [2:0] opSwitch, flagSwitch;
wire isLog, dir;
//
wire [31:0] alu_result;
//
wire [31:0] read_mem;
wire [31:0] write_data;
wire [31:0] pc_result;
wire [31:0] imm_result, imm_result_shift;
wire flag, flag_result, branch_result;
assign clk_out = clk;
assign mem_address_out = pc_inc[6:2];
assign instruction_out = instruction;
assign output_pc_out = pc_out;
assign output_pc_inc = pc_inc;
assign output_read_mem = read_mem;
assign output_pc_in = pc_in;
assign output_pc_result = pc_result;
assign output_branch_result = branch_result;
assign output_BranchSrc = BranchSrc;
assign output_ALUSrc = ALUSrc;
assign output_alu_result = alu_result;
pc pc(
		.clk(clk),
		.reset(reset),
		.in_data(pc_in),
		.out_data(pc_out)
	);
add_32_bit add(
		.in_data1(pc_out),
		.in_data2(32'd4),
		.result(pc_inc)
	);
instr_memory instr_mem(
		.clk(~clk),
		.address(pc_out[6:2]),
		.instr_out(instruction)
	);

control control_unit(
		.reset(reset),
		.opcode(instruction[31:26]),
		.ALUSrc(ALUSrc), .Branch(Branch), .WriteSrc(WriteSrc), .ImmSrc(ImmSrc), .MemToReg(MemToReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .BranchSrc(BranchSrc), .ALUOp(ALUOp)
);
mux_5_bit_2x1 mux_5_reg(
		.in_data(instruction[25:21]),
		.control(WriteSrc),
		.out_data(read_reg2)
	);
register_file reg_file(
		.clk(clk),
		.reset(reset),
		.read_reg1(instruction[20:16]),
		.read_reg2(read_reg2),
		.reg_write(RegWrite),
		.write_data(write_data),
		.read_data1(read_data1),
		.read_data2(read_data2)
	);
mux_16_bit_2x1 mux_16_imm(
		.in_data1(instruction[20:5]),
		.in_data2(instruction[15:0]),
		.control(ImmSrc),
		.out_data(imm_16)
    );
sign_extend_16x32 extend_16_1(
		.in_data(imm_16),
		.out_data(imm_32)
    );
mux_32_bit_2x1 mux_32_alu_1(
		.in_data1(read_data1),
		.in_data2(imm_32),
		.control(ALUSrc[1]),
		.out_data(data1)
    );
mux_32_bit_2x1 mux_32_alu_2(
		.in_data1(read_data2),
		.in_data2(imm_32),
		.control(ALUSrc[0]),
		.out_data(data2)
    );
alu_control alu_control(
		.reset(reset),
		.ALUOp(ALUOp),
		.funcCode(instruction[4:0]),
		.isLog(isLog),
		.dir(dir),
		.opSwitch(opSwitch),
		.flagSwitch(flagSwitch)
    );
alu alu_unit(
		.data1(data1),
		.data2(data2),
		.opSwitch(opSwitch),
		.flagSwitch(flagSwitch),
		.shamt(instruction[9:5]),
		.isLog(isLog),
		.dir(dir),
		.flag(flag),
		.result(alu_result)
    );
data_memory data_mem(
		.clk(clk),
		.reset(reset),
		.memRead(MemRead),
		.memWrite(MemWrite),
		.address(alu_result[9:0]),
		.data_in(read_data2),
		.data_out(read_mem)
    );
mux_32_bit_2x1 mux_32_mem(
		.in_data1(read_mem),
		.in_data2(alu_result),
		.control(MemToReg),
		.out_data(write_data)
    );
//
//
//
//
//
//
//
mux_32_bit_2x1 mux_32_pc(
		.in_data1(read_data2),
		.in_data2(imm_32),
		.control(BranchSrc),
		.out_data(imm_result)
    );
shift_left_2_32 shift_left_unit(
		.in_data(imm_result),
		.out_data(imm_result_shift)
    );
add_32_bit add_32_pc(
		.in_data1(pc_inc),
		.in_data2(imm_result_shift),
		.result(pc_result)
    );
and and_branch(
		flag_result,
		Branch[1],
		flag
	);
or or_branch(
		branch_result,
		Branch[0],
		flag_result
	);
mux_32_bit_2x1 mux_32_branch(
		.in_data1(pc_inc),
		.in_data2(pc_result),
		.control(branch_result),
		.out_data(pc_in)
    );
endmodule
