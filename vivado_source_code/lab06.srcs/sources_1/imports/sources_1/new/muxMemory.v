`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/29 21:05:38
// Design Name: 
// Module Name: muxMemory
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


module muxMemory(
    input [31:0] input1,
    input [31:0] input2,
    input select,
    input ifjal,
    input [31:0]saveaddress,
    output reg [31:0] output1
    );
    initial begin
    output1=0;
    end
    always @(*)
    begin
        if(ifjal)
            output1=saveaddress;
        else
            output1=select?input1:input2;
    end
endmodule
