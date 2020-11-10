`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/29 19:21:55
// Design Name: 
// Module Name: PC
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


module PC(
    input Clk,
    input reset,
    input flush,
    input [31:0] address,
    output reg [31:0]instaddress,
    output reg flushdeal
    );
    initial begin
        instaddress=0;
        flushdeal=0;
    end
    always @(posedge reset)
    begin
        if(reset)
            instaddress<=0;
    end
    always @(posedge Clk)
    begin
       if(!reset)
            if(flush)
                begin
                    if(instaddress==address)
                        instaddress<=instaddress;
                    else
                        instaddress<=address;
                    flushdeal<=1;
                end
            else
                begin
                    instaddress<=address;
                    flushdeal<=0;
                end
    end

    
endmodule
