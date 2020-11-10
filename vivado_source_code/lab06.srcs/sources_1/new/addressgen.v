`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/06 18:01:23
// Design Name: 
// Module Name: addressgen
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


module addressgen(
    input [31:0]instaddress,signext,
    output reg [31:0] branchaddress
    );
    
    initial begin
        branchaddress=0;
    end
    always @ (instaddress or signext)
    begin
         branchaddress=$signed(instaddress)+($signed(signext)<<<2);
    end
endmodule

