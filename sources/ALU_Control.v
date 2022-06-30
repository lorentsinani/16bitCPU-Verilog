`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 08:45:44 PM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    input [2:0] opcode,
    input [1:0] ALUOp,
    input [3:0] Funct,
    output reg [3:0] Operacioni
    );    
always @(ALUOp)
begin    
case(ALUOp) 
2'b00:
begin
assign Operacioni = 4'b0100; //add
end
2'b01:
begin
assign Operacioni = 4'b1100; //sub
end
2'b10: //varet nga funct
begin
    case(Funct)
    4'b1101:
    begin
    assign Operacioni = 4'b0011; //xor
    end
    4'b0000:
    begin
    assign Operacioni = 4'b0100; //add
    end
    4'b0001:
    begin
    assign Operacioni = 4'b1100; //sub
    end
    4'b0010:
    begin
    assign Operacioni = 4'b0111; // MOD
    end
    endcase
end  

2'b11: //ne baze te opcode
begin
    case(opcode)
    3'b100:
    begin
    assign Operacioni = 4'b0001; // SLTI
    end
    3'b011:
    begin
    assign Operacioni = 4'b0101; //ADDI
    end
    3'b010:
    begin
    assign Operacioni = 4'b0010; //ORI
    end
    3'b001:
    begin
    assign Operacioni = 4'b0000; //ANDI
    end
    endcase
end
endcase
end        
endmodule