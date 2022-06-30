`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022   10:27:13 AM
// Design Name: 
// Module Name: DataPath
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
module DataPath(
input Clock, 
input RegDst, Branch, MemRead, 
MemWrite, RegWrite, MemToReg, ALUSrc, 
input [1:0] ALUOp, 
output [2:0] opcode 
);


reg[15:0] pc_initial; 
wire [15:0] pc_next, pc4, pcbne; 
wire [15:0] instruction, instr; 
wire [2:0] mux_regfile; 
wire[15:0] readData1, readData2, writeData, 
mux_ALU, ALU_Out, Zgjerimi, memToMux, 
shifter2beq, branchAdderToMux, beqAddress, jumpAddress; 
wire[3:0] ALUCtrl; 
wire zerof, overflow, carryout; 
wire andMuxBranch; 

initial
begin
    pc_initial = 16'd10; 
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; 
    
end


assign pc4 = pc_initial + 2; 


assign shifter2beq = {{8{instruction[6]}}, instruction[6:0], 1'b0};

InstructionMemory IM(pc_initial, instruction); 


assign mux_regfile = (RegDst == 1'b1) ? instruction[6:4] : instruction[9:7]; 


assign Zgjerimi = {{9{instruction[6]}}, instruction[6:0]};  



RegisterFile RF(instruction[12:10], instruction[9:7], mux_regfile, writeData, RegWrite, Clock, readData1, readData2 ); 


assign mux_ALU = (ALUSrc == 1'b1) ? Zgjerimi : readData2; 


ALU_Control AC(ALUOp, instr[3:0], instruction[15:13], ALUCtrl); 

// [15:0] A, [15:0] B, [2:0] Operation, BNegate, Zero, Overflow, CarryOut, [15:0] Result
ALU_16bit ALU(readData1, mux_ALU, ALUCtrl[2:0], ALUCtrl[3], zerof,  overflow, carryout, ALU_Out);


DataMemory DM(ALU_Out, MemWrite, MemRead, Clock, memToMux);


assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;


assign andMuxBranch = ~(zerof & Branch);


assign beqAddress = pc4 + shifter2beq; 


assign pc_next = (andMuxBranch == 1'b1) ? beqAddress : pc4;

assign opcode = instruction[15:13];

endmodule
