module mux(
    input [4:0] input1,
    input [4:0] input2,
    input select,
    output [4:0] output1
    );
    assign output1=select?input1:input2;
endmodule