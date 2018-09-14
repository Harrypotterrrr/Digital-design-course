`timescale 1ns / 1ps
module Pcreg(
    input clk, //1 λ���룬�Ĵ���ʱ���źţ�������ʱΪ PC �Ĵ�����ֵ
    input rst, //1 λ���룬 �첽�����źţ��ߵ�ƽʱ�� PC �Ĵ�������
    //ע���� ena �ź���Чʱ�� rst Ҳ�������üĴ���
    input ena, //1 λ����,��Ч�źŸߵ�ƽʱ PC �Ĵ������� data_in��ֵ�����򱣳�ԭ�����
    input [31:0] data_in, //32 λ���룬�������ݽ�������Ĵ����ڲ�
    output wire [31:0] data_out //32 λ���������ʱʼ����� PC
    //�Ĵ����ڲ��洢��ֵ
);
    genvar i;
    generate
        for(i = 0 ; i <= 31 ; i = i + 1) begin
            Asynchronous_D_pcreg
            Asynchronous_D_pcreg_test0(
                .CLK(clk),
                .D(data_in[i]),
                .RST_n(rst),
                .ena(ena),
                .Out(data_out[i])
            );
        end
    endgenerate
endmodule
