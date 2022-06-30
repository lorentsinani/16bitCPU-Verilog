`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 03:39:09 PM
// Design Name: 
// Module Name: modFunction
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

//vetem per mod pozitiv
module modFunction(
    input Hyrja1, //A
    input Hyrja2, //B
    output Dalja //MOD
    );

//Hyrja1 % Hyrja 2 = Dalja
integer num2, num1;

initial
begin
num2 = Hyrja2;
num1 = Hyrja1;
while(num2 < num1)
begin
assign num2 = num2 + Hyrja2;
end
assign num2 = num2 - Hyrja2;
end

assign Dalja = num1 - num2;

endmodule
