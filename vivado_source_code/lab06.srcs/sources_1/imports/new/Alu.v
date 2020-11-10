`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 20:25:40
// Design Name: 
// Module Name: Alu
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


module Alu(
    input [31:0] input1,
    input [31:0] input2,
    input [4:0] aluCtr,
    input [4:0] shamet,
    output reg zero,
    output reg[31:0] aluRes
    );
    initial begin
        zero=0;
        aluRes=0;
    end
    always @(input1 or input2 or aluCtr)
    begin
        case(aluCtr)
        5'b00010: aluRes=$signed(input1)+$signed(input2);
        5'b00110: aluRes=$signed(input1)-$signed(input2);
        5'b00000: aluRes=$signed(input1)&$signed(input2);
        5'b00001: aluRes=$signed(input1)|$signed(input2);
        5'b01100: aluRes=~($signed(input1)|$signed(input2));
        5'b00011: aluRes=$unsigned(input2)<<shamet;
        5'b00100: aluRes=$unsigned(input2)>>shamet;
        5'b01000: aluRes=$signed(input2);
        5'b00101: aluRes=$signed(input1)^$signed(input2);
        5'b01001: aluRes=$unsigned(input1)<<$unsigned(input2);
        5'b01010: aluRes=$unsigned(input1)>>$unsigned(input2);
        5'b01011: aluRes=$signed(input2)>>shamet;
        5'b01101: aluRes=$signed(input1)>>$unsigned(input2);
        5'b10000: aluRes={input2[15:0],{16'h0000}};
        5'b00111:
             begin
                if($signed(input1)<$signed(input2))
                    aluRes=1;
                else
                    aluRes=0;
            end     
        5'b01110:
            begin
                if($unsigned(input1)<$unsigned(input2))
                    aluRes=1;
                else
                    aluRes=0;            
            end
        default:
                aluRes=0; 
        endcase
        if(aluRes==0)
            zero=1;
        else
            zero=0;
    end
endmodule
