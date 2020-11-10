`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/07 17:18:00
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(
    input Clk,
    input  regWrite,memToReg,memRead,memWrite,
                jal,
    input [31:0] instaddress,aluresult,readdata2,
    input [4:0] regdistaddress,
    output reg regWriteout,memToRegout,jalout,memWriteout,memReadout,
    output reg [31:0] aluresultout,readdata2out,instaddressout,
    output reg [4:0]regdistaddressout
    );
    initial begin
        regWriteout=0;
        memToRegout=0;
        jalout=0;
        aluresultout=0;
        readdata2out=0;
        instaddressout=0;
        regdistaddressout=0;
        memWriteout=0;
        memReadout=0;
   end
   always @ (posedge Clk)
   begin
            regWriteout<=regWrite;
            memToRegout<=memToReg;
            jalout<=jal;
            aluresultout<=aluresult;
            readdata2out<=readdata2;
            instaddressout<=instaddress;
            regdistaddressout<=regdistaddress;
            memWriteout<=memWrite;
            memReadout<=memRead;
   end
endmodule
