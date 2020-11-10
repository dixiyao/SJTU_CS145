`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 14:58:23
// Design Name: 
// Module Name: IDEX
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


module IDEX(
    input Clk,
    input [31:0] signext,readdata1,readdata2,instaddress,instruction,
    input regDst,aluSrc,regWrite,memToReg,
          memRead, memWrite,Jump,jr,jal,
    input [3:0] ALUOp,
    input [4:0]currentreg1,currentreg2,
    input [4:0] lastregdistin,
    input [31:0] lastaluresultin,
    input lastlastisload,
    input [4:0] loadregdist,
    input [31:0] loadmemresult,
    output reg regDstout,aluSrcout,regWriteout,
               memToRegout, memReadout,memWriteout,
                Jumpout,jrout,jalout,
    output reg [3:0]ALUOpout,
    output reg [31:0]instaddressout,readdata1out,readdata2out,
                      signextout,
    output reg [4:0] instruction2016out,instruction1511out
    );
    reg [31:0]lastlastaluresult,lastaluresult,lastaluresulttemp;
    reg [4:0] lastlastregdist,lastregdist,lastregdisttemp;
    reg lastisload;
    initial begin
        regDstout=0;
        aluSrcout=0;
        regWriteout=0;
        memToRegout=0;
        memReadout=0;
        memWriteout=0;
        Jumpout=0;
        jrout=0;
        jalout=0;
        ALUOpout=0;
        instaddressout=0;
        readdata1out=0;
        readdata2out=0;
        signextout=0;
        instruction2016out=0;
        instruction1511out=0;
    end
    always @(posedge Clk)
    begin
            regDstout<=regDst;
            aluSrcout<=aluSrc;
            regWriteout<=regWrite;
            memToRegout<=memToReg;
            memReadout<=memRead;
            memWriteout<=memWrite;
            Jumpout<=Jump;
            jrout<=jr;
            jalout<=jal;
            ALUOpout<=ALUOp;
            instaddressout<=instaddress;
            //readdata1out<=readdata1;
            //readdata2out<=readdata2;
            signextout<=signext;
            instruction2016out<=instruction[20:16];
            instruction1511out<=instruction[15:11];
            if((!lastisload) && currentreg1==lastregdist)
                readdata1out<=lastaluresult;
            else if((!lastisload) && currentreg1==lastlastregdist)
                readdata1out<=lastlastaluresult;
            else if(lastlastisload && currentreg1==loadregdist)
                readdata1out<=loadmemresult;
            else
                readdata1out<=readdata1; 
            if((!lastisload) && currentreg2==lastregdist)
                readdata2out<=lastaluresult;
            else if((!lastisload) && currentreg2==lastlastregdist)
                readdata2out<=lastlastaluresult;
            else if(lastlastisload && currentreg2==loadregdist)
                readdata2out<=loadmemresult;                
            else
                readdata2out<=readdata2;  
            lastregdisttemp<=lastregdist;
            lastaluresulttemp<=lastaluresult;   
            lastisload<=memRead||memWrite;           
    end
    always @(negedge Clk)
    begin
            lastlastregdist<=lastregdisttemp;
            lastlastaluresult<=lastaluresulttemp;
            lastregdist<=lastregdistin;
            lastaluresult<=lastaluresultin;   
    end
endmodule
