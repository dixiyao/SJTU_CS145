`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 17:45:44
// Design Name: 
// Module Name: InstMemory
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


module InstMemory(
    input [31:0] instaddress,
    input flushdeal,
    output reg [31:0] Instruction,
    output reg flush
    );
    reg [31:0] InstMemFile[31:0];
    reg [31:0] nextinstruction;
    reg [4:0]  des,src1,src2;
    reg flag;
    initial begin
         Instruction=0;
         flush=0;
         $readmemb("C:/Archlabs/lab06/lab06.srcs/Src/inst.txt",InstMemFile);
    end
    always @ (instaddress or flushdeal )
        begin
            nextinstruction=InstMemFile[{instaddress[6:2]}];
            flush=0;
            if((!Instruction==0))
                begin
                    flag=0;
                    /*
                    // R&R
                    if(Instruction[31:26]==6'b000000 && nextinstruction[31:26]==6'b000000
                    && (Instruction[15:11]==nextinstruction[25:21] ||
                        Instruction[15:11]==nextinstruction[20:16]))flag=1;
                    //R&I
                    if(Instruction[31:26]==6'b000000 && (!nextinstruction[31:26]==6'b000000
                    && !nextinstruction[31:26]==6'b000010&&!nextinstruction[31:26]==6'b000011)
                    && (Instruction[15:11]==nextinstruction[25:21]))flag=1;
                    //I&R
                     if((!Instruction[31:26]==6'b000000&&!Instruction[31:26]==6'b000010
                     &&!Instruction[31:26]==6'b000011)&& nextinstruction[31:26]==6'b000000
                      && (Instruction[20:16]==nextinstruction[25:21] ||
                        Instruction[20:16]==nextinstruction[20:16]))flag=1;
                    //I&I
                      if((!Instruction[31:26]==6'b000000&&!Instruction[31:26]==6'b000010
                     &&!Instruction[31:26]==6'b000011)&& (!nextinstruction[31:26]==6'b000000
                     && !nextinstruction[31:26]==6'b000010&&!nextinstruction[31:26]==6'b000011)
                      && (Instruction[20:16]==nextinstruction[25:21]))flag=1;
                   */
                   //load ЦёБо
                   //load&R
                   if(Instruction[31:26]==6'b100011 && nextinstruction[31:26]==6'b000000
                    && (Instruction[20:16]==nextinstruction[25:21] ||
                        Instruction[20:16]==nextinstruction[20:16]))flag=1;
                   //load &I
                    if(Instruction[31:26]==6'b100011 && (!nextinstruction[31:26]==6'b000000
                    && !nextinstruction[31:26]==6'b000010&&!nextinstruction[31:26]==6'b000011)
                    && (Instruction[20:16]==nextinstruction[25:21]))flag=1;     
                   //beq bne j jal
                   if(Instruction[31:26]==6'b000100 || Instruction[31:26]==6'b000101||
                      Instruction[31:26]==6'b000010 || Instruction[31:26]==6'b000011)
                      flag=1;
                  //jr
                  if(Instruction[31:26]==6'b0000000  && Instruction[5:0]==6'b001000)
                    flag=1;  
                  //R&bne beq
                  if(Instruction[31:26]==6'b000000 &&
                    (Instruction[31:26]==6'b000100 || Instruction[31:26]==6'b000101)
                    &&(Instruction[15:11]==nextinstruction[25:21]||
                        Instruction[15:11]==nextinstruction[20:16]))
                    flag=1;
                  // R&jr
                  if(Instruction[31:26]==6'b000000&&
                    (Instruction[31:26]==6'b0000000  && Instruction[5:0]==6'b001000)&&
                    (Instruction[15:11]==nextinstruction[25:21]))
                    flag=1;
                end
          if(flushdeal)
                    flag=0;
          if(flag)
                    begin                                      
                        flush=1;
                        Instruction=0;
                    end
            else
                Instruction=nextinstruction;
        end
       
endmodule
