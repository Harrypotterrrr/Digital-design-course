`timescale 1ns / 1ps
module Synchronous_D_FF_test;
    reg CLK; //ʱ���źţ���������Ч
    reg D; //�����ź� D
    reg RST_n; //��λ�źţ��͵�ƽ��Ч
    wire Q1; //����ź� Q
    wire Q2; //����ź� ?
    initial begin
        CLK = 0;
        RST_n = 1;
        D = 1;
    end
    
    always #40 D = ~D;
    always #10 CLK = ~CLK;
    always #80 RST_n = ~RST_n;
    
    Synchronous_D_FF
    Synchronous_D_FF_test(
        .CLK(CLK),
        .D(D),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
    );
endmodule