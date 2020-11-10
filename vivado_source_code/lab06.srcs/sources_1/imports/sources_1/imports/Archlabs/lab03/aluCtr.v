`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 18:52:03
// Design Name: 
// Module Name: aluCtr
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


module aluCtr(
    input [3:0] ALUOp,
    input [5:0] funct,
    output reg [4:0] ALUCtrOut
    );
    initial begin
    ALUCtrOut=0;
    end
    always @ (ALUOp or funct)
    begin
        case (ALUOp)
            4'b0000: ALUCtrOut=5'b00010;
            4'b0001: ALUCtrOut=5'b00110;
            4'b0100: ALUCtrOut=5'b00010;
            4'b0101: ALUCtrOut=5'b00000;
            4'b0110: ALUCtrOut=5'b00001;
            4'b0011: ALUCtrOut=5'b00101;
            4'b0111: ALUCtrOut=5'b00111;
            4'b1000: ALUCtrOut=5'b10000;
        4'b0010: 
        begin
            case (funct)
            6'b100000:ALUCtrOut=5'b00010;//add
            6'b100001:ALUCtrOut=5'b00010;//addu
            6'b100010:ALUCtrOut=5'b00110;//sub
            6'b100011:ALUCtrOut=5'b00110;//subu
            6'b100100:ALUCtrOut=5'b00000;//and
            6'b100101:ALUCtrOut=5'b00001;//or
            6'b100110:ALUCtrOut=5'b00101;//xor
            6'b100111:ALUCtrOut=5'b01100;//nor
            6'b101010:ALUCtrOut=5'b00111;//slt
            6'b101011:ALUCtrOut=5'b01110;//sltu
            6'b000000:ALUCtrOut=5'b00011;//sll
            6'b000010:ALUCtrOut=5'b00100;//slr
            6'b000011:ALUCtrOut=5'b01011;//sra
            6'b000100:ALUCtrOut=5'b01001;//sllv
            6'b000110:ALUCtrOut=5'b01010;//slrv
            6'b000111:ALUCtrOut=5'b01101;//srav
            6'b001000:ALUCtrOut=5'b01000;
            default:ALUCtrOut=5'b01111;
            endcase
        end
        default:
            ALUCtrOut=5'b01111;
        endcase
    end
endmodule
