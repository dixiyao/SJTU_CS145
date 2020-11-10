`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 16:45:55
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
    input Clk,
    input [31:0] address,
    input [31:0] writeData,
    input memWrite,
    input memRead,
    output reg [31:0] readData
    );
    reg [31:0] memFile [0:63];
    initial begin
             $readmemh("C:/Archlabs/lab06/lab06.srcs/Src/data.txt",memFile);
             readData=0;
    end
    always @(negedge Clk)
        begin
            if(memRead==1)
                readData<=memFile[address];
        end
    
    always @ (address)
        begin
            if(memWrite==1)
                memFile[address]=writeData;
        end
endmodule
