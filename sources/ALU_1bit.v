`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 04:41:23 PM
// Design Name: 
// Module Name: ALU_1bit
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
module ALU_1bit(
    input A,
    input B,
    input CIN,
    input Bnegate,
    input Less,
    input [2:0] Operation,
    output Result,
    output COUT
    );
    
wire JoA, JoB, mB, And, Or, AddnSub, Xor, Ori, Addi, Slti, Mod, Less;//telat edhe per instruksione tjera
    
assign JoA = ~A;
assign JoB = ~B;

mux2ne1 muxB(B, JoB, Bnegate, mB);
SltiFunction sltiFunc(A, B, Slti);
modFunction modFunc(A, B, Mod);
//Nese deshirojm qe me i be assign telat sipas opcode qe na vjen atehere eshte si me poshte
//    always @(A or B or Operation)
//    begin
//    case(Operation)
//    3'b000: assign Andi = A & mb; //AND
//    3'b001: assign Slti = ; //todo
//    3'b010: assign Ori = A | mB
//    3'b011: assign Xor = (JoA & B) | (A & JoB); //XOR
//    3'b100: assign AddnSub = A + mb;
//    3'b101: assign Addi = A + mb;//
//    3'b111: assign Mod = ; //todo
//    endcase
//    end

assign And = A & mB;
//assign Sub = A + mB;
assign Or = A | mB;

assign Andi = A & mB; 
assign Xor = (JoA & B) | (A & JoB); // Xor = A ^ mB
//assign AddnSub = A + mB;
//assign Addi = A + mB; //njejt si addnsub veqse dallohet ne hyrje a i vjen reg apo imm

Adder_1bit AddiFunc(A, mB, CIN, Addi, COUT);
Adder_1bit Adder(A, mB, CIN, AddnSub, COUT);  

mux8ne1 muxAlu(Andi, Slti, Ori, Xor, AddnSub, Addi, Mod, Less, Operation, Result); //mux8ne1
endmodule
