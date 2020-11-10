module muxWriteReg(
    input [4:0] input1,
    input [4:0] input2,
    input select,
    input ifjal,
    output reg [4:0] output1
    );
    initial begin
    output1=0;
    end
    always @(*)
    begin
        if(ifjal)
            output1=5'b11111;
        else
            output1=select?input1:input2;
    end
endmodule