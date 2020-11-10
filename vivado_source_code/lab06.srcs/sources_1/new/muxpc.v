`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 14:09:02
// Design Name: 
// Module Name: muxpc
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


module muxpc(
    input [31:0] jumpaddress,branchaddress,pcadd4address,
    input branch,jump,
    output reg [31:0] output1
    );
    initial begin
    output1=0;
    end
    always @ (*)
    begin
        output1=pcadd4address;
        if(jump==1)
            output1=jumpaddress;
        if(branch==1)
            output1=branchaddress;
    end
endmodule
