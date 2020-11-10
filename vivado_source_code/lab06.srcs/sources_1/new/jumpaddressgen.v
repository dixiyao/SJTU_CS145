`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/08 10:34:25
// Design Name: 
// Module Name: jumpaddressgen
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


module jumpaddressgen(
    input jump,jr,
    input [31:0] instaddress,instruction,readdata1,
    output reg [31:0] jumpaddress
    );
    reg [25:0] temp;
    initial begin
        jumpaddress=0;
    end
    always @ (jump or jr or readdata1 or instaddress or instruction)
    begin
           if(jr)
                jumpaddress=readdata1;   
           else
            begin
                  temp=instruction[25:0]<<2;
                  jumpaddress={instaddress[31:28],temp};               
            end     
    end
endmodule
