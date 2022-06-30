`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 09:06:23 PM
// Design Name: 
// Module Name: InstructionMemory_Test
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


module InstructionMemory_Test();
reg[15:0] PC;
wire[15:0] Instruction;
initial
begin
#0 PC=16'd10;
#5 PC=16'd12;
#5 PC=16'd14;
#5 PC=16'd16;
#5 PC=16'd18;
#5 $stop;
end
InstructionMemory IM(PC,Instruction);
endmodule
