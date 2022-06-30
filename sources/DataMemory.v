`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 06:23:23 PM
// Design Name: 
// Module Name: DataMemory
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
module DataMemory(input[15:0] Adresa, input[15:0] WriteData,
 input Clock, input MemWrite, input MemRead, output[15:0] ReadData);
reg[7:0] dMem[127:0];

initial $readmemb("dataMemory.mem", dMem);

always @(posedge Clock)
begin

if(MemWrite) 
begin
dMem[Adresa] <= WriteData[15:8];
dMem[Adresa+1] <= WriteData[7:0];
end

end

always @(negedge Clock)
begin
$writememb("dataMemory.mem", dMem);
end
assign ReadData = {dMem[Adresa],dMem[Adresa+1]};
endmodule
