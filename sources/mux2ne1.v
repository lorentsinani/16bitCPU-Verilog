`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2022 02:49:58 PM
// Design Name: 
// Module Name: mux2ne1
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

module mux2ne1(
    input Hyrja0, //B
    input Hyrja1, // JOB
    input S, // Bnegate
    output Dalja // mB
    );
    
assign Dalja = S ? Hyrja1 : Hyrja0;

endmodule