`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/07 18:00:20
// Design Name: 
// Module Name: MEMWB
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


module MEMWB(
    input Clk,
    input regWrite,memToReg,jal,
    input [31:0] instaddress,regwritedata1,regwritedata2,
    input [4:0] regdist,
    output reg regWriteout,memToRegout,jalout,
    output reg [31:0] instaddressout,regwritedata1out,regwritedata2out,
    output reg [4:0] regdistout
    );
    initial begin
        regWriteout=0;
        memToRegout=0;
        jalout=0;
        instaddressout=0;
        regwritedata1out=0;
        regwritedata2out=0;
        regdistout=0;
    end
    always @ (posedge Clk)
    begin
            regWriteout<=regWrite;
            memToRegout<=memToReg;
            jalout<=jal;
            instaddressout<=instaddress;
            regwritedata1out<=regwritedata1;
            regwritedata2out<=regwritedata2;
            regdistout<=regdist;       
    end
endmodule
