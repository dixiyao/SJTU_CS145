module MuxAlu(
    input [31:0] input1,
    input [31:0] input2,
    input select,
    output [31:0] output1
    );
    assign output1=select?input1:input2;
endmodule