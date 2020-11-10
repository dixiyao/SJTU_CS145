`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 14:00:44
// Design Name: 
// Module Name: Pcadd4
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


module Pcadd4(
    input [31:0] instaddressin,
    input flush,
    output[31:0] instaddressout
    );
    assign instaddressout=flush?instaddressin:instaddressin+4;
endmodule
