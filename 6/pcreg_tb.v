`timescale 1ns / 1ps
module pcreg_tb;
    reg clk; //1 λ���룬�Ĵ���ʱ���źţ�������ʱΪ PC �Ĵ�����ֵ
    reg rst; //1 λ���룬 �첽�����źţ��ߵ�ƽʱ�� PC �Ĵ�������
    //ע���� ena �ź���Чʱ�� rst Ҳ�������üĴ���
    reg ena; //1 λ����,��Ч�źŸߵ�ƽʱ PC �Ĵ������� data_in
    //��ֵ�����򱣳�ԭ�����
    reg [31:0] data_in; //32 λ���룬�������ݽ�������Ĵ����ڲ�
    wire [31:0] data_out; //32 λ���������ʱʼ����� PC
    //�Ĵ����ڲ��洢��ֵ

    initial begin
        clk = 0;
        rst = 0;
        ena = 0;
        data_in = 32'b11111111111111111111111111111111;
        #160
        data_in = 32'b00000000000000001111111111111111;
    end
    always #20 clk = ~clk;
    always #40 ena = ~ena;
    always #80 rst = ~rst;
    pcreg
    pcreg_test(
        .clk(clk),
        .rst(rst),
        .ena(ena),
        .data_in(data_in),
        .data_out(data_out)
    );
endmodule