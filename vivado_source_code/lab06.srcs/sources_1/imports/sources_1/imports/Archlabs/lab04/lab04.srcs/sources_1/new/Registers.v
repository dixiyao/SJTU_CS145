`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 13:30:01
// Design Name: 
// Module Name: Registers
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


module Registers(
    input [4:0] readReg1,
    input [4:0] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    input regWrite,
    input Clk,
    input reset,
    output reg [31:0] readData1,
    output reg [31:0] readData2
    );
    reg [31:0] regFile[0:31];
    integer i;
    initial
    begin
            readData1=0;
            readData2=0;
            for(i=0;i<32;i=i+1)
                 regFile[i]=0; 
    end
    always @ (negedge Clk)
        begin
            readData1<=regFile[readReg1];
            readData2<=regFile[readReg2];       
        end     
       
    always @ (writeData or regWrite or writeReg or posedge reset)
        begin
            if(reset)
                begin
                        for(i=1;i<32;i=i+1)
                            regFile[i]=0;  
               end    
            else
                if(regWrite==1)
                    regFile[writeReg]=writeData;
        end
        
endmodule
