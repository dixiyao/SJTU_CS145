`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 13:39:54
// Design Name: 
// Module Name: IFID
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


module IFID(
    input Clk,
    input [31:0] instaddress,
    input [31:0] instruction,
    output reg [31:0] instructionout,
    output reg [31:0] instaddressout
    );
    initial begin
        instructionout=0;
        instaddressout=0;
    end
    always @ (posedge Clk)
    begin
          instaddressout<=instaddress;
          instructionout<=instruction;
    end
endmodule
