`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/29 19:03:13
// Design Name: 
// Module Name: Top
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


module Top(
    input Clk,
    input reset
    );
    //wires are all output
    //PC mux
    wire [31:0] instaddresspcmux;
    //PC wires
    wire [31:0] instaddressPC;
    wire flushdeal;
    //PCadd4
    wire [31:0] instaddressPC4;
    //instmemory wires
    wire [31:0] InstructionIM;
    wire flush;
    //IFID register wires
    wire [31:0] Instructionifid;
    wire [31:0] instaddressifid;
    //Ctr wires
    wire regDstctr,aluSrcctr,memToRegctr,regWritectr,memReadctr,memWritectr
                    ,Branchctr,Jumpctr,jrctr,jalctr,equal,unext;
    wire [3:0]ALUOpctr;
    //registers wires
    wire [31:0]readdata1reg;
    wire [31:0]readdata2reg;
    //sign extend wires
    wire [31:0] extenddataext;
    //jumpaddressgenerator wire
    wire [31:0] jumpaddress;
        //addressgenerator wires
    wire [31:0] branchaddress;
    //advance predictor 
    wire satisfy;
    //IDEX wires
    wire regDst,aluSrc,memToRegidex,regWriteidex,memReadidex,memWriteidex
                    ,Jumpidex,jridex,jalidex;
    wire [3:0]ALUOp;
    wire [31:0]instaddressidex,readdata1idex,readdata2idex,signextidex;
    wire [4:0] instruction2016idex,instruction1511idex;
    //muxalu wires
    wire [31:0] aluinput;
    //alucontrol wires
    wire [4:0]aluctrout;
    //alu wires
    wire zeroalu;
    wire [31:0] aluresalu;
    //muxWriteReg wires
    wire [4:0]writeregmux;
    //exmem wiers
    wire regWriteexmem,memToRegexmem,jalexmem,memWrite,memRead;
    wire [31:0] aluresultexmem,readdata2exmem,instaddressexmem;
    wire [4:0]  regdistaddressexmem;
    // memory wires
    wire [31:0]memoryreaddata;
    //memwb wires
    wire regWrite,memToReg,jal;
    wire  [31:0] instaddressmemwb,readdata1memwb,readdata2memwb;
    wire [4:0] regdistmemwb;
    //mux memory wires
    wire  [31:0]writedata;
                 
    // IF             
    muxpc Muxpc(.jump(Jumpctr|jrctr),.jumpaddress(jumpaddress),.pcadd4address(instaddressPC4)
                ,.branch(Branchctr&satisfy),.branchaddress(branchaddress),.output1(instaddresspcmux));             
    PC pc(.Clk(Clk),.reset(reset),.address(instaddresspcmux),.instaddress(instaddressPC)
           ,.flush(flush),.flushdeal(flushdeal));
    Pcadd4 pcadd4(.instaddressin(instaddressPC),.instaddressout(instaddressPC4),.flush(flush));
    InstMemory instmemory(.instaddress(instaddressPC),.Instruction(InstructionIM)
                        ,.flush(flush),.flushdeal(flushdeal));
    IFID ifid(.Clk(Clk),.instaddress(instaddressPC4),.instruction(InstructionIM),.instructionout(Instructionifid),
              .instaddressout(instaddressifid));
    //ID
    Ctr ctr(.Instruction(Instructionifid),.regDst(regDstctr),.aluSrc(aluSrcctr)
            ,.memToReg(memToRegctr),.regWrite(regWritectr),.memRead(memReadctr),
            .memWrite(memWritectr),.Branch(Branchctr),.Jump(Jumpctr),.ALUOp(ALUOpctr),
            .jr(jrctr),.jal(jalctr),.reset(reset),.equal(equal),.unsignedext(unext));
    Registers registers(.readReg1(Instructionifid[25:21]),.readReg2(Instructionifid[20:16]),.writeReg(regdistmemwb)
                        ,.writeData(writedata),.regWrite(regWrite),.reset(reset),.Clk(Clk)
                        ,.readData1(readdata1reg),.readData2(readdata2reg));
    signext signext0(.inst(Instructionifid[15:0]),.data(extenddataext),.unext(unext));
    jumpaddressgen Jumpaddressgen(.jump(Jumpctr),.jr(jrctr),.instaddress(instaddressifid)
                                ,.instruction(Instructionifid),.readdata1(readdata1reg),.jumpaddress(jumpaddress));
    addressgen addressGen(.instaddress(instaddressifid),.signext(extenddataext),.branchaddress(branchaddress));                            
    AdvanceDecide advancedecide(.readdata1(readdata1reg),.readdata2(readdata2reg),.isequal(equal),
            .satisfy(satisfy));
    //EX
    IDEX idex(.Clk(Clk),.instruction(Instructionifid),
              .signext(extenddataext),.readdata1(readdata1reg),.readdata2(readdata2reg),.instaddress(instaddressifid),
              .regDst(regDstctr),.aluSrc(aluSrcctr),.memToReg(memToRegctr),.regWrite(regWritectr),.memRead(memReadctr),
            .memWrite(memWritectr),.Jump(Jumpctr),.ALUOp(ALUOpctr),.jr(jrctr),.jal(jalctr),
            .regDstout(regDst),.aluSrcout(aluSrc),.regWriteout(regWriteidex),.memToRegout(memToRegidex), 
            .memReadout(memReadidex),.memWriteout(memWriteidex)
            ,.jalout(jalidex),.ALUOpout(ALUOp),.instaddressout(instaddressidex),.readdata1out(readdata1idex),
            .readdata2out(readdata2idex),.signextout(signextidex),.instruction2016out(instruction2016idex),
            .instruction1511out(instruction1511idex),.lastaluresultin(aluresalu),.lastregdistin(writeregmux),
            .currentreg1(Instructionifid[25:21]),.currentreg2(Instructionifid[20:16]),
            .lastlastisload(memRead),.loadregdist(regdistaddressexmem)
            ,.loadmemresult(memoryreaddata));
    aluCtr aluctr(.ALUOp(ALUOp),.funct(signextidex[5:0]),.ALUCtrOut(aluctrout));
    MuxAlu muxalu(.input1(signextidex),.input2(readdata2idex),.select(aluSrc),.output1(aluinput));
    Alu alu(.input1(readdata1idex),.input2(aluinput),.aluCtr(aluctrout),.zero(zeroalu)
            ,.aluRes(aluresalu),.shamet(signextidex[10:6]));
    muxWriteReg muxwritereg(.input1(instruction1511idex),.input2(instruction2016idex),.select(regDst),.output1(writeregmux)
                            ,.ifjal(jalidex));
    //MEM
    EXMEM exmem(.Clk(Clk),.regWrite(regWriteidex),.memToReg(memToRegidex),.memRead(memReadidex),.memWrite(memWriteidex),
                 .jal(jalidex),.instaddress(instaddressidex),
                 .aluresult(aluresalu),.readdata2(readdata2idex),.regdistaddress(writeregmux),
                 .regWriteout(regWriteexmem),.memToRegout(memToRegexmem),.jalout(jalexmem),
                 .memWriteout(memWrite),.memReadout(memRead),.aluresultout(aluresultexmem),
                 .readdata2out(readdata2exmem),.instaddressout(instaddressexmem),.regdistaddressout(regdistaddressexmem));
     dataMemory datamemory(.Clk(Clk),.address(aluresultexmem),.writeData(readdata2exmem),.memWrite(memWrite),
                           .memRead(memRead),.readData(memoryreaddata));
    //WB
    MEMWB memwb(.Clk(Clk),.regWrite(regWriteexmem),.memToReg(memToRegexmem),.jal(jalexmem),.instaddress(instaddressexmem),
                .regwritedata1(memoryreaddata),.regwritedata2(aluresultexmem),.regdist(regdistaddressexmem),
                .regWriteout(regWrite),.memToRegout(memToReg),.jalout(jal),.instaddressout(instaddressmemwb),
                .regwritedata1out(readdata1memwb),.regwritedata2out(readdata2memwb),.regdistout(regdistmemwb));
    muxMemory muxmemory(.input1(readdata1memwb),.input2(readdata2memwb),.select(memToReg),.output1(writedata)
                       ,.ifjal(jal),.saveaddress(instaddressmemwb));
endmodule
