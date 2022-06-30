`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 08:31:49 PM
// Design Name: 
// Module Name: CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU(input Clock);

reg[15:0] PC_Initial;
reg[15:0] PCPlus4;
reg[15:0] PC;
reg[15:0] PC_CURRENT;
reg[15:0] PC_BEQ;
reg[15:0] PC_JUMP;
wire[15:0] Instruction;
wire[15:0] BEQPC;
wire[15:0] JUMPPC;

initial
begin
assign PC_Initial = 16'd0;
end

always@(posedge Clock)
begin
assign PC = (Jump) ? JUMPPC : BEQPC; //BEQ EDHE BNE NKET RAST ISHIN KON NJEJT NKOD
end

InstructionMemory IM(PC, Instruction);

DataPath DP(Clock, PC, RegDst,
Jump,
Branch,
MemRead,
MemWrite,
MemToReg,
ALUSrc,
RegWrite,
ALUOp,
Instruction, BEQPC, JUMPPC);

ControlUnit CU(Instruction[15:10],RegDst,
Jump,
Branch,
MemRead,
MemWrite,
MemToReg,
ALUSrc,
RegWrite,
ALUOp);

endmodule
