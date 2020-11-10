`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/31 11:46:47
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb(

    );
    reg Clk;
    reg reset;
    Top u0(
        .Clk(Clk),
        .reset(reset)
    );
    parameter PERIOD=50;
    always #(PERIOD) Clk=!Clk;
    initial
    begin
         Clk=1;reset=1;
         #5 reset=0;
    end
endmodule
