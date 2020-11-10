`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/09 21:00:44
// Design Name: 
// Module Name: AdvanceDecide
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


module AdvanceDecide(
    input [31:0] readdata1,readdata2,
    input isequal,
    output reg satisfy
    );
    initial begin
        satisfy=0;
    end
    always @ (readdata1 or readdata2 or isequal)
    begin
        if(isequal)
            satisfy=(readdata1==readdata2);
        else
            satisfy=!(readdata1==readdata2);
    end
endmodule
