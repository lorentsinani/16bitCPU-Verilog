`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 02:52:35 PM
// Design Name: 
// Module Name: mux8ne1
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


module mux8ne1(
    input Hyrja0,
    input Hyrja1,
    input Hyrja2,
    input Hyrja3,
    input Hyrja4,
    input Hyrja5,
    input Hyrja6,
    input Hyrja7,
    input [2:0] S,
    output Dalja
    );
    
//    s 000 h0  ANDI
//    s 001 h1  SLTI
//    s 010 h2  ORI
//    s 011 h3  XOR
//    s 100 h4  SUB/ ADD
//    s 101 h5  ADDI
//    s 111 h6  Mod 
//    s 110 h7  LESS

    assign Dalja = S[2] ? (S[1] ? (S[0] ? Hyrja7 : Hyrja6) : (S[0] ? Hyrja5 : Hyrja4)) : (S[1] ? (S[0] ? Hyrja3 : Hyrja2): (S[0] ? Hyrja1: Hyrja0));

endmodule
