`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 02:44:08 PM
// Design Name: 
// Module Name: SltiFunction
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


module SltiFunction(
    input rs, // A
    input immediate, // mB
    output rt // slti
      );
      
assign rt = (rs < immediate) ? 1 : 0;
endmodule
