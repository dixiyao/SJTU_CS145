`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 17:11:34
// Design Name: 
// Module Name: Ctr
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


module Ctr(
    input  [31:0] Instruction,
    input reset,
    output reg regDst,
    output reg aluSrc,
    output reg memToReg,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg Branch,
    output reg [3:0] ALUOp,
    output reg Jump,
    output reg jr,
    output reg jal,
    output reg equal,
    output reg unsignedext
    );
    reg [5:0] opCode;
    initial begin
        regDst=0;
        aluSrc=0;
        memToReg=0;
        regWrite=0;
        memRead=0;
        memWrite=0;
        Branch=0;
        ALUOp=4'b0000;
        Jump=0; 
        jr=0;
        equal=0;
        unsignedext=0;
    end
    always @(Instruction or posedge reset)
    begin 
      if(Instruction==0)
      begin
        regDst=0;
        aluSrc=0;
        memToReg=0;
        regWrite=0;
        memRead=0;
        memWrite=0;
        Branch=0;
        ALUOp=4'b0000;
        Jump=0; 
        jr=0;
        equal=0;
        unsignedext=0;
      end
      else
      begin
      if(reset)
        Branch=0;
      else
      begin
      opCode=Instruction[31:26];
      jr=0;
      equal=0;
      unsignedext=0;
      case(opCode)
        6'b000000:
        begin
            regDst=1;
            aluSrc=0;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0010;
            Jump=0;
       end
       6'b001111:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b1000;
            Jump=0;
       end
       6'b100011:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=1;
            regWrite=1;
            memRead=1;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0000;
            Jump=0;
       end
       6'b101011:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=1;
            Branch=0;
            ALUOp=4'b0000;
            Jump=0;
       end 
       6'b000100:
       begin
            regDst=0;
            aluSrc=0;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=0;
            Branch=1;
            ALUOp=4'b1111;
            Jump=0;
            equal=1;
       end      
       6'b000101:
       begin
            regDst=0;
            aluSrc=0;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=0;
            Branch=1;
            ALUOp=4'b1111;
            Jump=0;
            equal=0;
       end  
       6'b000010:
       begin
            regDst=0;
            aluSrc=0;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0000;
            Jump=1;
       end  
       6'b001000:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0100;
            Jump=0;
       end    
       6'b001001:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0100;
            Jump=0;
       end     
       6'b001100:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0101;
            Jump=0;
       end     
       6'b001101:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0110;
            Jump=0;
       end       
       6'b001110:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0011;
            Jump=0;
       end   
       6'b001010:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0111;
            Jump=0;
       end 
       6'b001011:
       begin
            regDst=0;
            aluSrc=1;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0111;
            Jump=0;
            unsignedext=1;
       end 
       6'b000011:
       begin
            regDst=0;
            aluSrc=0;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0000;
            Jump=1;            
       end      
       default:
       begin
            regDst=0;
            aluSrc=0;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0000;
            Jump=0; 
            jr=0;
            equal=0;
            unsignedext=0;
       end         
    endcase
    if((Instruction[31:26]==6'b000000) && (Instruction[5:0]==6'b001000))
        begin
            regDst=0;
            aluSrc=0;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=0;
            Branch=0;
            ALUOp=4'b0000;
            Jump=1;
            jr=1;
        end
    jal=regWrite&Jump;
    end
    end
    end
endmodule
