`timescale 1ns / 1ps
module Regfiles(
    input clk, //�Ĵ�����ʱ���źţ��½���д������
    input rst, //reset �źţ��첽��λ���ߵ�ƽʱȫ���Ĵ�������
    input we, //�Ĵ�����д��Ч�źţ��ߵ�ƽʱ����Ĵ���д�����ݣ��͵�ƽʱ����Ĵ�����������
    input [4:0] raddr1, //�����ȡ�ļĴ����ĵ�ַ
    input [4:0] raddr2, //�����ȡ�ļĴ����ĵ�ַ
    input [4:0] waddr, //д�Ĵ����ĵ�ַ
    input [31:0] wdata, //д�Ĵ������ݣ������� clk �½���ʱ��д��
    output [31:0] rdata1, //raddr1 ����Ӧ�Ĵ������������
    output [31:0] rdata2 //raddr2 ����Ӧ�Ĵ������������
    );
    wire [31:0]ValidReg;    //�ߵ�ƽΪ��Ч
    wire [31:0]OutReg[31:0];
    Decoder Decoder_test(
        .iData(waddr),
        .iEna(we),
        .oData(ValidReg)
    );
    genvar i;
    generate
    for(i = 1 ; i <= 31 ; i = i + 1) begin
        Pcreg Pcreg_test(
            .clk(~clk),
            .rst(rst),
            .ena(ValidReg[i]),
            .data_in(wdata),
            .data_out(OutReg[i])
        );
    end
    endgenerate

    Selector Selector_test1(
        .iC0(OutReg[0]),
        .iC1(OutReg[1]),
        .iC2(OutReg[2]),
        .iC3(OutReg[3]),        
        .iC4(OutReg[4]),
        .iC5(OutReg[5]),
        .iC6(OutReg[6]),
        .iC7(OutReg[7]),  
        .iC8(OutReg[8]),
        .iC9(OutReg[9]),
        .iC10(OutReg[10]),
        .iC11(OutReg[11]),
        .iC12(OutReg[12]),
        .iC13(OutReg[13]),        
        .iC14(OutReg[14]),
        .iC15(OutReg[15]),
        .iC16(OutReg[16]),
        .iC17(OutReg[17]),  
        .iC18(OutReg[18]),
        .iC19(OutReg[19]),        
        .iC20(OutReg[20]),
        .iC21(OutReg[21]),
        .iC22(OutReg[22]),
        .iC23(OutReg[23]),        
        .iC24(OutReg[24]),
        .iC25(OutReg[25]),
        .iC26(OutReg[26]),
        .iC27(OutReg[27]),  
        .iC28(OutReg[28]),
        .iC29(OutReg[29]),
        .iC30(OutReg[30]),
        .iC31(OutReg[31]),
        .Control(raddr1),
        .ena(we),
        .oZ(rdata1)
    );
        Selector Selector_test2(
         .iC0(OutReg[0]),
        .iC1(OutReg[1]),
        .iC2(OutReg[2]),
        .iC3(OutReg[3]),        
        .iC4(OutReg[4]),
        .iC5(OutReg[5]),
        .iC6(OutReg[6]),
        .iC7(OutReg[7]),  
        .iC8(OutReg[8]),
        .iC9(OutReg[9]),
        .iC10(OutReg[10]),
        .iC11(OutReg[11]),
        .iC12(OutReg[12]),
        .iC13(OutReg[13]),        
        .iC14(OutReg[14]),
        .iC15(OutReg[15]),
        .iC16(OutReg[16]),
        .iC17(OutReg[17]),  
        .iC18(OutReg[18]),
        .iC19(OutReg[19]),        
        .iC20(OutReg[20]),
        .iC21(OutReg[21]),
        .iC22(OutReg[22]),
        .iC23(OutReg[23]),        
        .iC24(OutReg[24]),
        .iC25(OutReg[25]),
        .iC26(OutReg[26]),
        .iC27(OutReg[27]),  
        .iC28(OutReg[28]),
        .iC29(OutReg[29]),
        .iC30(OutReg[30]),
        .iC31(OutReg[31]),
        .Control(raddr2),
        .ena(we),
        .oZ(rdata2)
    );
endmodule
