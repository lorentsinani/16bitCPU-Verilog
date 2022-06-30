`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2022 12:31:36 PM
// Design Name: 
// Module Name: Adder_16bit
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
module Adder_16bit(
    input [15:0] A,
    input [15:0] B,
    output CarryOut,
    output [15:0] Result
    );
wire [14:0] COUT;   
Adder_1bit adder16bit_0(A[0], B[0], 0, Result[0], COUT[0]);    
Adder_1bit adder16bit_1(A[1], B[1], COUT[0], Result[1], COUT[1]);    
Adder_1bit adder16bit_2(A[2], B[2], COUT[1], Result[2], COUT[2]);    
Adder_1bit adder16bit_3(A[3], B[3], COUT[2], Result[3], COUT[3]);   
Adder_1bit adder16bit_4(A[4], B[4], COUT[3], Result[4], COUT[4]);    
Adder_1bit adder16bit_5(A[5], B[5], COUT[4], Result[5], COUT[5]);    
Adder_1bit adder16bit_6(A[6], B[6], COUT[5], Result[6], COUT[6]);    
Adder_1bit adder16bit_7(A[7], B[7], COUT[6], Result[7], COUT[7]);  
Adder_1bit adder16bit_8(A[8], B[8], COUT[7], Result[8], COUT[8]);    
Adder_1bit adder16bit_9(A[9], B[9], COUT[8], Result[9], COUT[9]);    
Adder_1bit adder16bit_10(A[10], B[10], COUT[9], Result[10], COUT[10]);    
Adder_1bit adder16bit_11(A[11], B[11], COUT[10], Result[11], COUT[11]);  
Adder_1bit adder16bit_12(A[12], B[12], COUT[11], Result[12], COUT[12]);    
Adder_1bit adder16bit_13(A[13], B[13], COUT[12], Result[13], COUT[13]);    
Adder_1bit adder16bit_14(A[14], B[14], COUT[13], Result[14], COUT[14]);    
Adder_1bit adder16bit_15(A[15], B[15], COUT[14], Result[15], CarryOut);   
endmodule
