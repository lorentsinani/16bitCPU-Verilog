`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 09:03:35 PM
// Design Name: 
// Module Name: CPUTest
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


module CPUTest();

reg Clock;

initial 
begin
#0 Clock = 1'b0; //#5 Clock = 1'b0; 
#100 Clock = 1'b0; // #10 Clock = 1'b1;
end

always
begin
    #5 Clock = ~Clock;
end

CPU cpu(Clock);
endmodule
