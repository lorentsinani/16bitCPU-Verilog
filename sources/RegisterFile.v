`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2022 05:26:23 PM
// Design Name: 
// Module Name: RegisterFile
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
module RegisterFile(
input[2:0] RS,
input[2:0] RT,
input[2:0] RD,
input[15:0] WriteData,
output[15:0] ReadRS,
output[15:0] ReadRT,
input RegWrite,
input Clock);

reg [15:0] Registers[7:0];

always @(posedge Clock)
begin  

if(RegWrite)
begin
Registers[RD] <= WriteData;
end

end

assign ReadRS = Registers[RS];
assign ReadRT = Registers[RT];
endmodule

